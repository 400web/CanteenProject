package com.cp.mapper;

import com.cp.domain.SystemAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SystemAdminMapper {
    SystemAdmin selectById(@Param("id") String id);
    List<SystemAdmin> selectList();
    boolean addSystemAdmin(SystemAdmin admin);
    boolean deleteSystemAdmin(@Param("id") String id);
}
