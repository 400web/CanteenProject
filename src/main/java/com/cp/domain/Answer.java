package com.cp.domain;

import lombok.*;

/**
 * 回答表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Answer {
    private String userId; // 用户id
    private String optionId; // 选项id
}
