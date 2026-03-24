package com.ruoyi.songList.controller;

import java.util.List;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DictUtils;
import com.ruoyi.common.core.domain.param.UserExtendInfo;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.songList.param.GiftSearchParam;
import com.ruoyi.songList.param.PromptsUpdateParam;
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
import org.springframework.web.bind.annotation.RequestParam;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysPostService;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.utils.SecurityUtils;
import java.util.stream.Collectors;
import java.util.Map;
import java.util.HashMap;

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

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysPostService postService;

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
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<SongList> util = new ExcelUtil<SongList>(SongList.class);
        List<SongList> SongList = util.importExcel(file.getInputStream());
        String operName = getUserId().toString();
        String message = songListService.importSong(SongList, operName);
        return success(message);
    }

    /**
     * 查询歌单显示列配置
     */
    @GetMapping("/isShowColumns")
    public AjaxResult isShowColumns()
    {
        List<String> showColumns = songListService.selectShowColumns();
        return success(showColumns);
    }

    /**
     * 保存歌单显示列配置
     */
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
     * 查询已设定的曲风数据
     */
    @GetMapping("/existingMusicalStyles")
    public AjaxResult existingMusicalStyles()
    {
        return success(songListService.getExistingMusicalStyles());
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

    /**
     * 背景图片上传
     */
    @Log(title = "歌单背景图片", businessType = BusinessType.UPDATE)
    @PostMapping("/uploadBackground")
    public AjaxResult uploadBackground(@RequestParam("backgroundFile") MultipartFile file) throws Exception
    {
        if (!file.isEmpty())
        {
            // 上传图片到默认地址
            String backgroundImage = FileUploadUtils.upload(RuoYiConfig.getProfile(), file, MimeTypeUtils.IMAGE_EXTENSION, true);
            
            // 将存储地址存储到user_extend_info表中
            if (userService.updateUserBackgroundImage(backgroundImage))
            {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("imgUrl", backgroundImage);
                return ajax;
            }
        }
        return error("上传图片异常，请联系管理员");
    }

    /**
     * 获取用户背景图片
     */
    @GetMapping("/getBackground")
    public AjaxResult getBackground()
    {
        try {
            // 获取当前用户的扩展信息
            UserExtendInfo userExtendInfo = userService.selectUserExtendInfo();
            
            if (userExtendInfo != null && userExtendInfo.getBackgroundImage() != null
                && !userExtendInfo.getBackgroundImage().trim().isEmpty()) {
                // 有背景图片数据，返回图片地址
                return success(userExtendInfo.getBackgroundImage());
            } else {
                // 没有背景图片数据，返回空字符串
                return success("");
            }
        } catch (Exception e) {
            // 如果出现异常（如用户未登录），也返回空字符串
            return error("获取数据发生一场，请连续管理员");
        }
    }

    /**
     * 更新用户背景颜色
     */
    @Log(title = "歌单背景颜色", businessType = BusinessType.UPDATE)
    @PostMapping("/uploadBackgroundColor")
    public AjaxResult uploadBackgroundColor(@RequestParam("color") String color) throws Exception
    {
        if (color != null && !color.trim().isEmpty()) {
            // 将颜色值存储到user_extend_info表中
            if (userService.updateUserBackgroundColor(color)) {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("color", color);
                return ajax;
            }
        }
        return error("颜色参数异常，请联系管理员");
    }

    /**
     * 获取用户背景颜色
     */
    @GetMapping("/getBackgroundColor")
    public AjaxResult getBackgroundColor()
    {
        try {
            // 获取当前用户的扩展信息
            UserExtendInfo userExtendInfo = userService.selectUserExtendInfo();
            
            if (userExtendInfo != null && userExtendInfo.getBackgroundColor() != null
                && !userExtendInfo.getBackgroundColor().trim().isEmpty()) {
                // 有背景颜色数据，返回颜色值
                return success(userExtendInfo.getBackgroundColor());
            } else {
                // 没有背景颜色数据，返回空字符串
                return success("");
            }
        } catch (Exception e) {
            // 如果出现异常（如用户未登录），也返回空字符串
            return success("");
        }
    }

    /**
     * 更新用户页面标题和提示信息
     */
    @Log(title = "歌单页面标题和提示信息", businessType = BusinessType.UPDATE)
    @PostMapping("/updatePrompts")
    public AjaxResult updatePrompts(@RequestBody PromptsUpdateParam promptsUpdateParam)
    {
        // 检查参数是否都为空
        if ((promptsUpdateParam.getPageTitle() == null || promptsUpdateParam.getPageTitle().trim().isEmpty()) &&
            (promptsUpdateParam.getMainPrompt() == null || promptsUpdateParam.getMainPrompt().trim().isEmpty()) &&
            (promptsUpdateParam.getSubPrompt() == null || promptsUpdateParam.getSubPrompt().trim().isEmpty())) {
            return error("至少需要提供一个有效的参数值");
        }
        
        // 将页面标题和提示信息存储到user_extend_info表中
        if (userService.updateUserPrompts(promptsUpdateParam.getPageTitle(), promptsUpdateParam.getMainPrompt(), promptsUpdateParam.getSubPrompt())) {
            AjaxResult ajax = AjaxResult.success();
            ajax.put("pageTitle", promptsUpdateParam.getPageTitle());
            ajax.put("mainPrompt", promptsUpdateParam.getMainPrompt());
            ajax.put("subPrompt", promptsUpdateParam.getSubPrompt());
            return ajax;
        }
        return error("保存页面标题和提示信息失败，请联系管理员");
    }

    /**
     * 获取用户页面标题和提示信息
     */
    @GetMapping("/getPrompts")
    public AjaxResult getPrompts()
    {
        try {
            // 获取当前用户的扩展信息
            UserExtendInfo userExtendInfo = userService.selectUserExtendInfo();
            
            if (userExtendInfo != null) {
                AjaxResult ajax = AjaxResult.success();
                ajax.put("pageTitle", userExtendInfo.getPageTitle() != null ? userExtendInfo.getPageTitle() : "");
                ajax.put("mainPrompt", userExtendInfo.getMainPrompt() != null ? userExtendInfo.getMainPrompt() : "");
                ajax.put("subPrompt", userExtendInfo.getSubPrompt() != null ? userExtendInfo.getSubPrompt() : "");
                return ajax;
            } else {
                // 没有数据，返回空值
                AjaxResult ajax = AjaxResult.success();
                ajax.put("pageTitle", "");
                ajax.put("mainPrompt", "");
                ajax.put("subPrompt", "");
                return ajax;
            }
        } catch (Exception e) {
            // 如果出现异常（如用户未登录），也返回空值
            AjaxResult ajax = AjaxResult.success();
            ajax.put("pageTitle", "");
            ajax.put("mainPrompt", "");
            ajax.put("subPrompt", "");
            return ajax;
        }
    }

    /**
     * 公开的聚合查询接口，允许外部人员免登录提取指定 UID 下的所有数据
     */
    @Anonymous
    @GetMapping("/public/initData")
    public AjaxResult getPublicInitData(SongListSearchParam params, @RequestParam(value = "uid", required = false) String uid)
    {
        if (StringUtils.isEmpty(uid)) {
             return error("未提供有效的访问通行证 (UID 缺失)");
        }

        // 通过扩展表寻找真正的主人 user_id
        UserExtendInfo extendInfo = userService.selectUserExtendInfoByUid(uid);
        if (extendInfo == null || extendInfo.getUserId() == null) {
             return error("找不到通行证对应的访客馆长，请检查 UID 是否正确");
        }
        
        Long realUserId = extendInfo.getUserId();

        AjaxResult ajax = AjaxResult.success();
        
        // 1. 设置查询的所属人 (底层依靠真实的数字 user_id)
        params.setUploader(String.valueOf(realUserId));
        List<SongList> songs = songListService.selectSongListForPublic(params);
        ajax.put("songList", songs);
        
        // 2. 提取该用户的独立曲风库
        ajax.put("existingMusicalStyles", songListService.getExistingMusicalStylesByUid(String.valueOf(realUserId)));
        
        // 3. 收取该用户的显示列偏好
        ajax.put("showColumns", songListService.selectShowColumnsByUid(realUserId));
        
        // 4. 收取该用户的展示和扩展配置信息
        ajax.put("extendInfo", extendInfo);
        
        // 5. 补充播主基础信息 (用于标题等展示)
        SysUser hostUser = userService.selectUserById(realUserId);
        if (hostUser != null) {
            // 补充完整用户信息 (模拟 SysUserController.getInfo)
            Map<String, Object> userMap = new HashMap<>();
            userMap.put(AjaxResult.DATA_TAG, hostUser);
            ajax.put("user", userMap);
        }
        
        // 5. 提前从后端字典缓存池强行拉取所用字典，避开前端 useDict 的 401
        ajax.put("songLanguageDict", DictUtils.getDictCache("song_language"));
        ajax.put("exclusiveLevelDict", DictUtils.getDictCache("exclusive_level"));
        ajax.put("songStyleDict", DictUtils.getDictCache("song_style"));
        ajax.put("songSliceDict", DictUtils.getDictCache("song_slice"));
        ajax.put("giftListDict", DictUtils.getDictCache("gift_list"));
        
        return ajax;
    }
}
