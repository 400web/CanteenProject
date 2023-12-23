package com.cp.mapper;

import com.cp.domain.Canteen;
import com.cp.domain.CanteenAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CanteenAdminMapper{
    CanteenAdmin selectCanteenByAdminId(@Param("id") String id);
    List<CanteenAdmin> selectListByCanteenId(@Param("canteenId") String canteenId);
    List<String> selectUserIdsByCanteenId(@Param("canteenId") String canteenId);
    List<Canteen> selectList();
    boolean addCanteenAdmin(CanteenAdmin admin);
    boolean updateCanteenAdmin(CanteenAdmin admin);
    boolean deleteCanteenAdmin(@Param("id") String id);
}
