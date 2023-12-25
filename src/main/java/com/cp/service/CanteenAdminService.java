package com.cp.service;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import com.cp.domain.User;

import java.util.List;

public interface CanteenAdminService{
    /**
     * 获取指定食堂管理员的食堂信息
     *
     * @param adminId 食堂管理员ID
     * @return 食堂信息对象，若不存在返回null
     */
    Canteen getCanteenByAdminId(String adminId);
    List<User> getCanteenAdminByCanteenId(String canteenId);
    List<CanteenAdmin> getList();

    /**
     * 添加食堂管理员与食堂的关联信息到数据库
     *
     * @param canteenAdmin   食堂管理员
     * @return 添加成功返回true，失败返回false
     */
    boolean addCanteenAdmin(CanteenAdmin canteenAdmin);

    /**
     * 删除指定食堂管理员与食堂的关联信息
     *
     * @param id  ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCanteenAdmin(String id);
    boolean updateCanteenAdmin(CanteenAdmin canteenAdmin);
}
