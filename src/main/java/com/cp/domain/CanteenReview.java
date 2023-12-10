package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 食堂评价表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class CanteenReview {
    private String evaluatorId; // 评价人id
    private String canteenId; // 食堂id
    private double evaluationScore; // 评价分值
    private double weight; // 权重
}
