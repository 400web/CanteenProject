package com.cp.mapper;

import com.cp.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User login(@Param("phoneNumber") String phoneNumber, @Param("password") String password);

    User getOne(@Param("id") String id);
}
