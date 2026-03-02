package com.ruoyi.songList.service.impl;

import java.util.List;

import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.vo.giftVo;
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
    @Autowired
    private SongListMapper songListMapper;

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
        return songListMapper.selectSongListList(songList);
    }

    /**
     * 新增歌单
     * 
     * @param songList 歌单
     * @return 结果
     */
    @Override
    public int insertSongList(SongList songList)
    {
        return songListMapper.insertSongList(songList);
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
}
