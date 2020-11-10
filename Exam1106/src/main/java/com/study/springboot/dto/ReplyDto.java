package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyDto {
	private int bno;
	private int rno;
    private String rname;
    private String rcontent;
    private Date rdate;
}
