package com.ruoyi.system.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.param.UserExtendInfo;

/**
 * 用户 业务层
 * 
 * @author ruoyi
 */
public interface ISysUserService
{
    /**
     * 根据条件分页查询用户列表
     * 
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    public List<SysUser> selectUserList(SysUser user);

    /**
     * 根据条件分页查询已分配用户角色列表
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
     * 根据用户ID查询用户所属角色组
     * 
     * @param userName 用户名
     * @return 结果
     */
    public String selectUserRoleGroup(String userName);

    /**
     * 根据用户ID查询用户所属岗位组
     * 
     * @param userName 用户名
     * @return 结果
     */
    public String selectUserPostGroup(String userName);

    /**
     * 校验用户名称是否唯一
     * 
     * @param user 用户信息
     * @return 结果
     */
    public boolean checkUserNameUnique(SysUser user);

    /**
     * 校验手机号码是否唯一
     *
     * @param user 用户信息
     * @return 结果
     */
    public boolean checkPhoneUnique(SysUser user);

    /**
     * 校验email是否唯一
     *
     * @param user 用户信息
     * @return 结果
     */
    public boolean checkEmailUnique(SysUser user);

    /**
     * 校验用户是否允许操作
     * 
     * @param user 用户信息
     */
    public void checkUserAllowed(SysUser user);

    /**
     * 校验用户是否有数据权限
     * 
     * @param userId 用户id
     */
    public void checkUserDataScope(Long userId);

    /**
     * 新增用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int insertUser(SysUser user);

    /**
     * 注册用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public boolean registerUser(SysUser user);

    /**
     * 修改用户信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUser(SysUser user);

    /**
     * 用户授权角色
     * 
     * @param userId 用户ID
     * @param roleIds 角色组
     */
    public void insertUserAuth(Long userId, Long[] roleIds);

    /**
     * 修改用户状态
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserStatus(SysUser user);

    /**
     * 修改用户基本信息
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int updateUserProfile(SysUser user);

    /**
     * 修改用户头像
     * 
     * @param userId 用户ID
     * @param avatar 头像地址
     * @return 结果
     */
    public boolean updateUserAvatar(Long userId, String avatar);

    /**
     * 更新用户登录信息（IP和登录时间）
     * 
     * @param userId 用户ID
     * @param loginIp 登录IP地址
     * @param loginDate 登录时间
     * @return 结果
     */
    public void updateLoginInfo(Long userId, String loginIp, Date loginDate);

    /**
     * 重置用户密码
     * 
     * @param user 用户信息
     * @return 结果
     */
    public int resetPwd(SysUser user);

    /**
     * 重置用户密码
     * 
     * @param userId 用户ID
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(Long userId, String password);

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
     * 导入用户数据
     * 
     * @param userList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName);

    /**
     * 新增或更新用户扩展信息
     *
     * @param user 用户扩展信息
     * @return 结果
     */
    public Integer addUserExtendInfo(UserExtendInfo user);

    /**
     * 根据当前登录用户ID查询用户扩展信息
     *
     * @return 用户扩展信息
     */
    public UserExtendInfo selectUserExtendInfo();

    /**
     * 根据任意指定用户ID查询用户扩展信息（免登录可见适用）
     *
     * @param userId 提取的用户ID
     * @return 用户扩展信息
     */
    public UserExtendInfo selectUserExtendInfoByUserId(Long userId);

    /**
     * 通过外部推广自设的 UID 字符串查询扩展配置与内部映射 (用于免登录关联)
     */
    public UserExtendInfo selectUserExtendInfoByUid(String uid);

    /**
     * 根据二级域名查询用户扩展信息
     *
     * @param subdomain 二级域名前缀
     * @return 用户扩展信息
     */
    public UserExtendInfo selectUserExtendInfoBySubdomain(String subdomain);

    /**
     * 更新用户背景图片
     *
     * @param backgroundImage 背景图片地址
     * @return 结果
     */
    public boolean updateUserBackgroundImage(String backgroundImage);

    /**
     * 更新用户背景颜色
     *
     * @param backgroundColor 背景颜色值
     * @return 结果
     */
    public boolean updateUserBackgroundColor(String backgroundColor);

    /**
     * 更新用户页面标题和提示信息
     *
     * @param pageTitle 网页标签标题
     * @param mainPrompt 主标题
     * @param subPrompt 副标题
     * @return 结果
     */
    public boolean updateUserPrompts(String pageTitle, String mainPrompt, String subPrompt);
}
