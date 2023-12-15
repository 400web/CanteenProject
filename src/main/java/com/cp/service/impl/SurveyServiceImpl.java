package com.cp.service.impl;

import com.cp.domain.Option;
import com.cp.domain.Question;
import com.cp.domain.Survey;
import com.cp.mapper.OptionMapper;
import com.cp.mapper.QuestionMapper;
import com.cp.mapper.SurveyMapper;
import com.cp.service.SurveyService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class SurveyServiceImpl implements SurveyService {
    SurveyMapper surveyMapper = MybatisUtils.getMapper(SurveyMapper.class);
    QuestionMapper questionMapper = MybatisUtils.getMapper(QuestionMapper.class);
    OptionMapper optionMapper = MybatisUtils.getMapper(OptionMapper.class);

    @Override
    public Survey getSurveyById(String surveyId) {
        Survey survey = surveyMapper.selectById(surveyId);
        List<Question> questionList = questionMapper.selectBySurveyId(surveyId);
        for (Question question : questionList) {
            List<Option> optionList = optionMapper.selectByQuestionId(question.getId());
            question.setOptionList(optionList);
        }
        survey.setQuestionList(questionList);
        return survey;
    }

    @Override
    public List<Survey> getAllSurveys() {
        return surveyMapper.selectList();
    }

    @Override
    public boolean addSurvey(Survey survey) {
        return surveyMapper.addSurvey(survey);
    }

    @Override
    public boolean updateSurvey(Survey survey) {
        return surveyMapper.updateSurvey(survey);
    }

    @Override
    public boolean deleteSurvey(String surveyId) {
        return surveyMapper.deleteSurvey(surveyId);
    }
}
