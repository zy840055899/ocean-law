package com.jinge.ocean.controller;

import com.jinge.ocean.entity.ResultMap;
import com.jinge.ocean.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author zheng y 2018-10-8 13:43:23
 */
@Controller
@RequestMapping("login")
public class LoginController {
    static Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private UserService userService;

    @RequestMapping("checkLogin")
    @ResponseBody
    public ResultMap checkLogin(Model model, String username, String password) {

        return userService.checkLogin(username, password);
    }

    @RequestMapping("toLogin")
    public String toLogin() {
        return "login/login";
    }

}
