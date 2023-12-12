package com.cp.service;


import com.cp.domain.DishReview;

import java.util.List;

public interface DishReviewService{
    /**
     * 获取指定菜品的所有评价
     *
     * @param dishId 菜品ID
     * @return 菜品的评价列表，若不存在返回空列表
     */
    List<DishReview> getReviewsByDishId(String dishId);

    /**
     * 获取指定用户对菜品的评价
     *
     * @param userId 用户ID
     * @param dishId 菜品ID
     * @return 菜品用户的评价列表，若不存在返回空列表
     */
    List<DishReview> getReviewByUserIdAndDishId(String userId, String dishId);

    /**
     * 删除指定用户对菜品的评价
     *
     * @param userId 用户ID
     * @param dishId 菜品ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteDishReview(String userId, String dishId);
}
