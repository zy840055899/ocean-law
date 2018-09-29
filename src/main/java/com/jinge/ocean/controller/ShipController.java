package com.jinge.ocean.controller;

import com.jinge.ocean.entity.Ship;
import com.jinge.ocean.utils.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zheng y 2018-9-27 11:09:24
 */
@Controller
@RequestMapping("ship")
public class ShipController {
    static Logger logger = LoggerFactory.getLogger(ShipController.class);

    @RequestMapping("toAddShip")
    public String toAddShip(Model model) {
        return "ship/addShip";
    }

    @RequestMapping("addShip")
    @ResponseBody
    public String addShip(Model model, Ship ship, MultipartFile file, HttpServletRequest request) throws Exception {
        String result = new FileUtil().uploadMultipartFile(file);
        return result;
    }
}
