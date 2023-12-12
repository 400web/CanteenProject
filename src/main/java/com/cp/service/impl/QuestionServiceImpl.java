package com.cp.service.impl;

import com.cp.domain.Question;
import com.cp.service.QuestionService;

import java.util.List;

public class QuestionServiceImpl implements QuestionService {
    @Override
    public Question getQuestionById(String questionId) {
        return null;
    }

    @Override
    public List<Question> getQuestionsBySurveyId(String surveyId) {
        return null;
    }

    @Override
    public boolean addQuestion(Question question) {
        return false;
    }

    @Override
    public boolean updateQuestion(Question question) {
        return false;
    }

    @Override
    public boolean deleteQuestion(String questionId) {
        return false;
    }
}
