package com.cp.service.impl;

import com.cp.domain.Question;
import com.cp.mapper.QuestionMapper;
import com.cp.service.QuestionService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    QuestionMapper questionMapper = MybatisUtils.getMapper(QuestionMapper.class);
    @Override
    public Question getQuestionById(String questionId) {
        return questionMapper.selectById(questionId);
    }

    @Override
    public List<Question> getQuestionsBySurveyId(String surveyId) {
        return questionMapper.selectBySurveyId(surveyId);
    }

    @Override
    public boolean addQuestion(Question question) {
        return questionMapper.addQuestion(question);
    }

    @Override
    public boolean updateQuestion(Question question) {
        return questionMapper.updateQuestion(question);
    }

    @Override
    public boolean deleteQuestion(String questionId) {
        return questionMapper.deleteQuestion(questionId);
    }
}
