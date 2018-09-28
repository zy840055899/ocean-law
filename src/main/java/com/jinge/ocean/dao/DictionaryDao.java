package com.jinge.ocean.dao;

import com.jinge.ocean.entity.dictionary.CaseFrom;
import com.jinge.ocean.entity.dictionary.CaseType;
import com.jinge.ocean.entity.dictionary.ShipType;
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

    /*----------------------caseType 案件类型增删改查------------------*/
    void addCaseType(CaseType caseType);

    void delCaseTypeById(@Param("caseTypeId") String caseTypeId);

    void updateCaseType(CaseType caseType);

    List<CaseType> getAllCaseType(@Param("caseTypeName") String caseTypeName);

    /*----------------------shipType 主体类型（船舶）增删改查------------------*/
    void addShipType(ShipType shipType);

    void delShipTypeById(@Param("shipTypeId") String shipTypeId);

    void updateShipType(ShipType shipType);

    List<ShipType> getAllShipType(@Param("shipTypeName") String shipTypeName);


}
