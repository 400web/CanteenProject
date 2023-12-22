package com.cp.service.impl;

import com.cp.domain.CanteenReview;
import com.cp.mapper.CanteenReviewMapper;
import com.cp.service.CanteenReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class CanteenReviewServiceImpl implements CanteenReviewService {
    CanteenReviewMapper canteenReviewMapper= MybatisUtils.getMapper(CanteenReviewMapper.class);

    @Override
    public CanteenReview getCanteenReviewById(String id) {
        return canteenReviewMapper.selectById(id);
    }

    @Override
    public List<CanteenReview> getReviewsByCanteenId(String canteenId) {
        return canteenReviewMapper.selectByCanteenId(canteenId);
    }

    @Override
    public List<CanteenReview> getReviewByUserIdAndCanteenId(String userId, String canteenId) {
        return canteenReviewMapper.selectListById(userId,canteenId);
    }

    @Override
    public List<CanteenReview> getReviewByName(String name) {
        return canteenReviewMapper.selectListByName(name);
    }

    @Override
    public boolean deleteCanteenReview(String id) {
        return canteenReviewMapper.deleteCanteenReview(id);
    }

    @Override
    public boolean addCanteenReview(CanteenReview canteenReview) {
        return canteenReviewMapper.addCanteenReview(canteenReview);
    }

}
