package com.jinge.ocean.dao;

import com.jinge.ocean.entity.Team;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zheng 2018-9-27 16:29:09
 */

public interface TeamDao {
    /**
     * 参数为单一string，需加@param注解
     * @param teamName
     * @return
     * @author zy 2018-9-27 16:54:36
     */
    List<Team> getAllTeams(@Param("teamName") String teamName);

    void addTeam(Team team);
}
