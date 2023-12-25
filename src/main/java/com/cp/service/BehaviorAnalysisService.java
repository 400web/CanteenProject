package com.cp.service;

public interface BehaviorAnalysisService {
    /**
     * 记录用户点赞行为。
     *
     * @param userId  用户ID
     * @param commentId  评论ID
     */
    boolean recordLike(String userId, String commentId);

    /**
     * 检测特定用户的异常菜品评分行为。
     *
     * @param userId 用户ID
     * @param dishId 菜品ID
     * @return 是否存在异常评分行为
     */
    boolean detectAbnormalDishRatings(String userId,String dishId);

    /**
     * 检测特定用户的异常食堂评分行为。
     *
     * @param userId 用户ID
     * @param canteenId 食堂ID
     * @return 是否存在异常评分行为
     */
    boolean detectAbnormalCanteenRatings(String userId,String canteenId);

    /**
     * 检测用户是否已对评论进行点赞。
     *
     * @param userId 用户ID
     * @param commentId 点赞的评论ID
     * @return 是否已对评论进行点赞
     */
    Long detectRepetitiveRatings(String userId, String commentId);
    boolean deleteLike(String userId,String commentId);
}
