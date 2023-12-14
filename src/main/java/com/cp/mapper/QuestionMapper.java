package com.cp.mapper;

import com.cp.domain.Question;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionMapper{
    Question selectById(@Param("id") String id);
    List<Question> selectList();
    List<Question> selectBySurveyId(@Param("SurveyId") String SurveyId);
    boolean addQuestion(Question question);
    boolean updateQuestion(Question question);
    boolean deleteQuestion(@Param("id") String id);
}
