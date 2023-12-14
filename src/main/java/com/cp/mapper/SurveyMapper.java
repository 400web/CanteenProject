package com.cp.mapper;


import com.cp.domain.Survey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SurveyMapper{
    Survey selectById(@Param("id") String id);
    List<Survey> selectByPublisherId(@Param("publisherId") String publisherId);
    List<Survey> selectList();
    boolean addSurvey(Survey survey);
    boolean updateSurvey(Survey survey);
    boolean deleteSurvey(@Param("id") String id);
}
