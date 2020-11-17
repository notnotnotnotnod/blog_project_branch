package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IWriteSetDao;
import com.study.springboot.dto.FileDto;

@Service
public class WriteSetService implements IWriteSetService{
	@Autowired
	IWriteSetDao BoardSetDao;
	
	
	@Override
	public int picset(int bno, String filename) {
		int nResult = BoardSetDao.picset(bno, filename);
		return nResult;
	}
	
	@Override
	public ArrayList<FileDto> TagSearchListDao(String tagname){
		ArrayList<FileDto> list = BoardSetDao.TagSearchListDao(tagname);
		return list;
	}
	
	@Override
	public ArrayList<FileDto> fileList() {
		ArrayList<FileDto> list = BoardSetDao.fileListDao();
		return list;
	}

	@Override
	public int hashtag(int bno, String tagname) {
		int nResult = BoardSetDao.hashtag(bno, tagname);
		return nResult;
	}

	@Override
	public ArrayList<FileDto> hashtagList() {
		ArrayList<FileDto> list = BoardSetDao.hashtagListDao();
		return list;
	}

	@Override
	public ArrayList<FileDto> aside_hashtagList() {
		ArrayList<FileDto> list = BoardSetDao.aside_hashtagListDao();
		return list;
	}
}

