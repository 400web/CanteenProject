package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 食堂管理员类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class CanteenAdmin {
    private String userId;
    private String canteenId;
}
