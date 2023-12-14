package com.cp.mapper;

import com.cp.domain.DishReview;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DishReviewMapper{
    DishReview selectById(@Param("id") String id);
    List<DishReview> selectList();
    List<DishReview> selectByDishId(@Param("DishId") String DishId);
    List<DishReview> selectByEvaluatorId(@Param("evaluatorId") String evaluatorId);
    boolean addDishReview(DishReview dishReview);
    boolean updateDishReview(DishReview dishReview);
    boolean deleteDishReview(@Param("id") String id);
}
