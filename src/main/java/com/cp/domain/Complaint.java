package com.cp.domain;

import lombok.*;

/**
 * 投诉类，存储投诉相关信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Complaint {
    private String id;//投诉ID
    private String complainantId; // 投诉人ID
    private String name;//投诉人姓名
    private String canteenName; // 食堂名称
    private String complainTime; // 投诉时间
    private String complaintInfo; // 投诉信息
    private String feedback; // 投诉反馈
    private String responseInfo; // 回复信息
}
