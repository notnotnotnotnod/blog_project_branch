package com.study.springboot.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component  //개발자가 작성한 클래스를 빈으로 만들때, @Bean은 수정불가한 클래스를 빈으로 만들때
@Data
public class MemberDto 
{
	private String id;			// 아이디
	private String password; 	// 비밀번호
	private String name;		// 이름
	private String gender;		// 성별
	private String mail;		// 이메일
	private String phone;		// 전화
	private String bio;		    // 자기소개
	
	//기본생성자함수
//	public SimpleBbsDto() {
//		
//	}
	//Getter/Setter함수
	
}
