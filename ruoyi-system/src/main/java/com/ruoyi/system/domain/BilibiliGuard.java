package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * B站舰长对象 bilibili_guard
 * 
 * @author ruoyi
 * @date 2026-05-01
 */
public class BilibiliGuard extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 若依用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** B站UID */
    @Excel(name = "B站UID")
    private String guardUid;

    /** B站用户名 */
    @Excel(name = "用户名")
    private String guardUsername;

    /** 舰长等级 1:总督 2:提督 3:舰长 */
    @Excel(name = "舰长等级", readConverterExp = "1=总督,2=提督,3=舰长")
    private Integer guardLevel;

    /** 舰长类型文本 */
    @Excel(name = "舰长类型")
    private String guardLevelText;

    /** 直播间ID */
    @Excel(name = "直播间ID")
    private Long roomId;

    /** 主播UID */
    @Excel(name = "主播UID")
    private String anchorUid;

    /** 开通时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开通时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 过期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "过期时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 是否自动续费 0:否 1:是 */
    @Excel(name = "自动续费", readConverterExp = "0=否,1=是")
    private Integer autoRenew;

    /** 私信发送状态 0:未发送 1:已发送 2:发送失败 */
    @Excel(name = "发送状态", readConverterExp = "0=未发送,1=已发送,2=失败")
    private Integer sendStatus;

    /** 私信发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

    /** 私信发送结果消息 */
    @Excel(name = "发送结果")
    private String sendMsg;

    /** 数据快照日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "快照日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date snapshotDate;

    /** 舰长地址/备注信息 */
    @Excel(name = "地址/备注")
    private String guardAddress;

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

    public void setGuardUid(String guardUid) 
    {
        this.guardUid = guardUid;
    }

    public String getGuardUid() 
    {
        return guardUid;
    }

    public void setGuardUsername(String guardUsername) 
    {
        this.guardUsername = guardUsername;
    }

    public String getGuardUsername() 
    {
        return guardUsername;
    }

    public void setGuardLevel(Integer guardLevel) 
    {
        this.guardLevel = guardLevel;
    }

    public Integer getGuardLevel() 
    {
        return guardLevel;
    }

    public void setGuardLevelText(String guardLevelText) 
    {
        this.guardLevelText = guardLevelText;
    }

    public String getGuardLevelText() 
    {
        return guardLevelText;
    }

    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }

    public void setAnchorUid(String anchorUid) 
    {
        this.anchorUid = anchorUid;
    }

    public String getAnchorUid() 
    {
        return anchorUid;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    public void setAutoRenew(Integer autoRenew) 
    {
        this.autoRenew = autoRenew;
    }

    public Integer getAutoRenew() 
    {
        return autoRenew;
    }

    public void setSendStatus(Integer sendStatus) 
    {
        this.sendStatus = sendStatus;
    }

    public Integer getSendStatus() 
    {
        return sendStatus;
    }

    public void setSendTime(Date sendTime) 
    {
        this.sendTime = sendTime;
    }

    public Date getSendTime() 
    {
        return sendTime;
    }

    public void setSendMsg(String sendMsg) 
    {
        this.sendMsg = sendMsg;
    }

    public String getSendMsg() 
    {
        return sendMsg;
    }

    public void setSnapshotDate(Date snapshotDate) 
    {
        this.snapshotDate = snapshotDate;
    }

    public Date getSnapshotDate() 
    {
        return snapshotDate;
    }

    public void setGuardAddress(String guardAddress) 
    {
        this.guardAddress = guardAddress;
    }

    public String getGuardAddress() 
    {
        return guardAddress;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("guardUid", getGuardUid())
            .append("guardUsername", getGuardUsername())
            .append("guardLevel", getGuardLevel())
            .append("guardLevelText", getGuardLevelText())
            .append("roomId", getRoomId())
            .append("anchorUid", getAnchorUid())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("autoRenew", getAutoRenew())
            .append("sendStatus", getSendStatus())
            .append("sendTime", getSendTime())
            .append("sendMsg", getSendMsg())
            .append("snapshotDate", getSnapshotDate())
            .append("guardAddress", getGuardAddress())
            .toString();
    }
}
