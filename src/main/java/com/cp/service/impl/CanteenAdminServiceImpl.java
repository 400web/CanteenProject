package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;
import com.cp.mapper.CanteenAdminMapper;
import com.cp.mapper.CanteenMapper;
import com.cp.mapper.UserMapper;
import com.cp.service.CanteenAdminService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class CanteenAdminServiceImpl implements CanteenAdminService {
    CanteenMapper canteenMapper = MybatisUtils.getMapper(CanteenMapper.class);
    CanteenAdminMapper canteenAdminMapper = MybatisUtils.getMapper(CanteenAdminMapper.class);
    UserMapper userMapper = MybatisUtils.getMapper(UserMapper.class);

    @Override
    public Canteen getCanteenByAdminId(String adminId) {
        String id = canteenAdminMapper.selectCanteenByAdminId(adminId).getCanteenId();
        return canteenMapper.selectById(id);
    }

    @Override
    public List<User> getCanteenAdminByCanteenId(String canteenId) {
        List<String> ids = canteenAdminMapper.selectUserIdsByCanteenId(canteenId);
        return userMapper.selectByIds(ids);
    }

    @Override
    public List<CanteenAdmin> getList() {
        return canteenAdminMapper.selectList();
    }

    @Override
    public boolean addCanteenAdmin(CanteenAdmin canteenAdmin) {
        return canteenAdminMapper.addCanteenAdmin(canteenAdmin);
    }

    @Override
    public boolean deleteCanteenAdmin(String id) {
        return canteenAdminMapper.deleteCanteenAdmin(id);
    }

    @Override
    public boolean updateCanteenAdmin(CanteenAdmin canteenAdmin) {
        return canteenAdminMapper.updateCanteenAdmin(canteenAdmin);
    }
}
