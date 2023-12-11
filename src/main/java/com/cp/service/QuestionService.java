package com.cp.service;


import com.cp.domain.Question;

import java.util.List;

public interface QuestionService{
    /**
     * 通过问题ID获取问题对象
     *
     * @param questionId 问题ID
     * @return 问题对象，若不存在返回null
     */
    Question getQuestionById(String questionId);

    /**
     * 获取某个问卷的所有问题列表
     *
     * @param surveyId 问卷ID
     * @return 问题列表，若不存在返回空列表
     */
    List<Question> getQuestionsBySurveyId(String surveyId);

    /**
     * 向数据库中添加问题
     *
     * @param question 问题对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addQuestion(Question question);

    /**
     * 更新问题信息
     *
     * @param question 问题对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateQuestion(Question question);

    /**
     * 删除问题信息
     *
     * @param questionId 问题ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteQuestion(String questionId);
}
