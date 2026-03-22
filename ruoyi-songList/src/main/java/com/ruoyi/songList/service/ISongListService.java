package com.ruoyi.songList.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.songList.domain.SongList;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.param.SongListSearchParam;
import com.ruoyi.songList.vo.SongListExportVo;
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
     * 查询歌单列表用于歌单管理
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

    public String importSong(List<SongList> songList, String operName);

    /**
     * 查询歌单显示列配置
     *
     * @return 显示的列数组
     */
    public List<String> selectShowColumns();

    /**
     * 通过外部指定的用户 UID 直接查询该人的显示配置（用于免认证）
     */
    public List<String> selectShowColumnsByUid(Long uid);

    /**
     * 保存歌单显示列配置
     *
     * @param columns 要显示的列列表
     * @return 操作结果
     */
    public int saveShowColumns(List<String> columns);

    /**
     * 动态查询目前在库中真实存在的有效曲风列表，解析 JSON 截断层级后进行回显
     * 
     * @return 可用的列表，提供给前端 el-select 生成的带有 label/value 的 Map 数组
     */
    public List<java.util.Map<String, String>> getExistingMusicalStyles();

    /**
     * 参数版查询真实存在有效曲风
     */
    public List<java.util.Map<String, String>> getExistingMusicalStylesByUid(String uploaderId);

    /**
     * 查询曲风字典数据
     *
     * @return 曲风字典数据列表
     */
    public List<Object> selectMusicalStyle();

    /**
     * 查询歌单列表用于歌单展示
     *
     * @param songList 歌单
     * @return 歌单集合
     */
    public List<SongList> selectSongList(SongListSearchParam songList);

    /**
     * 查询歌单列表用于导出
     *
     * @param songList 歌单查询条件
     * @return 导出VO列表
     */
    public List<SongListExportVo> selectSongListForExport(SongList songList);

}
