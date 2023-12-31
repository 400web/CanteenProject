package com.cp.domain;

import lombok.*;

/**
 * 选项表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class Option {
    private String id; // 选项id
    private String questionId; // 题目id
    private String optionContent; // 选项内容
    private int selectionCount; // 选择人数
}
