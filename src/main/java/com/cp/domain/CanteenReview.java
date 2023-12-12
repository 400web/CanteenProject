package com.cp.domain;

import lombok.*;

/**
 * 食堂评价表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class CanteenReview {
    private String evaluatorId; // 评价人id
    private String canteenId; // 食堂id
    private double evaluationScore; // 评价分值
    private double weight; // 权重
}