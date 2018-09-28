package com.jinge.ocean.dao;

import com.jinge.ocean.entity.Team;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zheng 2018-9-27 16:29:09
 */
public interface TeamDao {
    /**
     * 增加执法队伍
     *
     * @param team
     */
    void addTeam(Team team);

    /**
     * 将队伍isdel置为1
     *
     * @param teamId
     */
    void delTeamById(@Param("teamId") String teamId);

    void updateTeam(Team team);

    /**
     * 参数为单一string，需加@param注解
     *
     * @param teamName
     * @return
     */
    List<Team> getAllTeams(@Param("teamName") String teamName);

    Team getTeamById(@Param("teamId") String teamId);


}
