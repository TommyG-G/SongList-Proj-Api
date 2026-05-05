package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;
import com.ruoyi.system.domain.BilibiliGuard;

/**
 * B站舰长Service接口
 * 
 * @author ruoyi
 * @date 2026-05-01
 */
public interface IBilibiliGuardService 
{
    /**
     * 查询B站舰长
     * 
     * @param id B站舰长主键
     * @return B站舰长
     */
    public BilibiliGuard selectBilibiliGuardById(Long id);

    /**
     * 查询B站舰长列表
     * 
     * @param bilibiliGuard B站舰长
     * @return B站舰长集合
     */
    public List<BilibiliGuard> selectBilibiliGuardList(BilibiliGuard bilibiliGuard);

    /**
     * 新增B站舰长
     * 
     * @param bilibiliGuard B站舰长
     * @return 结果
     */
    public int insertBilibiliGuard(BilibiliGuard bilibiliGuard);

    /**
     * 修改B站舰长
     * 
     * @param bilibiliGuard B站舰长
     * @return 结果
     */
    public int updateBilibiliGuard(BilibiliGuard bilibiliGuard);

    /**
     * 批量删除B站舰长
     * 
     * @param ids 需要删除的B站舰长主键集合
     * @return 结果
     */
    public int deleteBilibiliGuardByIds(Long[] ids);

    /**
     * 删除B站舰长信息
     * 
     * @param id B站舰长主键
     * @return 结果
     */
    public int deleteBilibiliGuardById(Long id);

    /**
     * 获取并保存舰长列表
     * 
     * @param userId 若依用户ID
     * @param roomId 直播间ID
     * @param anchorUid 主播UID
     * @return 舰长数量
     */
    public int fetchAndSaveGuardList(Long userId, Long roomId, String anchorUid);

    /**
     * 批量发送私信给舰长
     * 
     * @param userId 若依用户ID
     * @param guardIds 舰长ID列表
     * @param messageTemplate 消息模板（支持{username}、{level}等占位符）
     * @return 发送结果统计
     */
    public Map<String, Object> batchSendMessage(Long userId, Long[] guardIds, String messageTemplate);

    /**
     * 重置舰长发送状态
     * 
     * @param userId 若依用户ID
     * @param guardIds 舰长ID列表
     * @return 结果
     */
    public int resetSendStatus(Long userId, Long[] guardIds);

    /**
     * 更新舰长地址/备注
     * 
     * @param id 舰长ID
     * @param guardAddress 地址/备注
     * @return 结果
     */
    public int updateGuardAddress(Long id, String guardAddress);
}
