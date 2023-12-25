package com.cp.mapper;

import com.cp.domain.Dish;
import com.cp.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    boolean addUser(User user);

    User login(@Param("phoneNumber") String phoneNumber, @Param("password") String password);

    User selectById(@Param("id") String id);
    List<User> selectByIds(List<String> ids);

    User selectByPhoneNumber(@Param("phoneNumber") String phoneNumber);
    List<User> selectDishesDynamic(Map<String, Object> map);

    User selectByUsername(@Param("username") String username);

    List<User> selectList();

    List<User> selectListByPage(Map<String,Object> data);

    boolean deleteUser(@Param("id") String id);

    boolean updateUser(User user);
}
