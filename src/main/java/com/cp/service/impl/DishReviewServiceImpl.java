package com.cp.service.impl;

import com.cp.domain.DishReview;
import com.cp.mapper.DishReviewMapper;
import com.cp.service.DishReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class DishReviewServiceImpl implements DishReviewService {
    DishReviewMapper dishReviewMapper= MybatisUtils.getMapper(DishReviewMapper.class);

    @Override
    public DishReview getDishReviewById(String id) {
        return dishReviewMapper.selectById(id);
    }

    @Override
    public List<DishReview> getReviewsByDishId(String dishId) {
        return dishReviewMapper.selectByDishId(dishId);
    }

    @Override
    public List<DishReview> getReviewListById(String userId, String dishId) {
        return dishReviewMapper.selectByEvaluatorIdDishId(userId,dishId);
    }

    @Override
    public boolean deleteDishReview(String id) {
        return dishReviewMapper.deleteDishReview(id);
    }
}
