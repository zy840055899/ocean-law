package com.jinge.ocean.service;

import com.jinge.ocean.entity.Case;
import com.jinge.ocean.utils.FileUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CaseServiceImpl implements CaseService {



    @Override
    public void addCase(Case casee, MultipartFile[] files) {
        if (files != null && files.length > 0) {
            //循环获取file数组中得文件
            for (int i = 0; i < files.length; i++) {
                //保存文件
                String path = FileUtil.uploadMultipartFile(files[i]);
            }
        }
    }
}
