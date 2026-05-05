package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BilibiliGuard;

/**
 * B站舰长Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-01
 */
public interface BilibiliGuardMapper 
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
     * 删除B站舰长
     * 
     * @param id B站舰长主键
     * @return 结果
     */
    public int deleteBilibiliGuardById(Long id);

    /**
     * 批量删除B站舰长
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBilibiliGuardByIds(Long[] ids);

    /**
     * 根据用户ID和B站UID查询舰长
     * 
     * @param userId 用户ID
     * @param guardUid B站UID
     * @return B站舰长
     */
    public BilibiliGuard selectBilibiliGuardByUid(@org.apache.ibatis.annotations.Param("userId") Long userId, @org.apache.ibatis.annotations.Param("guardUid") String guardUid);

    /**
     * 批量插入或更新舰长信息
     * 
     * @param guards 舰长列表
     * @return 结果
     */
    public int batchInsertOrUpdate(List<BilibiliGuard> guards);

    /**
     * 更新舰长地址/备注
     * 
     * @param id 舰长ID
     * @param guardAddress 地址/备注
     * @return 结果
     */
    public int updateGuardAddress(@org.apache.ibatis.annotations.Param("id") Long id, @org.apache.ibatis.annotations.Param("guardAddress") String guardAddress);
}
