package com.cp.service.impl;

import com.cp.domain.DishReview;
import com.cp.mapper.DishReviewMapper;
import com.cp.service.DishReviewService;

import java.util.List;

public class DishReviewServiceImpl implements DishReviewService {
    @Override
    public List<DishReview> getReviewsByDishId(String dishId) {
        return null;
    }

    @Override
    public List<DishReview> getReviewByUserIdAndDishId(String userId, String dishId) {

        return null;
    }

    @Override
    public boolean deleteDishReview(String userId, String dishId) {
        return false;
    }
}
