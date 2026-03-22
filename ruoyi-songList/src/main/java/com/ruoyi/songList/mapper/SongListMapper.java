package com.ruoyi.songList.mapper;

import java.util.List;

import com.ruoyi.songList.param.SongListSearchParam;
import com.ruoyi.songList.vo.musicalStyleVo;
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
     * 通过歌曲名查询歌曲列表
     *
     * @param musicName 歌曲名称
     * @return 歌曲对象信息列表
     */
    List<SongList> selectSongListByMusicName(String musicName);

    /**
     * 获取数据库中已存在的纯曲风记录原始字符串（含有机型、二维数组JSON等）列表
     *
     * @param uploader 当前登录用户的ID（字符型）
     * @return 原始存储串集合
     */
    List<String> selectExistingMusicalStyles(String uploader);

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

    /**
     * 根据用户ID查询显示列配置
     *
     * @param userId 用户ID
     * @return 显示列配置字符串
     */
    String selectShowColumnsByUserId(Long userId);

    /**
     * 更新用户的显示列配置
     *
     * @param userId 用户ID
     * @param columns 显示列配置字符串
     * @return 操作结果
     */
    int updateShowColumns(Long userId, String columns);

    /**
     * 保存或更新用户的显示列配置
     *
     * @param userId 用户ID
     * @param columns 显示列配置字符串
     * @return 操作结果
     */
    int saveShowColumns(Long userId, String columns);

    /**
     * 根据曲风字典值查询音乐风格
     *
     * @param dictValue 曲风字典值
     * @return 操作结果
     */
    List<musicalStyleVo>selectMusicalStyleByDictValue(String dictValue);

    /**
     * 查询歌单列表
     *
     * @param songList 歌单
     * @return 歌单集合
     */
    List<SongList> selectSongList(SongListSearchParam songList);

}
