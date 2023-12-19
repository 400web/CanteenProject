package com.cp.service.impl;


import com.cp.domain.User;
import com.cp.mapper.UserMapper;
import com.cp.service.UserService;
import com.cp.utils.MybatisUtils;

public class UserServiceImpl implements UserService {
    UserMapper userMapper = MybatisUtils.getMapper(UserMapper.class);

    public int register(User user) {
        if (userMapper.selectByUsername(user.getUsername()) != null) {
            return 1;
        }
        if (userMapper.selectByPhoneNumber(user.getPhoneNumber()) != null) {
            return 2;
        }
        userMapper.addUser(user);
        return 0;
    }

    @Override
    public User login(String phoneNumber, String password) {
        return userMapper.login(phoneNumber, password);
    }

    @Override
    public boolean deleteUserAccount(String id) {
        return false;
    }

    @Override
    public boolean addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }
}
