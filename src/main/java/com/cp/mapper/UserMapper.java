package com.cp.mapper;

import com.cp.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    void addUser(User user);
    User login(@Param("phoneNumber") String phoneNumber, @Param("password") String password);

    User selectById(@Param("id") String id);

    User selectByPhoneNumber(@Param("phoneNumber") String phoneNumber);
    User selectByUsername(@Param("username") String username);
}
