package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 用户类，用于存储用户信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class User {
    private long id;
    private String username;
    private String password;
    private String phoneNumber;
    private String role;//身份
}
