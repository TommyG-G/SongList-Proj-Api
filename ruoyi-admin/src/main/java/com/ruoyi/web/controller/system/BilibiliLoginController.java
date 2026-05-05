package com.ruoyi.web.controller.system;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.ISysUserBilibiliService;

/**
 * Bilibili登录Controller
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
@RestController
@RequestMapping("/bilibili")
public class BilibiliLoginController extends BaseController
{
    @Autowired
    private ISysUserBilibiliService bilibiliService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 生成B站登录二维码
     */
    @Anonymous
    @GetMapping("/qrcode/generate")
    public AjaxResult generateQRCode()
    {
        try
        {
            Map<String, String> qrInfo = bilibiliService.generateLoginQRCode();
            return success(qrInfo);
        }
        catch (Exception e)
        {
            return error("生成二维码失败: " + e.getMessage());
        }
    }

    /**
     * 检查二维码扫描状态
     * 
     * @param qrcodeKey 二维码密钥
     */
    @Anonymous
    @GetMapping("/qrcode/check")
    public AjaxResult checkQRCodeStatus(String qrcodeKey)
    {
        try
        {
            Map<String, Object> statusInfo = bilibiliService.checkLoginStatus(qrcodeKey);
            return success(statusInfo);
        }
        catch (Exception e)
        {
            return error("查询状态失败: " + e.getMessage());
        }
    }

    /**
     * Bilibili扫码登录（通过userId生成token）
     * 
     * @param params 包含 userId
     */
    @Anonymous
    @PostMapping("/login")
    public AjaxResult loginByBilibili(@RequestBody Map<String, Object> params)
    {
        try
        {
            Long userId = Long.valueOf(params.get("userId").toString());
            
            // 查询用户信息
            SysUser user = userService.selectUserById(userId);
            if (user == null)
            {
                return error("用户不存在");
            }
            
            // 检查用户状态
            if ("1".equals(user.getStatus()))
            {
                return error("用户已被停用");
            }
            
            // 获取用户权限
            java.util.Set<String> permissions = permissionService.getMenuPermission(user);
            
            // 构建LoginUser对象（需要传入permissions，避免getInfo时出现空指针异常）
            LoginUser loginUser = new LoginUser(userId, user.getDeptId(), user, permissions);
            
            // 生成token
            String token = tokenService.createToken(loginUser);
            
            AjaxResult ajax = success("登录成功");
            ajax.put("token", token);
            ajax.put("user", user);
            return ajax;
        }
        catch (Exception e)
        {
            return error("登录失败: " + e.getMessage());
        }
    }

    /**
     * 绑定B站账号
     * 
     * @param params 包含 userId 和 cookies
     */
    @PostMapping("/bind")
    public AjaxResult bindAccount(@RequestBody Map<String, Object> params)
    {
        try
        {
            Long userId = Long.valueOf(params.get("userId").toString());
            @SuppressWarnings("unchecked")
            Map<String, String> cookies = (Map<String, String>) params.get("cookies");
            
            int result = bilibiliService.bindBilibiliAccount(userId, cookies);
            return result > 0 ? success("绑定成功") : error("绑定失败");
        }
        catch (Exception e)
        {
            return error("绑定失败: " + e.getMessage());
        }
    }

    /**
     * 解绑B站账号
     * 
     * @param userId 用户ID
     */
    @PostMapping("/unbind")
    public AjaxResult unbindAccount(Long userId)
    {
        try
        {
            int result = bilibiliService.unbindBilibiliAccount(userId);
            return result > 0 ? success("解绑成功") : error("解绑失败");
        }
        catch (Exception e)
        {
            return error("解绑失败: " + e.getMessage());
        }
    }

    /**
     * 查询用户的B站绑定信息
     * 
     * @param userId 用户ID
     */
    @GetMapping("/bind/info")
    public AjaxResult getBindInfo(Long userId)
    {
        try
        {
            return success(bilibiliService.selectSysUserBilibiliByUserId(userId));
        }
        catch (Exception e)
        {
            return error("查询失败: " + e.getMessage());
        }
    }
}
