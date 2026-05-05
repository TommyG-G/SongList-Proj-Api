package com.ruoyi.system.service;

import java.util.List;
import java.util.Map;
import com.ruoyi.system.domain.SysUserBilibili;

/**
 * Bilibili账号绑定Service接口
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
public interface ISysUserBilibiliService 
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
     * 批量删除Bilibili账号绑定
     * 
     * @param ids 需要删除的Bilibili账号绑定主键集合
     * @return 结果
     */
    public int deleteSysUserBilibiliByIds(Long[] ids);

    /**
     * 删除Bilibili账号绑定信息
     * 
     * @param id Bilibili账号绑定主键
     * @return 结果
     */
    public int deleteSysUserBilibiliById(Long id);

    /**
     * 生成B站登录二维码
     * 
     * @return 二维码信息
     */
    public Map<String, String> generateLoginQRCode();

    /**
     * 检查二维码扫描状态并处理登录
     * 
     * @param qrcodeKey 二维码密钥
     * @return 登录结果
     */
    public Map<String, Object> checkLoginStatus(String qrcodeKey);

    /**
     * 绑定B站账号到指定用户
     * 
     * @param userId 若依用户ID
     * @param cookies B站Cookie信息
     * @return 结果
     */
    public int bindBilibiliAccount(Long userId, Map<String, String> cookies);

    /**
     * 解绑B站账号
     * 
     * @param userId 若依用户ID
     * @return 结果
     */
    public int unbindBilibiliAccount(Long userId);

    /**
     * 通过B站UID查找对应的若依用户ID
     * 
     * @param biliUid B站UID
     * @return 若依用户ID，未找到返回null
     */
    public Long findUserIdByBiliUid(String biliUid);

    /**
     * 更新最后登录时间
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int updateLastLoginTime(Long userId);
}
