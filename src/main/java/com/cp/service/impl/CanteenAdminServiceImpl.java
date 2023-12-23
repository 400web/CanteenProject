package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;
import com.cp.mapper.CanteenAdminMapper;
import com.cp.mapper.CanteenMapper;
import com.cp.service.CanteenAdminService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class CanteenAdminServiceImpl implements CanteenAdminService {
    CanteenMapper canteenMapper= MybatisUtils.getMapper(CanteenMapper.class);
    CanteenAdminMapper canteenAdminMapper=MybatisUtils.getMapper(CanteenAdminMapper.class);
    @Override
    public Canteen getCanteenByAdminId(String adminId) {
        String id= canteenAdminMapper.selectCanteenByAdminId(adminId).getCanteenId();
        return canteenMapper.selectById(id);
    }

    @Override
    public List<User> getCanteenAdminByCanteenId(String canteenId) {
        return null;
    }

    @Override
    public boolean addCanteenAdminRelation(String adminId, String canteenId) {
        return false;
    }

    @Override
    public boolean deleteCanteenAdminRelation(String adminId, String canteenId) {
        return false;
    }
}
