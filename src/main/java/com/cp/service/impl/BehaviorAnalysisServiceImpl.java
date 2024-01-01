package com.cp.service.impl;

import com.cp.domain.CanteenReview;
import com.cp.domain.DishReview;
import com.cp.mapper.CanteenReviewMapper;
import com.cp.mapper.CommentLikeMapper;
import com.cp.mapper.DishReviewMapper;
import com.cp.service.BehaviorAnalysisService;
import com.cp.service.CanteenReviewService;
import com.cp.service.CanteenService;
import com.cp.service.DishReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class BehaviorAnalysisServiceImpl implements BehaviorAnalysisService {



    @Override
    public boolean recordLike(String userId, String commentId) {
        return MybatisUtils.execute(session -> {
            CommentLikeMapper commentLikeMapper = session.getMapper(CommentLikeMapper.class);
            return commentLikeMapper.addLike(userId, commentId, System.currentTimeMillis());
        });
    }

    @Override
    public boolean detectAbnormalDishRatings(String userId, String dishId) {
        DishReviewService dishReviewService= new DishReviewServiceImpl();
        List<DishReview> dishReviews = dishReviewService.getReviewListById(userId, dishId);
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
        CanteenReviewService canteenReviewService = new CanteenReviewServiceImpl();
        List<CanteenReview> canteenReviews = canteenReviewService.getReviewByUserIdAndCanteenId(userId, canteenId);
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
        return MybatisUtils.execute(session -> {
            CommentLikeMapper commentLikeMapper = session.getMapper(CommentLikeMapper.class);
            return commentLikeMapper.selectLike(userId, commentId);
        });
    }

    @Override
    public boolean deleteLike(String userId, String commentId) {
        return MybatisUtils.execute(session -> {
            CommentLikeMapper commentLikeMapper = session.getMapper(CommentLikeMapper.class);
            return commentLikeMapper.deleteLike(userId, commentId);
        });
    }
}
