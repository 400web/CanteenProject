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

    @Override
    public boolean updateLevel(String useId, int action) {
        OrdinaryUser user= getOrdinaryUserById(useId);
        int logins = user.getLoginTimes();
        int comments = user.getEvaluationTimes();
        int interactions = user.getCommunityInteractionTimes();
        int level = user.getLevel();
        if (action == 1) {
            logins++;
            user.setLoginTimes(logins);
        }
        if (action == 2) {
            comments++;
            user.setEvaluationTimes(comments);
        }
        if (action == 3) {
            interactions++;
            user.setCommunityInteractionTimes(interactions);
        }
        double totalActivity = logins * 1.0 + comments * 1.5 + interactions * 2.0;
        double relativeActivity = totalActivity / level;
        if (relativeActivity > level * 10) {
            user.setLevel(level + 1);
        }
        return updateOrdinaryUser(user);
    }
}
