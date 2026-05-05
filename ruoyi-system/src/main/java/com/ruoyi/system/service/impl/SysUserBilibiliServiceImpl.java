package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.bilibili.BilibiliApiUtils;
import com.ruoyi.system.domain.SysUserBilibili;
import com.ruoyi.system.mapper.SysUserBilibiliMapper;
import com.ruoyi.system.service.ISysUserBilibiliService;

/**
 * Bilibili账号绑定Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
@Service
public class SysUserBilibiliServiceImpl implements ISysUserBilibiliService 
{
    private static final Logger log = LoggerFactory.getLogger(SysUserBilibiliServiceImpl.class);

    @Autowired
    private SysUserBilibiliMapper sysUserBilibiliMapper;

    @Autowired
    private BilibiliApiUtils bilibiliApiUtils;

    /**
     * 查询Bilibili账号绑定
     * 
     * @param id Bilibili账号绑定主键
     * @return Bilibili账号绑定
     */
    @Override
    public SysUserBilibili selectSysUserBilibiliById(Long id)
    {
        return sysUserBilibiliMapper.selectSysUserBilibiliById(id);
    }

    /**
     * 根据用户ID查询Bilibili账号绑定
     * 
     * @param userId 用户ID
     * @return Bilibili账号绑定
     */
    @Override
    public SysUserBilibili selectSysUserBilibiliByUserId(Long userId)
    {
        return sysUserBilibiliMapper.selectSysUserBilibiliByUserId(userId);
    }

    /**
     * 根据B站UID查询Bilibili账号绑定
     * 
     * @param biliUid B站UID
     * @return Bilibili账号绑定
     */
    @Override
    public SysUserBilibili selectSysUserBilibiliByBiliUid(String biliUid)
    {
        return sysUserBilibiliMapper.selectSysUserBilibiliByBiliUid(biliUid);
    }

    /**
     * 查询Bilibili账号绑定列表
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return Bilibili账号绑定
     */
    @Override
    public List<SysUserBilibili> selectSysUserBilibiliList(SysUserBilibili sysUserBilibili)
    {
        return sysUserBilibiliMapper.selectSysUserBilibiliList(sysUserBilibili);
    }

    /**
     * 新增Bilibili账号绑定
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return 结果
     */
    @Override
    public int insertSysUserBilibili(SysUserBilibili sysUserBilibili)
    {
        sysUserBilibili.setCreateTime(DateUtils.getNowDate());
        return sysUserBilibiliMapper.insertSysUserBilibili(sysUserBilibili);
    }

    /**
     * 修改Bilibili账号绑定
     * 
     * @param sysUserBilibili Bilibili账号绑定
     * @return 结果
     */
    @Override
    public int updateSysUserBilibili(SysUserBilibili sysUserBilibili)
    {
        sysUserBilibili.setUpdateTime(DateUtils.getNowDate());
        return sysUserBilibiliMapper.updateSysUserBilibili(sysUserBilibili);
    }

    /**
     * 批量删除Bilibili账号绑定
     * 
     * @param ids 需要删除的Bilibili账号绑定主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysUserBilibiliByIds(Long[] ids)
    {
        return sysUserBilibiliMapper.deleteSysUserBilibiliByIds(ids);
    }

    /**
     * 删除Bilibili账号绑定信息
     * 
     * @param id Bilibili账号绑定主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteSysUserBilibiliById(Long id)
    {
        return sysUserBilibiliMapper.deleteSysUserBilibiliById(id);
    }

    /**
     * 生成B站登录二维码
     * 
     * @return 二维码信息
     */
    @Override
    public Map<String, String> generateLoginQRCode()
    {
        log.info("生成B站登录二维码");
        return bilibiliApiUtils.generateQRCode();
    }

    /**
     * 检查二维码扫描状态并处理登录
     * 
     * @param qrcodeKey 二维码密钥
     * @return 登录结果
     */
    @Override
    public Map<String, Object> checkLoginStatus(String qrcodeKey)
    {
        log.info("检查B站二维码扫描状态: {}", qrcodeKey);
        
        // 调用B站API检查状态
        Map<String, Object> statusInfo = bilibiliApiUtils.checkQRCodeStatus(qrcodeKey);
        
        // 如果扫码成功，查找对应的若依用户
        if (Boolean.TRUE.equals(statusInfo.get("success")))
        {
            @SuppressWarnings("unchecked")
            Map<String, String> cookies = (Map<String, String>) statusInfo.get("cookies");
            
            if (cookies != null && cookies.containsKey("DedeUserID"))
            {
                String biliUid = cookies.get("DedeUserID");
                
                // 查找是否已绑定
                SysUserBilibili bindInfo = selectSysUserBilibiliByBiliUid(biliUid);
                
                if (bindInfo != null && "0".equals(bindInfo.getBindStatus()))
                {
                    // 已绑定，返回用户ID
                    statusInfo.put("userId", bindInfo.getUserId());
                    statusInfo.put("bound", true);
                    
                    // 更新最后登录时间
                    updateLastLoginTime(bindInfo.getUserId());
                    
                    log.info("B站账号 {} 已绑定到用户 {}", biliUid, bindInfo.getUserId());
                }
                else
                {
                    // 未绑定
                    statusInfo.put("bound", false);
                    statusInfo.put("biliUid", biliUid);
                    statusInfo.put("biliUname", cookies.get("DedeUserID")); // 可能需要额外API获取
                    
                    log.info("B站账号 {} 未绑定系统账号", biliUid);
                }
            }
        }
        
        return statusInfo;
    }

    /**
     * 绑定B站账号到指定用户
     * 
     * @param userId 若依用户ID
     * @param cookies B站Cookie信息
     * @return 结果
     */
    @Override
    @Transactional
    public int bindBilibiliAccount(Long userId, Map<String, String> cookies)
    {
        log.info("绑定B站账号到用户: userId={}, cookies={}", userId, cookies.keySet());
        
        // 检查该用户是否已绑定
        SysUserBilibili existBind = selectSysUserBilibiliByUserId(userId);
        if (existBind != null && "0".equals(existBind.getBindStatus()))
        {
            throw new RuntimeException("该用户已绑定B站账号，请先解绑");
        }
        
        // 检查B站UID是否已被其他用户绑定
        String biliUid = cookies.get("DedeUserID");
        SysUserBilibili uidBind = selectSysUserBilibiliByBiliUid(biliUid);
        if (uidBind != null && "0".equals(uidBind.getBindStatus()))
        {
            throw new RuntimeException("该B站账号已被其他用户绑定");
        }
        
        // 获取用户信息
        String sessdata = cookies.get("SESSDATA");
        String biliJct = cookies.get("bili_jct");
        
        Map<String, Object> userInfo = bilibiliApiUtils.getUserInfo(sessdata, biliJct);
        
        // 构建绑定对象
        SysUserBilibili bindInfo = new SysUserBilibili();
        bindInfo.setUserId(userId);
        bindInfo.setBiliUid(biliUid);
        bindInfo.setBiliUname(userInfo != null ? (String) userInfo.get("uname") : null);
        bindInfo.setBiliFace(userInfo != null ? (String) userInfo.get("face") : null);
        bindInfo.setSessdata(sessdata);
        bindInfo.setBiliJct(biliJct);
        bindInfo.setDedeUserid(biliUid);
        bindInfo.setBindStatus("0");
        bindInfo.setBindTime(new Date());
        bindInfo.setLastLoginTime(new Date());
        bindInfo.setCreateBy(SecurityUtils.getUsername());
        
        // 如果之前有解绑记录，则更新；否则新增
        if (uidBind != null)
        {
            bindInfo.setId(uidBind.getId());
            return updateSysUserBilibili(bindInfo);
        }
        else
        {
            return insertSysUserBilibili(bindInfo);
        }
    }

    /**
     * 解绑B站账号
     * 
     * @param userId 若依用户ID
     * @return 结果
     */
    @Override
    @Transactional
    public int unbindBilibiliAccount(Long userId)
    {
        log.info("解绑用户 {} 的B站账号", userId);
        
        SysUserBilibili bindInfo = selectSysUserBilibiliByUserId(userId);
        if (bindInfo == null)
        {
            throw new RuntimeException("该用户未绑定B站账号");
        }
        
        bindInfo.setBindStatus("1");
        bindInfo.setUnbindTime(new Date());
        bindInfo.setUpdateBy(SecurityUtils.getUsername());
        
        return updateSysUserBilibili(bindInfo);
    }

    /**
     * 通过B站UID查找对应的若依用户ID
     * 
     * @param biliUid B站UID
     * @return 若依用户ID，未找到返回null
     */
    @Override
    public Long findUserIdByBiliUid(String biliUid)
    {
        SysUserBilibili bindInfo = selectSysUserBilibiliByBiliUid(biliUid);
        return bindInfo != null ? bindInfo.getUserId() : null;
    }

    /**
     * 更新最后登录时间
     * 
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    public int updateLastLoginTime(Long userId)
    {
        return sysUserBilibiliMapper.updateLastLoginTime(userId);
    }
}
