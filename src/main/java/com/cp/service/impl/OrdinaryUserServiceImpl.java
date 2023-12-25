package com.cp.service.impl;


import com.cp.domain.OrdinaryUser;
import com.cp.mapper.OrdinaryUserMapper;
import com.cp.service.OrdinaryUserService;
import com.cp.utils.MybatisUtils;

public class OrdinaryUserServiceImpl implements OrdinaryUserService {
    OrdinaryUserMapper ordinaryUserMapper = MybatisUtils.getMapper(OrdinaryUserMapper.class);

    @Override
    public OrdinaryUser getOrdinaryUserById(String userId) {
        return ordinaryUserMapper.selectById(userId);
    }

    @Override
    public boolean addOrdinaryUser(OrdinaryUser user) {
        return ordinaryUserMapper.addOrdinaryUser(user);
    }

    @Override
    public boolean deleteOrdinaryUser(String userId) {
        return ordinaryUserMapper.deleteOrdinaryUser(userId);
    }

    @Override
    public boolean updateOrdinaryUser(OrdinaryUser user) {
        return ordinaryUserMapper.updateOrdinaryUser(user);
    }
}
