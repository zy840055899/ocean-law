package com.jinge.ocean.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Component
public class FileUtil {
    static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private String filePath = "/Users/";

    public String uploadMultipartFile(MultipartFile file) {
        if (file != null) {
            String path;// 文件路径
            String type;// 文件类型
            String fileName = file.getOriginalFilename();// 文件原名称
            // 判断文件类型
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
            if (!StringUtils.isEmpty(type)) {
                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
                    // 项目在容器中实际发布运行的根路径
//                    String filePath = request.getSession().getServletContext().getRealPath("/");
                    // 自定义文件名称
                    String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
                    // 设置存放图片文件的路径
                    path = filePath +/*System.getProperty("file.separator")+*/trueFileName;
                    // 转存文件到指定的路径
                    try {
                        file.transferTo(new File(path));
                    } catch (Exception e) {
                        logger.warn("文件上传异常");
                        path = "文件上传异常";
                    } finally {
                        return path;
                    }
                } else {
                    return "文件类型错误";
                }
            } else {
                return "不明文件";//无文件类型
            }
        } else {
            return "没有文件";
        }
    }


}
