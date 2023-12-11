package com.cp.service;

import com.cp.domain.User;

public interface UserService{
    /**
     * 用户注册
     * 获取用户名，密码，手机号
     * 将用户数据存进数据库后，返回User对象
     * 通过用户手机号查询获取数据库里相应手机号的用户对象
     * 如果dao层返回User对象，则说明该手机号已有人使用，返回null
     *
     * @param username    用户名
     * @param password    密码
     * @param phoneNumber 手机号
     * @return {@code 0} 成功注册用户 {@code 1} 用户名已被使用 {@code 2} 手机号已被使用
     */
    int register(String username, String password, String phoneNumber);

    /**
     * 用户登录
     * 通过用户手机号查询获取数据库里相应手机号的用户对象
     * 如果有且密码正确，返回该用户对象，否则返回null
     *
     * @param phoneNumber 用户手机号
     * @param password    密码
     * @return 登录成功User对象
     */
    User login(String phoneNumber, String password);

    /**
     * 用户删除
     * 删除user表和相应的角色表的用户信息
     *
     * @param id 用户id
     * @return {@code true} 如果成功删除用户账号信息，否则 {@code false}
     */
    boolean deleteUserAccount(String id);
}
