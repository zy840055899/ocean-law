package com.jinge.ocean.controller;

import com.jinge.ocean.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author zheng y 2018-10-8 13:43:23
 */
@Controller
@RequestMapping("index")
public class IndexController {
    static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @Resource
    private UserService userService;


    @RequestMapping("toMain")
    public String toMain() {
        return "login/main";
    }

}
