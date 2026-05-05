package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Bilibili账号绑定对象 sys_user_bilibili
 * 
 * @author ruoyi
 * @date 2026-04-25
 */
public class SysUserBilibili extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 若依系统用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** Bilibili用户UID */
    @Excel(name = "B站UID")
    private String biliUid;

    /** Bilibili用户名 */
    @Excel(name = "B站用户名")
    private String biliUname;

    /** Bilibili头像URL */
    private String biliFace;

    /** B站会话令牌(SESSDATA) */
    private String sessdata;

    /** B站CSRF令牌(bili_jct) */
    private String biliJct;

    /** B站DedeUserID */
    private String dedeUserid;

    /** 刷新令牌 */
    private String refreshToken;

    /** Token过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "Token过期时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date tokenExpireTime;

    /** 绑定状态(0已绑定 1已解绑) */
    @Excel(name = "绑定状态", readConverterExp = "0=已绑定,1=已解绑")
    private String bindStatus;

    /** 绑定时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "绑定时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date bindTime;

    /** 解绑时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "解绑时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date unbindTime;

    /** 最后登录时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后登录时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setBiliUid(String biliUid) 
    {
        this.biliUid = biliUid;
    }

    public String getBiliUid() 
    {
        return biliUid;
    }

    public void setBiliUname(String biliUname) 
    {
        this.biliUname = biliUname;
    }

    public String getBiliUname() 
    {
        return biliUname;
    }

    public void setBiliFace(String biliFace) 
    {
        this.biliFace = biliFace;
    }

    public String getBiliFace() 
    {
        return biliFace;
    }

    public void setSessdata(String sessdata) 
    {
        this.sessdata = sessdata;
    }

    public String getSessdata() 
    {
        return sessdata;
    }

    public void setBiliJct(String biliJct) 
    {
        this.biliJct = biliJct;
    }

    public String getBiliJct() 
    {
        return biliJct;
    }

    public void setDedeUserid(String dedeUserid) 
    {
        this.dedeUserid = dedeUserid;
    }

    public String getDedeUserid() 
    {
        return dedeUserid;
    }

    public void setRefreshToken(String refreshToken) 
    {
        this.refreshToken = refreshToken;
    }

    public String getRefreshToken() 
    {
        return refreshToken;
    }

    public void setTokenExpireTime(Date tokenExpireTime) 
    {
        this.tokenExpireTime = tokenExpireTime;
    }

    public Date getTokenExpireTime() 
    {
        return tokenExpireTime;
    }

    public void setBindStatus(String bindStatus) 
    {
        this.bindStatus = bindStatus;
    }

    public String getBindStatus() 
    {
        return bindStatus;
    }

    public void setBindTime(Date bindTime) 
    {
        this.bindTime = bindTime;
    }

    public Date getBindTime() 
    {
        return bindTime;
    }

    public void setUnbindTime(Date unbindTime) 
    {
        this.unbindTime = unbindTime;
    }

    public Date getUnbindTime() 
    {
        return unbindTime;
    }

    public void setLastLoginTime(Date lastLoginTime) 
    {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getLastLoginTime() 
    {
        return lastLoginTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("biliUid", getBiliUid())
            .append("biliUname", getBiliUname())
            .append("biliFace", getBiliFace())
            .append("sessdata", getSessdata())
            .append("biliJct", getBiliJct())
            .append("dedeUserid", getDedeUserid())
            .append("refreshToken", getRefreshToken())
            .append("tokenExpireTime", getTokenExpireTime())
            .append("bindStatus", getBindStatus())
            .append("bindTime", getBindTime())
            .append("unbindTime", getUnbindTime())
            .append("lastLoginTime", getLastLoginTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
