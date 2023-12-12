package com.cp.service;

import com.cp.domain.Option;

import java.util.List;

public interface OptionService{
    /**
     * 通过选项ID获取选项对象
     *
     * @param optionId 选项ID
     * @return 选项对象，若不存在返回null
     */
    Option getOptionById(String optionId);

    /**
     * 获取某个问题的所有选项列表
     *
     * @param questionId 问题ID
     * @return 选项列表，若不存在返回空列表
     */
    List<Option> getOptionsByQuestionId(String questionId);

    /**
     * 向数据库中添加选项
     *
     * @param option 选项对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addOption(Option option);

    /**
     * 更新选项信息
     *
     * @param option 选项对象
     * @return 更新成功返回true，失败返回false
     */
    boolean updateOption(Option option);

    /**
     * 删除选项信息
     *
     * @param optionId 选项ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteOption(String optionId);
}
