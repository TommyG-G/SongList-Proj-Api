package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.BilibiliGuard;
import com.ruoyi.system.service.IBilibiliGuardService;

/**
 * B站舰长Controller
 * 
 * @author ruoyi
 * @date 2026-05-01
 */
@RestController
@RequestMapping("/bilibili/guard")
public class BilibiliGuardController extends BaseController
{
    @Autowired
    private IBilibiliGuardService bilibiliGuardService;

    /**
     * 查询B站舰长列表
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:list')")
    @GetMapping("/list")
    public TableDataInfo list(BilibiliGuard bilibiliGuard)
    {
        // 只查询当前用户的舰长数据
        bilibiliGuard.setUserId(SecurityUtils.getUserId());
        startPage();
        List<BilibiliGuard> list = bilibiliGuardService.selectBilibiliGuardList(bilibiliGuard);
        return getDataTable(list);
    }

    /**
     * 获取B站舰长详细信息
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(bilibiliGuardService.selectBilibiliGuardById(id));
    }

    /**
     * 新增B站舰长
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:add')")
    @Log(title = "B站舰长", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BilibiliGuard bilibiliGuard)
    {
        return toAjax(bilibiliGuardService.insertBilibiliGuard(bilibiliGuard));
    }

    /**
     * 修改B站舰长
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:edit')")
    @Log(title = "B站舰长", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BilibiliGuard bilibiliGuard)
    {
        return toAjax(bilibiliGuardService.updateBilibiliGuard(bilibiliGuard));
    }

    /**
     * 删除B站舰长
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:remove')")
    @Log(title = "B站舰长", businessType = BusinessType.DELETE)
	@PostMapping("/remove")
    public AjaxResult remove(@RequestBody Long[] ids)
    {
        return toAjax(bilibiliGuardService.deleteBilibiliGuardByIds(ids));
    }

    /**
     * 获取并保存舰长列表
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:fetch')")
    @Log(title = "获取舰长列表", businessType = BusinessType.OTHER)
    @PostMapping("/fetch")
    public AjaxResult fetchGuardList(@RequestBody Map<String, Object> params)
    {
        try
        {
            Long roomId = Long.valueOf(params.get("roomId").toString());
            String anchorUid = params.get("anchorUid").toString();
            
            int count = bilibiliGuardService.fetchAndSaveGuardList(
                SecurityUtils.getUserId(), 
                roomId, 
                anchorUid
            );
            
            return success("成功获取" + count + "条舰长数据");
        }
        catch (Exception e)
        {
            return error("获取舰长列表失败: " + e.getMessage());
        }
    }

    /**
     * 批量发送私信
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:send')")
    @Log(title = "批量发送私信", businessType = BusinessType.OTHER)
    @PostMapping("/batchSend")
    public AjaxResult batchSendMessage(@RequestBody Map<String, Object> params)
    {
        try
        {
            @SuppressWarnings("unchecked")
            List<Integer> guardIdList = (List<Integer>) params.get("guardIds");
            Long[] guardIds = guardIdList.stream()
                .map(Long::valueOf)
                .toArray(Long[]::new);
            
            String messageTemplate = params.get("messageTemplate").toString();
            
            Map<String, Object> result = bilibiliGuardService.batchSendMessage(
                SecurityUtils.getUserId(),
                guardIds,
                messageTemplate
            );
            
            return success(result);
        }
        catch (Exception e)
        {
            return error("批量发送失败: " + e.getMessage());
        }
    }

    /**
     * 重置发送状态
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:reset')")
    @Log(title = "重置发送状态", businessType = BusinessType.UPDATE)
    @PostMapping("/resetStatus")
    public AjaxResult resetSendStatus(@RequestBody Map<String, Object> params)
    {
        try
        {
            @SuppressWarnings("unchecked")
            List<Integer> guardIdList = (List<Integer>) params.get("guardIds");
            Long[] guardIds = guardIdList.stream()
                .map(Long::valueOf)
                .toArray(Long[]::new);
            
            int count = bilibiliGuardService.resetSendStatus(
                SecurityUtils.getUserId(),
                guardIds
            );
            
            return success("已重置" + count + "条记录的发送状态");
        }
        catch (Exception e)
        {
            return error("重置失败: " + e.getMessage());
        }
    }

    /**
     * 更新舰长地址/备注
     */
    @PreAuthorize("@ss.hasPermi('bilibili:guard:edit')")
    @Log(title = "更新舰长地址", businessType = BusinessType.UPDATE)
    @PutMapping("/address")
    public AjaxResult updateAddress(@RequestBody Map<String, Object> params)
    {
        try
        {
            Long id = Long.valueOf(params.get("id").toString());
            String guardAddress = params.get("guardAddress") != null ? params.get("guardAddress").toString() : "";
            
            int count = bilibiliGuardService.updateGuardAddress(id, guardAddress);
            
            return toAjax(count);
        }
        catch (Exception e)
        {
            return error("更新失败: " + e.getMessage());
        }
    }
}
