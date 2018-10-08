package com.jinge.ocean.service;

import com.jinge.ocean.entity.Case;
import org.springframework.web.multipart.MultipartFile;

public interface CaseService {

    void addCase(Case casee, MultipartFile[] files);

}
