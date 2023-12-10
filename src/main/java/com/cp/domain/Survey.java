package com.cp.domain;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 调查问卷类
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
@Component
public class Survey {
    private String surveyId; // 问卷id
    private String surveyContent; // 问卷内容
    private String publisherId; // 发布人id
    private String publishTime; // 发布时间
    private List<Question> questionList;// 题目列表
}