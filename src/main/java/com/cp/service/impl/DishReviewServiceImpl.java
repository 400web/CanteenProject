package com.cp.service.impl;

import com.cp.domain.DishReview;
import com.cp.mapper.DishReviewMapper;
import com.cp.service.DishReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class DishReviewServiceImpl implements DishReviewService {

    @Override
    public DishReview getDishReviewById(String id) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.selectById(id);
        });
    }

    @Override
    public List<DishReview> getReviewsByDishId(String dishId) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.selectByDishId(dishId);
        });
    }

    @Override
    public List<DishReview> getReviewListById(String userId, String dishId) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.selectByEvaluatorIdDishId(userId, dishId);
        });
    }

    @Override
    public List<DishReview> getReviewListByName(String name) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.selectListByName(name);
        });
    }

    @Override
    public boolean deleteDishReview(String id) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.deleteDishReview(id);
        });
    }

    @Override
    public boolean addDishReview(DishReview dishReview) {
        return MybatisUtils.execute(session -> {
            DishReviewMapper dishReviewMapper = session.getMapper(DishReviewMapper.class);
            return dishReviewMapper.addDishReview(dishReview);
        });
    }
}

