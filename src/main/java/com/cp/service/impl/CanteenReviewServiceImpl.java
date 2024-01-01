package com.cp.service.impl;

import com.cp.domain.CanteenReview;
import com.cp.mapper.CanteenReviewMapper;
import com.cp.service.CanteenReviewService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class CanteenReviewServiceImpl implements CanteenReviewService {

    @Override
    public CanteenReview getCanteenReviewById(String id) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.selectById(id);
        });
    }

    @Override
    public List<CanteenReview> getReviewsByCanteenId(String canteenId) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.selectByCanteenId(canteenId);
        });
    }

    @Override
    public List<CanteenReview> getReviewByUserIdAndCanteenId(String userId, String canteenId) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.selectListById(userId, canteenId);
        });
    }

    @Override
    public List<CanteenReview> getReviewByName(String name) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.selectListByName(name);
        });
    }

    @Override
    public List<CanteenReview> getList() {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.selectList();
        });
    }

    @Override
    public boolean deleteCanteenReview(String id) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.deleteCanteenReview(id);
        });
    }

    @Override
    public boolean addCanteenReview(CanteenReview canteenReview) {
        return MybatisUtils.execute(session -> {
            CanteenReviewMapper canteenReviewMapper = session.getMapper(CanteenReviewMapper.class);
            return canteenReviewMapper.addCanteenReview(canteenReview);
        });
    }
}

