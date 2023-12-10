package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 食堂类，存储食堂信息
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Canteen {
    private String canteenId;// 食堂ID
    private String canteenName;// 食堂名称
    private String canteenLocation;// 食堂位置
    private String canteenIntroduction;// 食堂简介
    private String openingTime;// 食堂开门时间
    private String closingTime;// 食堂关门时间
    private int canteenRating;// 食堂等级分
}
