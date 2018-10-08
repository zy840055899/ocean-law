package com.jinge.ocean.service;

import com.jinge.ocean.entity.ResultMap;
import com.jinge.ocean.entity.Team;

import java.util.List;
import java.util.Map;

public interface UserService {
    ResultMap checkLogin(String username, String pwd);
}
