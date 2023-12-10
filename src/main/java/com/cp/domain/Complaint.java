package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 投诉类，存储投诉相关信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Complaint {
    private String complainantId; // 投诉人ID
    private String canteenId; // 食堂ID
    private String complainTime; // 投诉时间
    private String complaintInfo; // 投诉信息
    private String feedback; // 投诉反馈
    private String responseInfo; // 回复信息

}
