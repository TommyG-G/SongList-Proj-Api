package com.ruoyi.songList.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.songList.domain.SongList;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.vo.SongListOperationResult;
import com.ruoyi.songList.vo.giftVo;

/**
 * 歌单Service接口
 * 
 * @author TommyG
 * @date 2026-02-26
 */
public interface ISongListService 
{
    /**
     * 查询歌单
     * 
     * @param id 歌单主键
     * @return 歌单
     */
    public SongList selectSongListById(Long id);

    /**
     * 查询歌单列表
     * 
     * @param songList 歌单
     * @return 歌单集合
     */
    public List<SongList> selectSongListList(SongList songList);

    /**
     * 新增歌单
     *
     * @param songList 歌单
     * @return 操作结果（包含操作类型和提示信息）
     */
    public SongListOperationResult insertSongList(SongList songList);

    /**
     * 修改歌单
     * 
     * @param songList 歌单
     * @return 结果
     */
    public int updateSongList(SongList songList);

    /**
     * 批量删除歌单
     * 
     * @param ids 需要删除的歌单主键集合
     * @return 结果
     */
    public int deleteSongListByIds(Long[] ids);

    /**
     * 删除歌单信息
     * 
     * @param id 歌单主键
     * @return 结果
     */
    public int deleteSongListById(Long id);

    public List<giftVo> selectGiftList(List<GiftSearchParam> giftSearchParam);

    public String importSong(List<SongList> songList, Boolean isUpdateSupport, String operName);

    /**
     * 查询歌单显示列配置
     *
     * @return 显示的列数组
     */
    public List<String> selectShowColumns();

    /**
     * 保存歌单显示列配置
     *
     * @param columns 要显示的列列表
     * @return 操作结果
     */
    public int saveShowColumns(List<String> columns);
}
