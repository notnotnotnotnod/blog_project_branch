package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.FileDto;

@Mapper
public interface IWriteSetDao {
	public int picset(@Param("bno") int bno,@Param("filename") String filename);
	public ArrayList<FileDto> fileListDao();
	public int hashtag(@Param("bno") int bno,@Param("tagname") String tagname);
	public ArrayList<FileDto> hashtagListDao();
	public ArrayList<FileDto> aside_hashtagListDao();
	public ArrayList<FileDto> TagSearchListDao(@Param("tagname") String tagname);
}