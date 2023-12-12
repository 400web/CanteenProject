package com.cp.service.impl;


import com.cp.domain.User;
import com.cp.mapper.UserMapper;
import com.cp.service.UserService;
import com.cp.utils.MybatisUtils;

public class UserServiceImpl implements UserService {

    public int register(String username, String password, String phoneNumber) {
        return 0;
    }

    @Override
    public User login(String phoneNumber, String password) {
        UserMapper userMapper = MybatisUtils.getMapper(UserMapper.class);
        return userMapper.login(phoneNumber,password);
    }

    @Override
    public boolean deleteUserAccount(String id) {
        return false;
    }
}
