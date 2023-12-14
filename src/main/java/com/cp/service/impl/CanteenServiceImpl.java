package com.cp.service.impl;


import com.cp.domain.Canteen;
import com.cp.mapper.CanteenMapper;
import com.cp.service.CanteenService;
import com.cp.utils.MybatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanteenServiceImpl  implements CanteenService {
    CanteenMapper canteenMapper= MybatisUtils.getMapper(CanteenMapper.class);

    @Override
    public Canteen getCanteenById(String canteenId) {
        return canteenMapper.selectById(canteenId);
    }

    @Override
    public Canteen getCanteenByName(String canteenName) {
        return canteenMapper.selectByName(canteenName);
    }

    @Override
    public boolean addCanteen(Canteen canteen) {
        return canteenMapper.addCanteen(canteen);
    }

    @Override
    public boolean updateCanteen(Canteen canteen) {
        return canteenMapper.updateCanteen(canteen);
    }

    @Override
    public boolean deleteCanteen(String canteenId) {
        return canteenMapper.deleteCanteen(canteenId);
    }

    @Override
    public List<Canteen> getList() {
        return canteenMapper.selectList();
    }

    @Override
    public List<Canteen> getListByPage(int currPage, int pageSize) {
        Map<String,Object> data=new HashMap<>();
        data.put("currPage",currPage);
        data.put("pageSize",pageSize);
        return canteenMapper.selectListByPage(data);
    }
}
