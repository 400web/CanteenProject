package com.cp.service.impl;

import com.cp.domain.SystemAdmin;
import com.cp.mapper.SystemAdminMapper;
import com.cp.service.SystemAdminService;
import com.cp.utils.MybatisUtils;

public class SystemAdminServiceImpl implements SystemAdminService {

    @Override
    public SystemAdmin getSystemAdminById(String adminId) {
        return MybatisUtils.execute(session -> {
            SystemAdminMapper adminMapper = session.getMapper(SystemAdminMapper.class);
            return adminMapper.selectById(adminId);
        });
    }

    @Override
    public boolean addSystemAdmin(SystemAdmin admin) {
        return MybatisUtils.execute(session -> {
            SystemAdminMapper adminMapper = session.getMapper(SystemAdminMapper.class);
            return adminMapper.addSystemAdmin(admin);
        });
    }

    @Override
    public boolean deleteSystemAdmin(String adminId) {
        return MybatisUtils.execute(session -> {
            SystemAdminMapper adminMapper = session.getMapper(SystemAdminMapper.class);
            return adminMapper.deleteSystemAdmin(adminId);
        });
    }
}
