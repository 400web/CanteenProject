package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.service.CanteenAdminService;

public class CanteenAdminServiceImpl implements CanteenAdminService {
    @Override
    public Canteen getCanteenByAdminId(String adminId) {
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
