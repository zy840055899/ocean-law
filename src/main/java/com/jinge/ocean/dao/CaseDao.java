package com.jinge.ocean.dao;

import com.jinge.ocean.entity.Case;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CaseDao {
    List<Case> queryAllCases(@Param("caseNo")String caseNo, @Param("shipName")String shipName,
        @Param("startDate")String startDate, @Param("endDate")String endDate);
}
