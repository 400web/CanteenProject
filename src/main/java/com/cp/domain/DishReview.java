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
    private String id;
    private String evaluatorId; // 评价人id
    private String name;//评价人姓名
    private String dishId; // 菜品id
    private String time;
    private double evaluationScore; // 评价分
    private double weight; // 权重

}
