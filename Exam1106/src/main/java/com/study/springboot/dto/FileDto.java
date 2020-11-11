package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FileDto {
	private int bno;
	private String filename;
}
