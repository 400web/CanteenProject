package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 系统管理员类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class SystemAdmin {
    private String userId;
}
