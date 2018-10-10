package com.jinge.ocean.controller;

import com.google.common.collect.Maps;
import com.jinge.ocean.dao.DictionaryDao;
import com.jinge.ocean.entity.Page;
import com.jinge.ocean.entity.dictionary.CaseFrom;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author zheng y 2018-9-27 11:09:24
 */
@Controller
@RequestMapping("dic")
public class DicController {

    @Resource
    private DictionaryDao dictionaryDao;

    @RequestMapping("toCaseFromPage")
    public String toCaseFromPage() {
        return "dic/caseFrom";
    }

    @RequestMapping("queryAllCaseFrom")
    @ResponseBody
    public Map queryAllCaseFrom(Page page) {
        Map resultMap = Maps.newHashMap();
        List<CaseFrom> caseFroms = dictionaryDao.getAllCaseFrom("", page.getStartRow(), page.getRows());
        resultMap.put("rows", caseFroms);
        if (caseFroms.isEmpty()) {
            resultMap.put("total", 0);
        } else {
            resultMap.put("total", dictionaryDao.getCaseFromCount(""));
        }
        return resultMap;
    }



}
