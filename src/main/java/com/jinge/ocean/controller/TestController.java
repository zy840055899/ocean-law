package com.jinge.ocean.controller;

import com.jinge.ocean.dao.TestDao;
import com.jinge.ocean.entity.Team;
import com.jinge.ocean.service.TeamService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zheng y 2018-9-27 11:09:24
 */
@Controller
public class TestController {

    @Resource
    private TestDao testDao;

    @Resource
    private TeamService teamService;

    @RequestMapping("test")
    public String test(Model model) {
        model.addAttribute("aaa", testDao.test());
        return "test";
    }

    @RequestMapping("json")
    @ResponseBody
    public List<Team> json(Model model, String teamName) {
        return teamService.getAllTeams(teamName);
    }
}
