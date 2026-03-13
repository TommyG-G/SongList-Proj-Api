package com.ruoyi.songList.controller;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.param.SongListSearchParam;
import com.ruoyi.songList.vo.giftVo;
import com.ruoyi.songList.vo.SongListExportVo;
import com.ruoyi.songList.vo.SongListOperationResult;
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
import org.springframework.web.multipart.MultipartFile;

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
        List<SongListExportVo> list = songListService.selectSongListForExport(songList);
        ExcelUtil<SongListExportVo> util = new ExcelUtil<SongListExportVo>(SongListExportVo.class);
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
        SongListOperationResult result = songListService.insertSongList(songList);
        if (result.getResult() > 0) {
            return success(result.getMessage());
        } else {
            return error(result.getMessage());
        }
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

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<SongListExportVo> util = new ExcelUtil<SongListExportVo>(SongListExportVo.class);
        util.importTemplateExcel(response, "歌单数据");
    }

    @Log(title = "歌单管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('songList:info:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SongList> util = new ExcelUtil<SongList>(SongList.class);
        List<SongList> SongList = util.importExcel(file.getInputStream());
        String operName = getUserId().toString();
        String message = songListService.importSong(SongList, updateSupport, operName);
        return success(message);
    }

    /**
     * 查询歌单显示列配置
     */
    @PreAuthorize("@ss.hasPermi('songList:info:isShowColumns')")
    @GetMapping("/isShowColumns")
    public AjaxResult isShowColumns()
    {
        List<String> showColumns = songListService.selectShowColumns();
        return success(showColumns);
    }

    /**
     * 保存歌单显示列配置
     */
    @PreAuthorize("@ss.hasPermi('songList:info:saveShowColumns')")
    @Log(title = "歌单显示列配置", businessType = BusinessType.UPDATE)
    @PostMapping("/saveShowColumns")
    public AjaxResult saveShowColumns(@RequestBody List<String> columns)
    {
        int result = songListService.saveShowColumns(columns);
        if (result > 0) {
            return success("显示列配置保存成功");
        } else {
            return error("显示列配置保存失败");
        }
    }

    /**
     * 查询曲风字典数据
     */
    @PostMapping("/selectMusicalStyle")
    public AjaxResult selectMusicalStyle()
    {
        return success(songListService.selectMusicalStyle());
    }

    /**
     * 查询歌单列表
     */
    @GetMapping("/songList")
    public AjaxResult songList(SongListSearchParam songList)
    {
        List<SongList> list = songListService.selectSongList(songList);
        return success(list);
    }

}
