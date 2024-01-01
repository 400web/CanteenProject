package com.cp.service.impl;


import com.cp.domain.CanteenAdmin;
import com.cp.domain.OrdinaryUser;
import com.cp.domain.SystemAdmin;
import com.cp.domain.User;
import com.cp.mapper.CanteenAdminMapper;
import com.cp.mapper.OrdinaryUserMapper;
import com.cp.mapper.SystemAdminMapper;
import com.cp.mapper.UserMapper;
import com.cp.service.CanteenAdminService;
import com.cp.service.OrdinaryUserService;
import com.cp.service.SystemAdminService;
import com.cp.service.UserService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class UserServiceImpl implements UserService {

    @Override
    public int register(User user) {
        if (getByUsername(user.getUsername()) != null) {
            return 1;
        }
        if (getUserByPhoneNumber(user.getPhoneNumber()) != null) {
            return 2;
        }
        addUser(user);
        return 0;

    }

    @Override
    public User login(String phoneNumber, String password) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.login(phoneNumber, password);
        });
    }

    @Override
    public User getByUsername(String name) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.selectByUsername(name);
        });
    }

    @Override
    public User getUserByPhoneNumber(String phoneNumber) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.selectByPhoneNumber(phoneNumber);
        });
    }

    @Override
    public boolean deleteUserAccount(String id) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.deleteUser(id);
        });
    }

    @Override
    public User getUserById(String id) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.selectById(id);
        });
    }

    @Override
    public List<User> getList() {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.selectList();
        });
    }

    @Override
    public List<User> getListByIds(List<String> ids) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.selectByIds(ids);
        });
    }

    @Override
    public boolean addUser(User user) {
        MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.addUser(user);
        });
        OrdinaryUserService ordinaryUserService = new OrdinaryUserServiceImpl();
        return ordinaryUserService.addOrdinaryUser(new OrdinaryUser(user.getId(), 0, 0, 0, 1));
    }

    @Override
    public boolean updateUserRole(User user, String canteenId) {
        CanteenAdminService canteenAdminService = new CanteenAdminServiceImpl();
        if (user.getRole().equals("食堂管理员")) {
            if (canteenAdminService.getCanteenByAdminId(user.getId()) == null) {
                canteenAdminService.addCanteenAdmin(new CanteenAdmin(user.getId(), canteenId, null));
            } else canteenAdminService.updateCanteenAdmin(new CanteenAdmin(user.getId(), canteenId, null));
        }
        if (user.getRole().equals("普通用户") && canteenAdminService.getCanteenByAdminId(user.getId()) != null) {
            canteenAdminService.deleteCanteenAdmin(user.getId());
        }
        return updateUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return MybatisUtils.execute(session -> {
            UserMapper userMapper = session.getMapper(UserMapper.class);
            return userMapper.updateUser(user);
        });
    }
}
