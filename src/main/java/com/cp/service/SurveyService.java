package com.cp.service;

import com.cp.domain.Survey;

import java.util.List;

public interface SurveyService{
    /**
     * 通过问卷ID获取问卷对象
     *
     * @param surveyId 问卷ID
     * @return 问卷对象，若不存在返回null
     */
    Survey getSurveyById(String surveyId);
    Survey getSurvey(String surveyId);

    /**
     * 获取所有问卷列表
     *
     * @return 问卷列表，若不存在返回空列表
     */
    List<Survey> getAllSurveys();

    /**
     * 向数据库中添加问卷
     *
     * @param survey 问卷对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addSurvey(Survey survey);

    /**
     * 更新问卷信息
     *
     * @param survey 问卷对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateSurvey(Survey survey);

    /**
     * 删除问卷信息
     *
     * @param surveyId 问卷ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteSurvey(String surveyId);
}
