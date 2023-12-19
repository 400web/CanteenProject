package com.cp.service;

import com.cp.domain.CanteenReview;
import com.cp.mapper.CanteenReviewMapper;

import java.util.List;

public interface CanteenReviewService{
    /**
     * ID获取评价
     * @param id 评价ID
     * @return 评价
     */
    CanteenReview getCanteenReviewById(String id);
    /**
     * 获取指定食堂的所有评价
     *
     * @param canteenId 食堂ID
     * @return 食堂的评价列表，若不存在返回空列表
     */
    List<CanteenReview> getReviewsByCanteenId(String canteenId);

    /**
     * 获取指定用户对食堂的评价
     *
     * @param userId    用户ID
     * @param canteenId 食堂ID
     * @return 用户食堂的评价列表，若不存在返回空列表
     */
    List<CanteenReview> getReviewByUserIdAndCanteenId(String userId, String canteenId);

    /**
     * 删除指定用户对食堂的评价
     *
     * @param id  ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCanteenReview(String id);
    boolean addCanteenReview(CanteenReview canteenReview);
}
