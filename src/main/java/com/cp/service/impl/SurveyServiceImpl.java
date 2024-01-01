package com.cp.service.impl;

import com.cp.domain.Option;
import com.cp.domain.Question;
import com.cp.domain.Survey;
import com.cp.mapper.OptionMapper;
import com.cp.mapper.QuestionMapper;
import com.cp.mapper.SurveyMapper;
import com.cp.service.OptionService;
import com.cp.service.QuestionService;
import com.cp.service.SurveyService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class SurveyServiceImpl implements SurveyService {

    @Override
    public Survey getSurveyById(String surveyId) {
        QuestionService questionService = new QuestionServiceImpl();
        OptionService optionService = new OptionServiceImpl();
        Survey survey = getSurvey(surveyId);
        List<Question> questionList = questionService.getQuestionsBySurveyId(surveyId);
        for (Question question : questionList) {
            List<Option> optionList = optionService.getOptionsByQuestionId(question.getId());
            question.setOptionList(optionList);
        }
        survey.setQuestionList(questionList);
        return survey;
    }

    @Override
    public Survey getSurvey(String surveyId) {
        return MybatisUtils.execute(session -> {
            SurveyMapper surveyMapper = session.getMapper(SurveyMapper.class);
            return surveyMapper.selectById(surveyId);
        });
    }


    @Override
    public List<Survey> getAllSurveys() {
        return MybatisUtils.execute(session -> {
            SurveyMapper surveyMapper = session.getMapper(SurveyMapper.class);
            return surveyMapper.selectList();
        });
    }

    @Override
    public boolean addSurvey(Survey survey) {
        return MybatisUtils.execute(session -> {
            SurveyMapper surveyMapper = session.getMapper(SurveyMapper.class);
            return surveyMapper.addSurvey(survey);
        });
    }

    @Override
    public boolean updateSurvey(Survey survey) {
        return MybatisUtils.execute(session -> {
            SurveyMapper surveyMapper = session.getMapper(SurveyMapper.class);
            return surveyMapper.updateSurvey(survey);
        });
    }

    @Override
    public boolean deleteSurvey(String surveyId) {
        return MybatisUtils.execute(session -> {
            SurveyMapper surveyMapper = session.getMapper(SurveyMapper.class);
            return surveyMapper.deleteSurvey(surveyId);
        });
    }
}
