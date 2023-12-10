package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 菜品类，存储菜品信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Dish {
    private String dishId; // 菜品ID
    private String canteenId; // 食堂ID
    private String dishName; // 菜品名称
    private String image; // 图片
    private String introduction; // 简介
    private double price; // 价格
    private String cuisine; // 菜系
    private double evaluationScore; // 评价分值
    private int evaluationWeight; // 评价权重
}
