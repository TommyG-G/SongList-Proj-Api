package com.ruoyi.system.mapper;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.param.UserExtendInfo;
import org.apache.ibatis.annotations.Param;
import com.ruoyi.common.core.domain.entity.SysUser;

/**
 * 用户表 数据层
 * 
 * @author ruoyi
 */
public interface SysUserMapper
{
    /**
     * 根据条件分页查询用户列表
     * 
     * @param sysUser 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUserList(SysUser sysUser);

    /**
     * 根据条件分页查询已配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectAllocatedList(SysUser user);

    /**
     * 根据条件分页查询未分配用户角色列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUnallocatedList(SysUser user);

    /**
     * 通过用户名查询用户
     * 
     * @param userName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     * 
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public SysUser selectUserById(Long userId);

    /**
     * 新增用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int insertUser(SysUser user);

    /**
     * 修改用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUser(SysUser user);

    /**
     * 修改用户头像
     * 
     * @param userId 用户ID
     * @param avatar 头像地址
     * @return 结果
     */
    public int updateUserAvatar(@Param("userId") Long userId, @Param("avatar") String avatar);

    /**
     * 修改用户状态
     * 
     * @param userId 用户ID
     * @param status 状态
     * @return 结果
     */
    public int updateUserStatus(@Param("userId") Long userId, @Param("status") String status);

    /**
     * 更新用户登录信息（IP和登录时间）
     * 
     * @param userId 用户ID
     * @param loginIp 登录IP地址
     * @param loginDate 登录时间
     * @return 结果
     */
    public int updateLoginInfo(@Param("userId") Long userId, @Param("loginIp") String loginIp, @Param("loginDate") Date loginDate);

    /**
     * 重置用户密码
     * 
     * @param userId 用户ID
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(@Param("userId") Long userId, @Param("password") String password);

    /**
     * 通过用户ID删除用户
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserById(Long userId);

    /**
     * 批量删除用户信息
     * 
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] userIds);

    /**
     * 校验用户名称是否唯一
     * 
     * @param userName 用户名称
     * @return 结果
     */
    public SysUser checkUserNameUnique(String userName);

    /**
     * 校验手机号码是否唯一
     *
     * @param phonenumber 手机号码
     * @return 结果
     */
    public SysUser checkPhoneUnique(String phonenumber);

    /**
     * 校验email是否唯一
     *
     * @param email 用户邮箱
     * @return 结果
     */
    public SysUser checkEmailUnique(String email);

    /**
     * 新增用户扩展信息
     *
     * @param userId 用户ID
     * @param uid UID
     * @param liveUrl 直播链接
     * @param homePage 主页链接
     * @param backgroundImage 背景图片地址
     * @param backgroundColor 背景颜色值
     * @return 结果
     */
    public int insertUserExtendInfo(@Param("userId") Long userId, @Param("uid") String uid,
                                   @Param("liveUrl") String liveUrl, @Param("homePage") String homePage,
                                   @Param("backgroundImage") String backgroundImage, @Param("backgroundColor") String backgroundColor,
                                   @Param("pageTitle") String pageTitle, @Param("mainPrompt") String mainPrompt, @Param("subPrompt") String subPrompt);

    /**
     * 更新用户扩展信息
     *
     * @param userId 用户ID
     * @param uid UID
     * @param liveUrl 直播链接
     * @param homePage 主页链接
     * @param backgroundImage 背景图片地址
     * @return 结果
     */
    public int updateUserExtendInfo(@Param("userId") Long userId, @Param("uid") String uid,
                                   @Param("liveUrl") String liveUrl, @Param("homePage") String homePage,
                                   @Param("backgroundImage") String backgroundImage, @Param("backgroundColor") String backgroundColor,
                                   @Param("pageTitle") String pageTitle, @Param("mainPrompt") String mainPrompt, @Param("subPrompt") String subPrompt);

    /**
     * 根据用户ID查询用户扩展信息
     *
     * @param userId 用户ID
     * @return 用户扩展信息
     */
    public UserExtendInfo selectUserExtendInfoByUserId(@Param("userId") Long userId);

    /**
     * 据自定义文字 UID 获取扩展信息
     *
     * @param uid 字符外生UID
     */
    public UserExtendInfo selectUserExtendInfoByUid(@Param("uid") String uid);

    /**
     * 检查用户扩展信息是否存在
     *
     * @param userId 用户ID
     * @return 存在返回1，不存在返回0
     */
    public int checkUserExtendInfoExists(@Param("userId") Long userId);

    /**
     * 更新用户背景图片
     *
     * @param userId 用户ID
     * @param backgroundImage 背景图片地址
     * @return 结果
     */
    public int updateUserBackgroundImage(@Param("userId") Long userId, @Param("backgroundImage") String backgroundImage);

    /**
     * 更新用户背景颜色
     *
     * @param userId 用户ID
     * @param backgroundColor 背景颜色值
     * @return 结果
     */
    public int updateUserBackgroundColor(@Param("userId") Long userId, @Param("backgroundColor") String backgroundColor);

    /**
     * 更新用户页面标题和提示信息
     *
     * @param userId 用户ID
     * @param pageTitle 网页标签标题
     * @param mainPrompt 主标题
     * @param subPrompt 副标题
     * @return 结果
     */
    public int updateUserPrompts(@Param("userId") Long userId, @Param("pageTitle") String pageTitle,
                                @Param("mainPrompt") String mainPrompt, @Param("subPrompt") String subPrompt);
}
