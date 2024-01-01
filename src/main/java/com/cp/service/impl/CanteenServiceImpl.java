package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.mapper.CanteenMapper;
import com.cp.service.CanteenService;
import com.cp.utils.MybatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanteenServiceImpl implements CanteenService {

    @Override
    public Canteen getCanteenById(String canteenId) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.selectById(canteenId);
        });
    }

    @Override
    public Canteen getCanteenByName(String canteenName) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.selectByName(canteenName);
        });
    }

    @Override
    public List<Canteen> getListLikeName(String name) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.selectListLikeName(name);
        });
    }

    @Override
    public boolean addCanteen(Canteen canteen) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.addCanteen(canteen);
        });
    }

    @Override
    public boolean updateCanteen(Canteen canteen) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.updateCanteen(canteen);
        });
    }

    @Override
    public boolean deleteCanteen(String canteenId) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.deleteCanteen(canteenId);
        });
    }

    @Override
    public List<Canteen> getList() {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            return canteenMapper.selectList();
        });
    }

    @Override
    public List<Canteen> getListByPage(int currPage, int pageSize) {
        return MybatisUtils.execute(session -> {
            CanteenMapper canteenMapper = session.getMapper(CanteenMapper.class);
            Map<String, Object> data = new HashMap<>();
            data.put("currPage", currPage);
            data.put("pageSize", pageSize);
            return canteenMapper.selectListByPage(data);
        });
    }
}
