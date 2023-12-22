package com.cp.domain;

import lombok.*;

/**
 * 菜品类，存储菜品信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Dish {
    private String id; // 菜品ID
    private String canteenId; // 食堂ID
    private String name; // 菜品名称
    private String canteenName;//食堂名称
    private String image; // 图片
    private String introduction; // 简介
    private double price; // 价格
    private String cuisine; // 菜系
    private double score; // 评价分值
    private int weight; // 评价权重
}
