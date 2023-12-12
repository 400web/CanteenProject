package com.cp.service;

import com.cp.domain.SystemAdmin;

public interface SystemAdminService{
    /**
     * 获取系统管理员信息
     *
     * @param adminId 管理员ID
     * @return 系统管理员对象，若不存在返回null
     */
    SystemAdmin getSystemAdminById(String adminId);

    /**
     * 添加系统管理员信息到数据库
     *
     * @param admin 系统管理员对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addSystemAdmin(SystemAdmin admin);

    /**
     * 删除系统管理员信息
     *
     * @param adminId 管理员ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteSystemAdmin(String adminId);
}
