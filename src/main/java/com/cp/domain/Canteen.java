package com.cp.domain;

import lombok.*;

/**
 * 食堂类，存储食堂信息
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Canteen {
    private String id;// 食堂ID
    private String name;// 食堂名称
    private String image;//图片URL
    private String location;// 食堂位置
    private String introduction;// 食堂简介
    private String openingTime;// 食堂开门时间
    private String closingTime;// 食堂关门时间
    private String activity;//食堂活动公告
    private Double rating;// 食堂等级分
}

