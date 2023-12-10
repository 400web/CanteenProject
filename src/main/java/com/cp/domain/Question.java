package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 题目表类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Question {
    private String questionId; // 题目id
    private String surveyId; // 问卷id
    private String questionContent; // 题目内容
    private List<Option> optionList;// 选项列表
}
