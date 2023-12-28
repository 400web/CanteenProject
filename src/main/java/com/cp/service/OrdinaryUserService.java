package com.cp.service;

import com.cp.domain.OrdinaryUser;

public interface OrdinaryUserService {
    /**
     * 获取普通用户信息
     *
     * @param userId 用户ID
     * @return 普通用户对象，若不存在返回null
     */
    OrdinaryUser getOrdinaryUserById(String userId);

    /**
     * 添加普通用户信息到数据库
     *
     * @param user 普通用户对象
     * @return 添加成功返回true，失败返回false
     */
    boolean addOrdinaryUser(OrdinaryUser user);

    /**
     * 删除普通用户信息
     *
     * @param userId 用户ID
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteOrdinaryUser(String userId);

    boolean updateOrdinaryUser(OrdinaryUser user);

    boolean updateLevel(String userId, int action);
}
