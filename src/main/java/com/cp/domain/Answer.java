package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

/**
 * 回答表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Answer {
    private String userId; // 用户id
    private String optionId; // 选项id
}
