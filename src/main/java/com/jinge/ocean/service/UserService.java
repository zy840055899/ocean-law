package com.jinge.ocean.service;

import com.jinge.ocean.entity.ResultMap;

public interface UserService {
    ResultMap checkLogin(String username, String pwd);
}
