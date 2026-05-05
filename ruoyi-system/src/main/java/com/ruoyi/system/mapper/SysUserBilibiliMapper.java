package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysUserBilibili;

/**
 * Bilibili账号绑定Mapper接口
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
public interface SysUserBilibiliMapper 
{
    /**
     * 查询Bilibili账号绑定
     * 
     * @param id Bilibili账号绑定主键
     * @return Bilibili账号绑定
     */
    public SysUserBilibili selectSysUserBilibiliById(Long id);

    /**
     * 根据用户ID查询Bilibili账号绑定
     * 
     * @param userId 用户ID
     * @return Bilibili账号绑定
     */
    public SysUserBilibili selectSysUserBilibiliByUserId(Long userId);

    /**
     * 根据B站UID查询Bilibili账号绑定
     * 
     * @param biliUid B站UID
     * @return Bilibili账号绑定
     */
    public SysUserBilibili selectSysUserBilibiliByBiliUid(String biliUid);

    /**
     * 查询Bilibili账号绑定列表
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return Bilibili账号绑定集合
     */
    public List<SysUserBilibili> selectSysUserBilibiliList(SysUserBilibili sysUserBilibili);

    /**
     * 新增Bilibili账号绑定
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return 结果
     */
    public int insertSysUserBilibili(SysUserBilibili sysUserBilibili);

    /**
     * 修改Bilibili账号绑定
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return 结果
     */
    public int updateSysUserBilibili(SysUserBilibili sysUserBilibili);

    /**
     * 删除Bilibili账号绑定
     * 
     * @param id Bilibili账号绑定主键
     * @return 结果
     */
    public int deleteSysUserBilibiliById(Long id);

    /**
     * 批量删除Bilibili账号绑定
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserBilibiliByIds(Long[] ids);

    /**
     * 更新最后登录时间
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int updateLastLoginTime(Long userId);
}
