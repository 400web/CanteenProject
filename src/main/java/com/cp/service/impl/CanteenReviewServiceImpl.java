package com.cp.service.impl;

import com.cp.domain.CanteenReview;
import com.cp.mapper.CanteenReviewMapper;
import com.cp.service.CanteenReviewService;

import java.util.List;

public class CanteenReviewServiceImpl implements CanteenReviewService {
    @Override
    public List<CanteenReview> getReviewsByCanteenId(String canteenId) {

        return null;
    }

    @Override
    public List<CanteenReview> getReviewByUserIdAndCanteenId(String userId, String canteenId) {
        return null;
    }

    @Override
    public boolean deleteCanteenReview(String userId, String canteenId) {
        return false;
    }

}
