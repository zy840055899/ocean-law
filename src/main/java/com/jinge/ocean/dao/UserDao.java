package com.jinge.ocean.dao;

import com.jinge.ocean.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zheng 2018-9-27 16:29:09
 */
public interface UserDao {
    void addUser(User user);

    void delUserById(@Param("userId") String userId);

    void updateUser(User user);

    List<User> getAllUsers(@Param("username") String username);

    int checkLogin(@Param("username") String username, @Param("pwd") String pwd);

}
