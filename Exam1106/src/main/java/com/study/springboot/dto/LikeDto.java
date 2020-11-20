package com.study.springboot.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class LikeDto {
	private int bno;
	private String id;
	private String writerId;
}
