package com.ruoyi.system.service.impl;

import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.utils.bilibili.BilibiliApiUtils;
import com.ruoyi.system.domain.BilibiliGuard;
import com.ruoyi.system.domain.SysUserBilibili;
import com.ruoyi.system.mapper.BilibiliGuardMapper;
import com.ruoyi.system.service.IBilibiliGuardService;
import com.ruoyi.system.service.ISysUserBilibiliService;

/**
 * B站舰长Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-01
 */
@Service
public class BilibiliGuardServiceImpl implements IBilibiliGuardService 
{
    private static final Logger log = LoggerFactory.getLogger(BilibiliGuardServiceImpl.class);

    @Autowired
    private BilibiliGuardMapper bilibiliGuardMapper;

    @Autowired
    private ISysUserBilibiliService userBilibiliService;

    @Autowired
    private BilibiliApiUtils bilibiliApiUtils;

    /**
     * 查询B站舰长
     * 
     * @param id B站舰长主键
     * @return B站舰长
     */
    @Override
    public BilibiliGuard selectBilibiliGuardById(Long id)
    {
        return bilibiliGuardMapper.selectBilibiliGuardById(id);
    }

    /**
     * 查询B站舰长列表
     * 
     * @param bilibiliGuard B站舰长
     * @return B站舰长
     */
    @Override
    public List<BilibiliGuard> selectBilibiliGuardList(BilibiliGuard bilibiliGuard)
    {
        return bilibiliGuardMapper.selectBilibiliGuardList(bilibiliGuard);
    }

    /**
     * 新增B站舰长
     * 
     * @param bilibiliGuard B站舰长
     * @return 结果
     */
    @Override
    public int insertBilibiliGuard(BilibiliGuard bilibiliGuard)
    {
        bilibiliGuard.setCreateTime(new Date());
        return bilibiliGuardMapper.insertBilibiliGuard(bilibiliGuard);
    }

    /**
     * 修改B站舰长
     * 
     * @param bilibiliGuard B站舰长
     * @return 结果
     */
    @Override
    public int updateBilibiliGuard(BilibiliGuard bilibiliGuard)
    {
        bilibiliGuard.setUpdateTime(new Date());
        return bilibiliGuardMapper.updateBilibiliGuard(bilibiliGuard);
    }

    /**
     * 批量删除B站舰长
     * 
     * @param ids 需要删除的B站舰长主键
     * @return 结果
     */
    @Override
    public int deleteBilibiliGuardByIds(Long[] ids)
    {
        return bilibiliGuardMapper.deleteBilibiliGuardByIds(ids);
    }

    /**
     * 删除B站舰长信息
     * 
     * @param id B站舰长主键
     * @return 结果
     */
    @Override
    public int deleteBilibiliGuardById(Long id)
    {
        return bilibiliGuardMapper.deleteBilibiliGuardById(id);
    }

    /**
     * 获取并保存舰长列表
     * 
     * @param userId 若依用户ID
     * @param roomId 直播间ID
     * @param anchorUid 主播UID
     * @return 舰长数量
     */
    @Override
    @Transactional
    public int fetchAndSaveGuardList(Long userId, Long roomId, String anchorUid)
    {
        log.info("开始获取舰长列表: userId={}, roomId={}, anchorUid={}", userId, roomId, anchorUid);
        
        try
        {
            // 获取用户的B站绑定信息
            SysUserBilibili bindInfo = userBilibiliService.selectSysUserBilibiliByUserId(userId);
            if (bindInfo == null || bindInfo.getSessdata() == null)
            {
                throw new RuntimeException("未绑定B站账号或Cookie已过期");
            }
            
            // 调用B站API获取舰长列表
            List<Map<String, Object>> guardList = bilibiliApiUtils.getGuardList(
                roomId, 
                anchorUid, 
                bindInfo.getSessdata(), 
                bindInfo.getBiliJct(),
                1, 
                30
            );
            
            log.info("获取到舰长数量: {}", guardList.size());
            
            // 转换为实体对象
            Date snapshotDate = new Date();
            List<BilibiliGuard> guards = new ArrayList<>();
            
            for (Map<String, Object> guardData : guardList)
            {
                BilibiliGuard guard = new BilibiliGuard();
                guard.setUserId(userId);
                guard.setGuardUid((String) guardData.get("uid"));
                guard.setGuardUsername((String) guardData.get("username"));
                guard.setGuardLevel((Integer) guardData.get("guard_level"));
                guard.setGuardLevelText((String) guardData.get("guard_level_text"));
                guard.setRoomId(roomId);
                guard.setAnchorUid(anchorUid);
                guard.setStartTime((Date) guardData.get("start_time"));
                guard.setEndTime((Date) guardData.get("end_time"));
                guard.setAutoRenew((Integer) guardData.get("is_auto_renew"));
                guard.setSendStatus(0); // 默认未发送
                guard.setSnapshotDate(snapshotDate);
                
                guards.add(guard);
            }
            
            // 批量插入或更新
            if (!guards.isEmpty())
            {
                bilibiliGuardMapper.batchInsertOrUpdate(guards);
            }
            
            log.info("舰长列表保存成功，共{}条", guards.size());
            return guards.size();
        }
        catch (Exception e)
        {
            log.error("获取舰长列表失败", e);
            throw new RuntimeException("获取舰长列表失败: " + e.getMessage());
        }
    }

    /**
     * 批量发送私信给舰长
     * 
     * @param userId 若依用户ID
     * @param guardIds 舰长ID列表
     * @param messageTemplate 消息模板
     * @return 发送结果统计
     */
    @Override
    @Transactional
    public Map<String, Object> batchSendMessage(Long userId, Long[] guardIds, String messageTemplate)
    {
        log.info("开始批量发送私信: userId={}, 舰长数量={}", userId, guardIds.length);
        
        Map<String, Object> result = new HashMap<>();
        int successCount = 0;
        int failCount = 0;
        List<Map<String, Object>> details = new ArrayList<>();
        
        try
        {
            // 获取用户的B站绑定信息
            SysUserBilibili bindInfo = userBilibiliService.selectSysUserBilibiliByUserId(userId);
            if (bindInfo == null || bindInfo.getSessdata() == null)
            {
                throw new RuntimeException("未绑定B站账号或Cookie已过期");
            }
            
            // 遍历舰长列表发送私信
            for (Long guardId : guardIds)
            {
                BilibiliGuard guard = bilibiliGuardMapper.selectBilibiliGuardById(guardId);
                if (guard == null)
                {
                    continue;
                }
                
                Map<String, Object> detail = new HashMap<>();
                detail.put("guardId", guardId);
                detail.put("username", guard.getGuardUsername());
                detail.put("uid", guard.getGuardUid());
                
                try
                {
                    // 替换模板中的占位符
                    String message = replaceTemplate(messageTemplate, guard);
                    
                    // 发送私信
                    Map<String, Object> sendResult = bilibiliApiUtils.sendPrivateMessage(
                        guard.getGuardUid(),
                        message,
                        bindInfo.getSessdata(),
                        bindInfo.getBiliJct(),
                        bindInfo.getDedeUserid()
                    );
                    
                    // 更新发送状态
                    guard.setSendStatus((Boolean) sendResult.get("success") ? 1 : 2);
                    guard.setSendTime(new Date());
                    guard.setSendMsg((String) sendResult.get("message"));
                    bilibiliGuardMapper.updateBilibiliGuard(guard);
                    
                    if ((Boolean) sendResult.get("success"))
                    {
                        successCount++;
                        detail.put("status", "success");
                        log.info("私信发送成功: {}", guard.getGuardUsername());
                    }
                    else
                    {
                        failCount++;
                        detail.put("status", "fail");
                        detail.put("error", sendResult.get("message"));
                        log.warn("私信发送失败: {}, 原因: {}", guard.getGuardUsername(), sendResult.get("message"));
                    }
                    
                    // 添加延迟，避免频繁请求
                    Thread.sleep(1000);
                }
                catch (Exception e)
                {
                    failCount++;
                    detail.put("status", "error");
                    detail.put("error", e.getMessage());
                    
                    // 更新发送状态为失败
                    guard.setSendStatus(2);
                    guard.setSendTime(new Date());
                    guard.setSendMsg("发送异常: " + e.getMessage());
                    bilibiliGuardMapper.updateBilibiliGuard(guard);
                    
                    log.error("私信发送异常: {}", guard.getGuardUsername(), e);
                }
                
                details.add(detail);
            }
            
            result.put("total", guardIds.length);
            result.put("success", successCount);
            result.put("fail", failCount);
            result.put("details", details);
            
            log.info("批量发送完成: 总数={}, 成功={}, 失败={}", guardIds.length, successCount, failCount);
            return result;
        }
        catch (Exception e)
        {
            log.error("批量发送私信失败", e);
            throw new RuntimeException("批量发送私信失败: " + e.getMessage());
        }
    }

    /**
     * 重置舰长发送状态
     * 
     * @param userId 若依用户ID
     * @param guardIds 舰长ID列表
     * @return 结果
     */
    @Override
    @Transactional
    public int resetSendStatus(Long userId, Long[] guardIds)
    {
        int count = 0;
        for (Long guardId : guardIds)
        {
            BilibiliGuard guard = bilibiliGuardMapper.selectBilibiliGuardById(guardId);
            if (guard != null && guard.getUserId().equals(userId))
            {
                guard.setSendStatus(0);
                guard.setSendTime(null);
                guard.setSendMsg(null);
                bilibiliGuardMapper.updateBilibiliGuard(guard);
                count++;
            }
        }
        return count;
    }

    /**
     * 替换消息模板中的占位符
     * 
     * @param template 模板字符串
     * @param guard 舰长信息
     * @return 替换后的消息
     */
    private String replaceTemplate(String template, BilibiliGuard guard)
    {
        if (template == null)
        {
            return "";
        }
        
        String result = template;
        result = result.replace("{username}", guard.getGuardUsername() != null ? guard.getGuardUsername() : "");
        result = result.replace("{level}", guard.getGuardLevelText() != null ? guard.getGuardLevelText() : "");
        result = result.replace("{uid}", guard.getGuardUid() != null ? guard.getGuardUid() : "");
        
        return result;
    }

    /**
     * 更新舰长地址/备注
     * 
     * @param id 舰长ID
     * @param guardAddress 地址/备注
     * @return 结果
     */
    @Override
    public int updateGuardAddress(Long id, String guardAddress)
    {
        log.info("更新舰长地址: id={}, address={}", id, guardAddress);
        return bilibiliGuardMapper.updateGuardAddress(id, guardAddress);
    }
}
