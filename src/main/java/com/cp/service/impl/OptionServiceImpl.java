package com.cp.service.impl;


import com.cp.domain.Option;
import com.cp.mapper.OptionMapper;
import com.cp.service.OptionService;
import com.cp.utils.MybatisUtils;

import java.util.List;

public class OptionServiceImpl implements OptionService {
    OptionMapper optionMapper= MybatisUtils.getMapper(OptionMapper.class);
    @Override
    public Option getOptionById(String optionId) {
        return optionMapper.selectById(optionId);
    }

    @Override
    public List<Option> getOptionsByQuestionId(String questionId) {
        return optionMapper.selectByQuestionId(questionId);
    }

    @Override
    public boolean addOption(Option option) {
        return optionMapper.addOption(option);
    }

    @Override
    public boolean updateOption(Option option) {
        return optionMapper.updateOption(option);
    }

    @Override
    public boolean deleteOption(String optionId) {
        return deleteOption(optionId);
    }
}
