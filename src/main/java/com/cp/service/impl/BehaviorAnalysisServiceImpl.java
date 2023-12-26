package com.cp.service.impl;

import com.cp.domain.CanteenReview;
import com.cp.domain.DishReview;
import com.cp.mapper.CanteenReviewMapper;
import com.cp.mapper.CommentLikeMapper;
import com.cp.mapper.DishReviewMapper;
import com.cp.service.BehaviorAnalysisService;
import com.cp.service.DishReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class BehaviorAnalysisServiceImpl implements BehaviorAnalysisService {
    CommentLikeMapper commentLikeMapper = MybatisUtils.getMapper(CommentLikeMapper.class);
    CanteenReviewMapper canteenReviewMapper = MybatisUtils.getMapper(CanteenReviewMapper.class);
    DishReviewMapper dishReviewMapper = MybatisUtils.getMapper(DishReviewMapper.class);

    @Override
    public boolean recordLike(String userId, String commentId) {
        return commentLikeMapper.addLike(userId, commentId, System.currentTimeMillis());
    }

    @Override
    public boolean detectAbnormalDishRatings(String userId, String dishId) {
        List<DishReview> dishReviews = dishReviewMapper.selectByEvaluatorIdDishId(userId, dishId);
        int count = 0;
        double allScore = 0;
        for (DishReview dishReview : dishReviews) {
            if (count >= 5) {
                return false;
            }
            if (System.currentTimeMillis() - dishReview.getTimestamp() <= 1000 * 60 * 5) count++;
            allScore += dishReview.getEvaluationScore();
        }
        double score = allScore / dishReviews.size();
        if (dishReviews.size() > 5 && (score > 4.5 || score < 1.5)) return false;
        return true;
    }

    @Override
    public boolean detectAbnormalCanteenRatings(String userId, String canteenId) {
        List<CanteenReview> canteenReviews = canteenReviewMapper.selectListById(userId, canteenId);
        int count = 0;
        double allScore = 0;
        for (CanteenReview canteenReview : canteenReviews) {
            if (count >= 5) {
                return false;
            }
            if (System.currentTimeMillis() - canteenReview.getTimestamp() <= 1000 * 60 * 5) count++;
            allScore += canteenReview.getEvaluationScore();
        }
        double score = allScore / canteenReviews.size();
        if (canteenReviews.size() > 5 && (score > 4.5 || score < 1.5)) return false;
        return true;
    }

    @Override
    public Long detectLikeStatus(String userId, String commentId) {
        return commentLikeMapper.selectLike(userId, commentId);
    }

    @Override
    public boolean deleteLike(String userId, String commentId) {
        return commentLikeMapper.deleteLike(userId, commentId);
    }
}
