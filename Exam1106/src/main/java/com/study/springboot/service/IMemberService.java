package com.study.springboot.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.study.springboot.dto.FileDto;
import com.study.springboot.dto.MemberDto;

public interface IMemberService {
	//public Date stringToDate(MemberDto member);  사용안함
	public int insertMember(HttpServletRequest req);
	public MemberDto getUserInfo(String id);
	public int updateMember(HttpServletRequest req);
	public int deleteMember(String id, String pw);
	public int loginCheck(String id, String pw);
	public String FindId(String name, String mail);
	public String FindPw(String id, String name, String mail);
	public ArrayList<MemberDto> userList();
	public int idCheck(String id);
	public int mailCheck(String mail);
	public int logoutDao();
	public int picset(int bno,String filename);
	public int getBno(String id);
	public ArrayList<FileDto> fileList();
	public int getBno2(String id);
	public int hashtag(int bno, String tagname);
	
}
