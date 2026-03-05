package com.ruoyi.songList.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DictUtils;
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
                // 在验证和保存前进行字典转换
                convertDictValues(music);
                
                // 验证是否存在这个歌曲
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

    /**
     * 转换字典值
     * 将Excel中的中文显示值转换为数据库存储的字典值
     *
     * @param music 歌单对象
     */
    private void convertDictValues(SongList music) {
        // 语言字段转换：中文 -> 字典值
        if (StringUtils.isNotEmpty(music.getLanguage())) {
            String languageValue = DictUtils.getDictValue("song_language", music.getLanguage());
            if (StringUtils.isNotEmpty(languageValue)) {
                music.setLanguage(languageValue);
            } else {
                throw new ServiceException("语言 '" + music.getLanguage() + "' 不存在于字典中");
            }
        }

        // 曲风字段转换：汉字加"、"间隔符 -> 字典值用逗号分割
        if (StringUtils.isNotEmpty(music.getMusicalStyle())) {
            String musicalStyleValue = DictUtils.getDictValue("song_style", music.getMusicalStyle(), "、");
            if (StringUtils.isNotEmpty(musicalStyleValue)) {
                music.setMusicalStyle(musicalStyleValue);
            } else {
                throw new ServiceException("曲风 '" + music.getMusicalStyle() + "' 不存在于字典中");
            }
        }

        // 大航海字段转换：中文 -> 字典值
        if (StringUtils.isNotEmpty(music.getExclusiveLevel())) {
            String exclusiveLevelValue = DictUtils.getDictValue("exclusive_level", music.getExclusiveLevel());
            if (StringUtils.isNotEmpty(exclusiveLevelValue)) {
                music.setExclusiveLevel(exclusiveLevelValue);
            } else {
                throw new ServiceException("大航海 '" + music.getExclusiveLevel() + "' 不存在于字典中");
            }
        }
        // 歌切字段转换：中文 -> 字典值
        if (StringUtils.isNotEmpty(music.getSongSlice())) {
            String songSliceValue = DictUtils.getDictValue("song_slice", music.getSongSlice());
            if (StringUtils.isNotEmpty(songSliceValue)) {
                music.setSongSlice(songSliceValue);
            } else {
                throw new ServiceException("歌切 '" + music.getSongSlice() + "' 不存在于字典中");
            }
        }


        // 礼物字段转换：中文名称 -> 查询gift_list表并组合信息
        if (StringUtils.isNotEmpty(music.getGift())) {
            convertGiftValue(music);
        }
    }

    /**
     * 转换礼物值
     * 将Excel中的中文名称转换为gift_list表中的完整信息
     *
     * @param music 歌单对象
     */
    private void convertGiftValue(SongList music) {
        // 1. 从字典中获取对应的value值（即gift_list表的id）
        String giftDictValue = DictUtils.getDictValue("gift_list", music.getGift());
        if (StringUtils.isEmpty(giftDictValue)) {
            throw new ServiceException("礼物 '" + music.getGift() + "' 不存在于字典中");
        }
        try {
            // 2. 根据id查询gift_list表获取详细信息
            GiftSearchParam param = new GiftSearchParam();
            param.setLabel(music.getGift()); // 礼物名称
            param.setValue(giftDictValue);   // 对应的id
            List<GiftSearchParam> paramList = new ArrayList<>();
            paramList.add(param);
            List<giftVo> giftList = songListMapper.selectGiftList(paramList);
            if (giftList == null || giftList.isEmpty()) {
                throw new ServiceException("礼物 '" + music.getGift() + "' 在gift_list表中不存在");
            }
            giftVo giftInfo = giftList.get(0);
            // 3. 组合信息存储到gift字段
            // 格式：name,price,icon,value
            StringBuilder giftBuilder = new StringBuilder();
            giftBuilder.append(giftInfo.getName()).append(",")
                    .append(giftInfo.getPrice()).append(",")
                    .append(giftInfo.getIcon()).append(",")
                    .append(giftDictValue);
            music.setGift(giftBuilder.toString());
        } catch (Exception e) {
            throw new ServiceException("礼物 '" + music.getGift() + "' 信息查询失败：" + e.getMessage());
        }
    }


}
