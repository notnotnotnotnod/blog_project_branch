package com.study.springboot.service;

import java.util.ArrayList;
import java.util.Map;

import com.study.springboot.dto.LikeDto;

public interface ILikeService {
	
    public void likeUpdate(String bno, String id, String writerId);
    public void likeDelete(String bno, String id, String writerId);
    
    public int likeCheck(String bno, String id);
    public int likeCount(String bno);
	public ArrayList<LikeDto> likeList(String name);
}
