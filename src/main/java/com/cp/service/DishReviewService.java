package com.cp.service;


import com.cp.domain.DishReview;

import java.util.List;

public interface DishReviewService{
    /**
     * ID获取评价
     * @param id 评价ID
     * @return 评价
     */
    DishReview getDishReviewById(String id);
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
    List<DishReview> getReviewListById(String userId, String dishId);

    /**
     * 删除评价
     *
     * @param id ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteDishReview(String id);
    boolean addDishReview(DishReview dishReview);
}
