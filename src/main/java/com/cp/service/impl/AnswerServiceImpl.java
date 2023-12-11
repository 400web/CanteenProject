package com.cp.service.impl;

import com.cp.domain.Answer;
import com.cp.mapper.AnswerMapper;
import com.cp.service.AnswerService;

import java.util.List;

public class AnswerServiceImpl implements AnswerService {
    @Override
    public Answer getAnswerByUserIdAndOptionId(String userId, String optionId) {
        return null;
    }

    @Override
    public List<Answer> getAllAnswers() {
        return null;
    }

    @Override
    public boolean addAnswer(Answer answer) {
        return false;
    }

    @Override
    public boolean updateAnswer(Answer answer) {
        return false;
    }

    @Override
    public boolean deleteAnswer(String userId, String optionId) {
        return false;
    }
}
