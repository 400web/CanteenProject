package com.cp.service.impl;


import com.cp.domain.OrdinaryUser;
import com.cp.mapper.OrdinaryUserMapper;
import com.cp.service.OrdinaryUserService;
import com.cp.utils.MybatisUtils;

public class OrdinaryUserServiceImpl implements OrdinaryUserService {

    @Override
    public OrdinaryUser getOrdinaryUserById(String userId) {
        return MybatisUtils.execute(session -> {
            OrdinaryUserMapper ordinaryUserMapper = session.getMapper(OrdinaryUserMapper.class);
            return ordinaryUserMapper.selectById(userId);
        });
    }

    @Override
    public boolean addOrdinaryUser(OrdinaryUser user) {
        return MybatisUtils.execute(session -> {
            OrdinaryUserMapper ordinaryUserMapper = session.getMapper(OrdinaryUserMapper.class);
            return ordinaryUserMapper.addOrdinaryUser(user);
        });
    }

    @Override
    public boolean deleteOrdinaryUser(String userId) {
        return MybatisUtils.execute(session -> {
            OrdinaryUserMapper ordinaryUserMapper = session.getMapper(OrdinaryUserMapper.class);
            return ordinaryUserMapper.deleteOrdinaryUser(userId);
        });
    }

    @Override
    public boolean updateOrdinaryUser(OrdinaryUser user) {
        return MybatisUtils.execute(session -> {
            OrdinaryUserMapper ordinaryUserMapper = session.getMapper(OrdinaryUserMapper.class);
            return ordinaryUserMapper.updateOrdinaryUser(user);
        });
    }

    @Override
    public boolean updateLevel(String userId, int action) {
        return MybatisUtils.execute(session -> {
            OrdinaryUserMapper ordinaryUserMapper = session.getMapper(OrdinaryUserMapper.class);

            OrdinaryUser user = ordinaryUserMapper.selectById(userId);

            if (user == null) {
                return false;
            }

            int logins = user.getLoginTimes();
            int comments = user.getEvaluationTimes();
            int interactions = user.getCommunityInteractionTimes();
            int level = user.getLevel();

            switch (action) {
                case 1:
                    logins++;
                    user.setLoginTimes(logins);
                    break;
                case 2:
                    comments++;
                    user.setEvaluationTimes(comments);
                    break;
                case 3:
                    interactions++;
                    user.setCommunityInteractionTimes(interactions);
                    break;
                default:
                    return false; // Invalid action
            }

            double totalActivity = logins * 1.0 + comments * 1.5 + interactions * 2.0;

            // Check if the user's level needs to be updated
            if (totalActivity > level * 10) {
                user.setLevel(level + 1);
            }

            return ordinaryUserMapper.updateOrdinaryUser(user);
        });
    }
}
