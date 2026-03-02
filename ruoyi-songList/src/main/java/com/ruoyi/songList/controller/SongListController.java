package com.ruoyi.songList.controller;

import java.util.List;

import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.vo.giftVo;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.songList.domain.SongList;
import com.ruoyi.songList.service.ISongListService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 歌单Controller
 * 
 * @author TommyG
 * @date 2026-02-26
 */
@RestController
@RequestMapping("/songList/info")
public class SongListController extends BaseController
{
    @Autowired
    private ISongListService songListService;

    /**
     * 查询歌单列表
     */
    @PreAuthorize("@ss.hasPermi('songList:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(SongList songList)
    {
        startPage();
        List<SongList> list = songListService.selectSongListList(songList);
        return getDataTable(list);
    }

    /**
     * 导出歌单列表
     */
    @PreAuthorize("@ss.hasPermi('songList:info:export')")
    @Log(title = "歌单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SongList songList)
    {
        List<SongList> list = songListService.selectSongListList(songList);
        ExcelUtil<SongList> util = new ExcelUtil<SongList>(SongList.class);
        util.exportExcel(response, list, "歌单数据");
    }

    /**
     * 获取歌单详细信息
     */
    @PreAuthorize("@ss.hasPermi('songList:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(songListService.selectSongListById(id));
    }

    /**
     * 新增歌单
     */
    @PreAuthorize("@ss.hasPermi('songList:info:add')")
    @Log(title = "歌单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SongList songList)
    {
        return toAjax(songListService.insertSongList(songList));
    }

    /**
     * 修改歌单
     */
    @PreAuthorize("@ss.hasPermi('songList:info:edit')")
    @Log(title = "歌单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SongList songList)
    {
        return toAjax(songListService.updateSongList(songList));
    }

    /**
     * 删除歌单
     */
    @PreAuthorize("@ss.hasPermi('songList:info:remove')")
    @Log(title = "歌单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(songListService.deleteSongListByIds(ids));
    }

    /**
     * 查询礼物信息
     */
    @PreAuthorize("@ss.hasPermi('songList:info:list')")
    @PostMapping("/giftList")
    public List<giftVo> gift(@RequestBody List<GiftSearchParam> giftSearchParam)
    {
        System.out.println(giftSearchParam);
        return songListService.selectGiftList(giftSearchParam);
    }
}
