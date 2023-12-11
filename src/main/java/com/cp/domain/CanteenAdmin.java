package com.cp.domain;

import lombok.*;

/**
 * 食堂管理员类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class CanteenAdmin {
    private String userId;
    private String canteenId;
}
