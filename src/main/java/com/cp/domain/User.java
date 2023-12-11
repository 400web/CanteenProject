package com.cp.domain;

import lombok.*;

/**
 * 用户类，用于存储用户信息。
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class User {
    private String id;
    private String username;
    private String password;
    private String phoneNumber;
    private String role;//身份

}
