package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.FileDto;

public interface IWriteSetService {
	public int picset(int bno,String filename);
	public ArrayList<FileDto> fileList();
	public int hashtag(int bno, String tagname);
	public ArrayList<FileDto> hashtagList(); 
	public ArrayList<FileDto> aside_hashtagList();
	public ArrayList<FileDto> TagSearchListDao(String tagname);
}

