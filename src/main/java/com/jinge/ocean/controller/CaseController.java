package com.jinge.ocean.controller;

import com.jinge.ocean.entity.Case;
import com.jinge.ocean.entity.Ship;
import com.jinge.ocean.service.CaseService;
import com.jinge.ocean.utils.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author zheng y 2018-10-8 15:36:01
 */
@Controller
@RequestMapping("case")
public class CaseController {
    static Logger logger = LoggerFactory.getLogger(CaseController.class);

    @Resource
    private CaseService caseService;

    @RequestMapping("toAddCase")
    public String toAddCase(Model model) {
        return "case/toAddCase";
    }

    @RequestMapping("addCase")
    @ResponseBody
    public String addCase(Model model, Case cases, @RequestParam("files") MultipartFile[] files) throws Exception {

        caseService.addCase(cases, files);

        return null;
    }
}
