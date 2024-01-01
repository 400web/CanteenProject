package com.cp.service.impl;

import com.cp.domain.Dish;
import com.cp.mapper.DishMapper;
import com.cp.service.DishService;
import com.cp.utils.MybatisUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DishServiceImpl implements DishService {

    @Override
    public Dish getDishById(String dishId) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectById(dishId);
        });
    }

    @Override
    public List<Dish> getDishesByCanteenId(String canteenId) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectListByCanteenId(canteenId);
        });
    }

    @Override
    public List<Dish> getDishByCuisine(String cuisine) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectListByCuisine(cuisine);
        });
    }

    @Override
    public List<Dish> getDishByPrice(String minPrice, String maxPrice) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectListByPrice(minPrice, maxPrice);
        });
    }

    @Override
    public List<Dish> getList() {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectList();
        });
    }

    @Override
    public List<Dish> getListByPage(int currPage, int pageSize) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            Map<String, Object> data = new HashMap<>();
            data.put("currPage", currPage);
            data.put("pageSize", pageSize);
            return dishMapper.selectListByPage(data);
        });
    }

    @Override
    public List<Dish> getDishesDynamic(String dishName, String canteenId, String cuisine, String minPrice, String maxPrice) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            Map<String, Object> paramMap = new HashMap<>();
            // 添加不为 null 的条件到 Map
            if (dishName != null && !dishName.isEmpty()) {
                paramMap.put("dishName", dishName);
            }
            if (canteenId != null && !canteenId.isEmpty()) {
                paramMap.put("canteenId", canteenId);
            }
            if (cuisine != null && !cuisine.isEmpty()) {
                paramMap.put("cuisine", cuisine);
            }
            if (minPrice != null && !minPrice.isEmpty()) {
                paramMap.put("minPrice", Double.parseDouble(minPrice));
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                paramMap.put("maxPrice", Double.parseDouble(maxPrice));
            }
            return dishMapper.selectDishesDynamic(paramMap);
        });
    }

    @Override
    public List<Dish> getDishesByRecommend() {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.selectDishesByRecommend();
        });
    }

    @Override
    public boolean addDish(Dish dish) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.addDish(dish);
        });
    }

    @Override
    public boolean updateDish(Dish dish) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.updateDish(dish);
        });
    }

    @Override
    public boolean deleteDish(String id) {
        return MybatisUtils.execute(session -> {
            DishMapper dishMapper = session.getMapper(DishMapper.class);
            return dishMapper.deleteDish(id);
        });
    }
}

