package com.ruoyi.songList.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ruoyi.songList.domain.SongList;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.vo.giftVo;

/**
 * 歌单Mapper接口
 *
 * @author TommyG
 * @date 2026-02-26
 */
@Mapper
public interface SongListMapper
{
    /**
     * 查询歌单
     *
     * @param id 歌单主键
     * @return 歌单
     */
    SongList selectSongListById(Long id);

    /**
     * 通过歌曲名查询歌曲
     *
     * @param musicName 歌曲名称
     * @return 歌曲对象信息
     */
    SongList selectSongListByMusicName(String musicName);

    /**
     * 查询歌单列表
     *
     * @param songList 歌单
     * @return 歌单集合
     */
    List<SongList> selectSongListList(SongList songList);

    /**
     * 新增歌单
     *
     * @param songList 歌单
     * @return 结果
     */
    int insertSongList(SongList songList);

    /**
     * 修改歌单
     *
     * @param songList 歌单
     * @return 结果
     */
    int updateSongList(SongList songList);

    /**
     * 删除歌单
     *
     * @param id 歌单主键
     * @return 结果
     */
    int deleteSongListById(Long id);

    /**
     * 批量删除歌单
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteSongListByIds(Long[] ids);

    /**
     * 查询礼物信息列表
     *
     * @param giftSearchParam 礼物搜索参数列表
     * @return 礼物信息列表
     */
    List<giftVo> selectGiftList(List<GiftSearchParam> giftSearchParam);
}
