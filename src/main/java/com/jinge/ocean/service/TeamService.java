package com.jinge.ocean.service;

import com.jinge.ocean.entity.Team;

import java.util.List;

public interface TeamService {
    List<Team> getAllTeams(String teamName);
}
