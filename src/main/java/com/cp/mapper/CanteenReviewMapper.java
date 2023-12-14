package com.cp.mapper;

import com.cp.domain.CanteenReview;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CanteenReviewMapper {
    CanteenReview selectById(@Param("id") String id);
    List<CanteenReview> selectByCanteenId(@Param("canteenId") String canteenId);
    List<CanteenReview> selectByEvaluatorId(@Param("evaluatorId") String evaluatorId);
    boolean addCanteenReview(CanteenReview canteenReview);
    boolean updateCanteenReview(CanteenReview canteenReview);
    boolean deleteCanteenReview(@Param("id") String id);
}
