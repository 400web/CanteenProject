package com.cp.service;


import com.cp.domain.Answer;

import java.util.List;

public interface AnswerService{
    /**
     * 通过用户ID和选项ID获取回答信息
     *
     * @param userId    用户ID
     * @param optionId  选项ID
     * @return 回答信息，若不存在返回null
     */
    Answer getAnswerByUserIdAndOptionId(String userId, String optionId);

    /**
     * 获取所有回答列表
     *
     * @return 回答列表，若不存在返回空列表
     */
    List<Answer> getAllAnswers();

    /**
     * 向数据库中添加回答信息
     *
     * @param answer 回答信息对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addAnswer(Answer answer);

    /**
     * 更新回答信息
     *
     * @param answer 回答信息对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateAnswer(Answer answer);

    /**
     * 删除回答信息
     *
     * @param userId   用户ID
     * @param optionId 选项ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteAnswer(String userId, String optionId);
}
