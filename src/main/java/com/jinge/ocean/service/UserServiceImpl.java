package com.jinge.ocean.service;

import com.jinge.ocean.dao.UserDao;
import com.jinge.ocean.entity.ResultMap;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public ResultMap checkLogin(String username, String pwd) {
        int sum = userDao.checkLogin(username, pwd);
        ResultMap resultMap = new ResultMap();
        if (sum == 0) {
            resultMap.setResultCode("9999");
            resultMap.setResultDesc("用户名或密码错误");
        }
        return resultMap;
    }
}
