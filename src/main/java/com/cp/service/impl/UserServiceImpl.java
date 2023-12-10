package com.cp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cp.domain.User;
import com.cp.mapper.UserMapper;
import com.cp.service.UserService;
import org.springframework.stereotype.Component;

@Component
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Override
    public int register(String username, String password, String phoneNumber) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .select(User::getUsername)
                .eq(User::getUsername, username);

        if (getOne(wrapper) != null) {
            return 1;
        }
        wrapper.select(User::getUsername)
                .eq(User::getPhoneNumber, phoneNumber);
        if (getOne(wrapper) != null) {
            return 2;
        }
        return 0;
    }

    @Override
    public User login(String phoneNumber, String password) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getPhoneNumber, phoneNumber)
                .eq(User::getPassword, password);
        return getOne(wrapper);
    }

    @Override
    public boolean deleteUserAccount(String id) {
        return false;
    }
}
