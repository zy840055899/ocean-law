package com.jinge.ocean.controller;

import com.jinge.ocean.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author zheng y 2018-9-27 11:09:24
 */
@Controller
public class TestController {

    @Resource
    private TestDao testDao;

    @RequestMapping("test")
    public String test(Model model) {
        model.addAttribute("aaa", testDao.test());
        return "test";
    }

    @RequestMapping("json")
    @ResponseBody
    public String json(Model model,String aaa) {
        return "zy:"+aaa;
    }
}
