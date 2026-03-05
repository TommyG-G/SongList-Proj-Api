package com.ruoyi.songList.service.impl;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.vo.giftVo;
import com.ruoyi.songList.vo.SongListOperationResult;
import com.ruoyi.system.service.impl.SysUserServiceImpl;
import jakarta.validation.Validator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.songList.mapper.SongListMapper;
import com.ruoyi.songList.domain.SongList;
import com.ruoyi.songList.service.ISongListService;

/**
 * 歌单Service业务层处理
 * 
 * @author TommyG
 * @date 2026-02-26
 */
@Service
public class SongListServiceImpl implements ISongListService 
{

    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);

    @Autowired
    private SongListMapper songListMapper;

    @Autowired
    protected Validator validator;

    /**
     * 查询歌单
     * 
     * @param id 歌单主键
     * @return 歌单
     */
    @Override
    public SongList selectSongListById(Long id)
    {
        return songListMapper.selectSongListById(id);
    }

    /**
     * 查询歌单列表
     *
     * @param songList 歌单
     * @return 歌单
     */
    @Override
    public List<SongList> selectSongListList(SongList songList)
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        
        // 如果不是超级管理员，则只查询当前用户上传的歌单
        if (loginUser != null && !loginUser.getUser().isAdmin()) {
            songList.setUploader(loginUser.getUserId().toString());
        }
        
        return songListMapper.selectSongListList(songList);
    }

    /**
     * 新增歌单
     * 
     * @param songList 歌单
     * @return 结果
     */
    @Override
    public SongListOperationResult insertSongList(SongList songList)
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        String currentUserId = loginUser != null ? loginUser.getUserId().toString() : "";
        
        // 检测是否有同名记录
        SongList existingSongList = songListMapper.selectSongListByMusicName(songList.getMusicName());
        
        if (existingSongList != null) {
            // 存在同名记录，执行更新操作
            songList.setId(existingSongList.getId());
            
            // 处理uploader字段：只有当当前用户不在原有的uploader中时，才需要追加
            String originalUploader = existingSongList.getUploader();
            if (StringUtils.isNotEmpty(originalUploader) && !originalUploader.contains(currentUserId)) {
                String newUploader = originalUploader + "," + currentUserId;
                songList.setUploader(newUploader);
            } else if (StringUtils.isEmpty(originalUploader)) {
                songList.setUploader(currentUserId);
            }
            // 如果当前用户已经在uploader中存在，则不进行任何修改，保持原有uploader
            
            int result = songListMapper.updateSongList(songList);
            String message = "歌曲 '" + songList.getMusicName() + "' 已存在，已自动更新为最新信息";
            return new SongListOperationResult("UPDATE", result, message);
        } else {
            // 不存在同名记录，执行新增操作
            songList.setUploader(currentUserId);
            int result = songListMapper.insertSongList(songList);
            String message = "歌曲 '" + songList.getMusicName() + "' 新增成功";
            return new SongListOperationResult("INSERT", result, message);
        }
    }

    /**
     * 修改歌单
     * 
     * @param songList 歌单
     * @return 结果
     */
    @Override
    public int updateSongList(SongList songList)
    {
        // 获取当前登录用户
        LoginUser loginUser = SecurityUtils.getLoginUser();
        String currentUserId = loginUser != null ? loginUser.getUserId().toString() : "";
        
        // 查询原有记录获取uploader信息
        SongList originalSongList = songListMapper.selectSongListById(songList.getId());
        if (originalSongList != null && StringUtils.isNotEmpty(currentUserId)) {
            String originalUploader = originalSongList.getUploader();
            
            // 只有当当前用户不在原有的uploader中时，才需要追加
            // 这样可以避免同一个人多次操作同一记录时重复添加自己的ID
            if (StringUtils.isNotEmpty(originalUploader) && !originalUploader.contains(currentUserId)) {
                String newUploader = originalUploader + "," + currentUserId;
                songList.setUploader(newUploader);
            } else if (StringUtils.isEmpty(originalUploader)) {
                // 如果原记录没有uploader，则设置为当前用户ID
                songList.setUploader(currentUserId);
            }
            // 如果当前用户已经在uploader中存在，则不进行任何修改，保持原有uploader
        }
        
        return songListMapper.updateSongList(songList);
    }

    /**
     * 批量删除歌单
     * 
     * @param ids 需要删除的歌单主键
     * @return 结果
     */
    @Override
    public int deleteSongListByIds(Long[] ids)
    {
        return songListMapper.deleteSongListByIds(ids);
    }

    /**
     * 删除歌单信息
     * 
     * @param id 歌单主键
     * @return 结果
     */
    @Override
    public int deleteSongListById(Long id)
    {
        return songListMapper.deleteSongListById(id);
    }

    @Override
    public List<giftVo> selectGiftList(List<GiftSearchParam> giftSearchParam){
        return songListMapper.selectGiftList(giftSearchParam);
    }

    @Override
    public String importSong(List<SongList> songList, Boolean isUpdateSupport, String operName){
        if (StringUtils.isNull(songList) || songList.size() == 0)
        {
            throw new ServiceException("导入歌单数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (SongList music : songList)
        {
            try
            {
                // 验证是否存在这个用户
                SongList s = songListMapper.selectSongListByMusicName(music.getMusicName());
                if (StringUtils.isNull(s))
                {
                    BeanValidators.validateWithException(validator, music);
                    music.setUploader(operName);
                    songListMapper.insertSongList(music);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、歌曲 " + music.getMusicName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    BeanValidators.validateWithException(validator, music);
                    // 更新时仅在原有uploader基础上追加当前登录人ID
                    // 只有当当前用户不在原有的uploader中时，才需要追加
                    String originalUploader = s.getUploader();
                    if (StringUtils.isNotEmpty(originalUploader) && !originalUploader.contains(operName)) {
                        String newUploader = originalUploader + "," + operName;
                        music.setUploader(newUploader);
                    } else if (StringUtils.isEmpty(originalUploader)) {
                        music.setUploader(operName);
                    }
                    // 如果当前用户已经在uploader中存在，则不进行任何修改，保持原有uploader
                    songListMapper.updateSongList(music);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、歌曲 " + music.getMusicName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、歌曲 " + music.getMusicName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、歌曲 " + music.getMusicName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
