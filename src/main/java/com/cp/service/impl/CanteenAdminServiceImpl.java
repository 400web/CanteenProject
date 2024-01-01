package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;
import com.cp.mapper.CanteenAdminMapper;
import com.cp.service.CanteenAdminService;
import com.cp.service.CanteenService;
import com.cp.service.UserService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class CanteenAdminServiceImpl implements CanteenAdminService {

    @Override
    public Canteen getCanteenByAdminId(String adminId) {

        String id = MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.selectCanteenByAdminId(adminId).getCanteenId();
        });
        CanteenService canteenService = new CanteenServiceImpl();
        return canteenService.getCanteenById(id);
    }

    @Override
    public List<User> getCanteenAdminByCanteenId(String canteenId) {
        List<String> ids =  MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.selectUserIdsByCanteenId(canteenId);
        });
        UserService userService = new UserServiceImpl();
        return userService.getListByIds(ids);
    }

    @Override
    public List<CanteenAdmin> getList() {
        return MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.selectList();
        });
    }

    @Override
    public boolean addCanteenAdminRelation(String adminId, String canteenId) {
        return addCanteenAdmin(new CanteenAdmin(adminId, canteenId, null));
    }

    @Override
    public boolean deleteCanteenAdminRelation(String adminId, String canteenId) {
        return false;
    }

    @Override
    public boolean addCanteenAdmin(CanteenAdmin canteenAdmin) {
        return MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.addCanteenAdmin(canteenAdmin);
        });
    }

    @Override
    public boolean updateCanteenAdmin(CanteenAdmin canteenAdmin) {
        return MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.updateCanteenAdmin(canteenAdmin);
        });
    }

    @Override
    public boolean deleteCanteenAdmin(String id) {
        return MybatisUtils.execute(session -> {
            CanteenAdminMapper canteenAdminMapper = session.getMapper(CanteenAdminMapper.class);
            return canteenAdminMapper.deleteCanteenAdmin(id);
        });
    }
}
