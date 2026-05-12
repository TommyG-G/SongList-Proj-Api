package com.ruoyi.web.controller.system;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.common.core.domain.param.UserExtendInfo;

/**
 * 域名数据访问控制器
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/domain-service")
public class DomainDataController extends BaseController
{
    @Autowired
    private ISysUserService userService;

    /**
     * 根据域名获取用户扩展信息
     * 用于泛域名访问时自动识别用户
     */
    @GetMapping("/view")
    public AjaxResult getDataByDomain(HttpServletRequest request)
    {
        // 1. 从 Header 中获取 Host (例如: demo1.yourdomain.com)
        String host = request.getHeader("Host");
        
        if (StringUtils.isEmpty(host) || !host.contains("."))
        {
            return error("无效的访问地址");
        }

        // 2. 提取二级域名部分 (demo1)
        String subdomain = host.split("\\.")[0];

        logger.info("访问域名: {}, 提取的子域名: {}", host, subdomain);

        // 3. 直接从 user_extend_info 表查询用户扩展信息
        UserExtendInfo extendInfo = userService.selectUserExtendInfoBySubdomain(subdomain);

        if (extendInfo == null)
        {
            return error("该域名未绑定任何数据，请联系管理员配置");
        }

        logger.info("子域名 {} 对应的用户ID: {}", subdomain, extendInfo.getUserId());

        return success(extendInfo);
    }

    /**
     * 根据域名获取UID（简化接口）
     */
    @GetMapping("/uid")
    public AjaxResult getUidByDomain(HttpServletRequest request)
    {
        String host = request.getHeader("Host");
        
        if (StringUtils.isEmpty(host) || !host.contains("."))
        {
            return error("无效的访问地址");
        }

        String subdomain = host.split("\\.")[0];
        UserExtendInfo extendInfo = userService.selectUserExtendInfoBySubdomain(subdomain);

        if (extendInfo == null)
        {
            return error("该域名未绑定任何数据");
        }

        AjaxResult ajax = success();
        ajax.put("uid", extendInfo.getUserId());
        ajax.put("subdomain", subdomain);
        return ajax;
    }
}
