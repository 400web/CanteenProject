package com.cp.mapper;

import com.cp.domain.OrdinaryUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdinaryUserMapper{
    OrdinaryUser selectById(@Param("id") String id);
    List<OrdinaryUser> selectList();
    boolean addOrdinaryUser(OrdinaryUser user);
    boolean updateOrdinaryUser(OrdinaryUser user);
    boolean deleteOrdinaryUser(@Param("id") String id);
}
