package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ILikeDao;
import com.study.springboot.dto.LikeDto;

@Service
public class LikeService implements ILikeService{
	
	@Autowired
	LikeDto likeDto;	
	@Autowired
	ILikeDao likeDao;
	
	@Override
	public void likeUpdate(String bno, String id, String writerId) {
		likeDao.likeUpdateDao(Integer.parseInt(bno), id, writerId);
	}

	@Override
	public void likeDelete(String bno, String id, String writerId) {
		likeDao.likeDeleteDao(Integer.parseInt(bno), id, writerId);
	}

	@Override
	public int likeCheck(String bno, String id) {
		int nResult = likeDao.likeCheckDao(Integer.parseInt(bno), id);
		return nResult;
	}

	@Override
	public int likeCount(String bno) {
		int count = likeDao.likeCountDao(Integer.parseInt(bno));
		return count;
	}

	@Override
	public ArrayList<LikeDto> likeList(String name) {
		ArrayList<LikeDto> likeList = likeDao.likeList(name);
		return likeList;
	}

}
