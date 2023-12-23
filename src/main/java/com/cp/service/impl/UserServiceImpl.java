package com.cp.service.impl;


import com.cp.domain.CanteenAdmin;
import com.cp.domain.OrdinaryUser;
import com.cp.domain.SystemAdmin;
import com.cp.domain.User;
import com.cp.mapper.CanteenAdminMapper;
import com.cp.mapper.OrdinaryUserMapper;
import com.cp.mapper.SystemAdminMapper;
import com.cp.mapper.UserMapper;
import com.cp.service.SystemAdminService;
import com.cp.service.UserService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserMapper userMapper = MybatisUtils.getMapper(UserMapper.class);
    SystemAdminMapper systemAdminMapper = MybatisUtils.getMapper(SystemAdminMapper.class);
    OrdinaryUserMapper ordinaryUserMapper = MybatisUtils.getMapper(OrdinaryUserMapper.class);
    CanteenAdminMapper canteenAdminMapper = MybatisUtils.getMapper(CanteenAdminMapper.class);

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
    public List<User> getList() {
        return userMapper.selectList();
    }

    @Override
    public List<User> getListByIds(List<String> ids) {
        return userMapper.selectByIds(ids);
    }

    @Override
    public boolean addUser(User user) {
        if (!userMapper.addUser(user)) return false;
        ordinaryUserMapper.addOrdinaryUser(new OrdinaryUser(user.getId(), 0, 0, 0, 1));
        return true;
    }

    @Override
    public boolean updateUserRole(User user, String canteenId) {
        if (user.getRole().equals("食堂管理员")) {
            canteenAdminMapper.addCanteenAdmin(new CanteenAdmin(user.getId(), canteenId,null));
        }
        if (user.getRole().equals("普通用户")) {
            canteenAdminMapper.deleteCanteenAdmin(user.getId());
        }
        return userMapper.updateUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }
}
