package com.cp.mapper;

import com.cp.domain.Option;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OptionMapper{
    Option selectById(@Param("id") String id);
    List<Option> selectList();
    List<Option> selectByQuestionId(@Param("questionId") String questionId);
    boolean addOption(Option option);
    boolean updateOption(Option Option);
    boolean deleteOption(@Param("id") String id);
}
