package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardDto {
	private int bid;
    private String bname;
    private String bcontent;
    private Date bdate;
    private int bhit;
    
}
