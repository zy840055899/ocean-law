package com.jinge.ocean.dao;

import com.jinge.ocean.entity.dictionary.CaseFrom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 数据字典操作dao
 *
 * @author zheng 2018-9-28 10:15:06
 */
public interface DictionaryDao {

    /*----------------------caseFrom 案件来源增删改查------------------*/
    void addCaseFrom(CaseFrom caseFrom);

    void delCaseFromById(@Param("caseFromId") String caseFromId);

    void updateCaseFrom(CaseFrom caseFrom);

    List<CaseFrom> getAllCaseFrom(@Param("caseFromName") String caseFromName);


}
