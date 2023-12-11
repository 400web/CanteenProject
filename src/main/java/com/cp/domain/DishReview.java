package com.cp.domain;

import lombok.*;

/**
 * 菜品评价表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class DishReview {
    private long id;
    private String evaluatorId; // 评价人id
    private String dishId; // 菜品id
    private double evaluationScore; // 评价分
    private double weight; // 权重

}
