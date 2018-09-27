package com.jinge.ocean.service;

import com.jinge.ocean.dao.TeamDao;
import com.jinge.ocean.entity.Team;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TeamServiceImpl implements TeamService {

    @Resource
    private TeamDao teamDao;

    public List<Team> getAllTeams(String teamName) {
        return teamDao.getAllTeams(teamName);
    }
}
