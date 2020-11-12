package com.study.springboot.dao;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.FileDto;
import com.study.springboot.dto.MemberDto;

//MyBatis와 객체를 연결하는 어노테이션.
@Mapper
public interface IMemberDao 
{
//	public Date stringToDateDao(MemberDto member);
	public int insertMemberDao(MemberDto member);
	public MemberDto getUserInfoDao(@Param("id") String id);
	public int updateMemberDao(MemberDto member);
	public int deleteMemberDao(@Param("id") String id,@Param("pw") String pw);
	public int loginCheckDao(@Param("id") String id, @Param("pw") String pw);
	public String FindIdDao(@Param("name") String name, @Param("mail") String mail);
	public String FindPwDao(@Param("id") String id, @Param("name") String name, @Param("mail") String mail);
	public ArrayList<MemberDto> userListDao();
	public int idCheckDao(@Param("id") String id);
	public int mailCheckDao(@Param("mail") String mail);
	public int picset(@Param("bno") int bno,@Param("filename") String filename);
	public ArrayList<FileDto> fileListDao();
	public int hashtag(@Param("bno") int bno,@Param("tagname") String tagname);
	
}

