package com.cp.mapper;


import com.cp.domain.Answer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerMapper {
    Answer selectById(@Param("userId") String userId, @Param("optionId") String optionId);

    List<Answer> selectList();
    boolean addAnswer(Answer answer);
}
