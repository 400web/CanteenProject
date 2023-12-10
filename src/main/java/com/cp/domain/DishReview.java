package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 菜品评价表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class DishReview {
    private String evaluatorId; // 评价人id
    private String dishId; // 菜品id
    private double evaluationScore; // 评价分
    private double weight; // 权重

}
