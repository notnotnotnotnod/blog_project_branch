package com.study.springboot.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.LikeDto;
import com.study.springboot.dto.ReplyDto;

@Mapper
public interface ILikeDao {
    
    public int likeCheckDao(int bno, String id);
    public int likeUpdateDao(int bno, String id, String writerId);
    public int likeDeleteDao(int bno, String id, String writerId);
    public int likeCountDao(int bno);
	public ArrayList<LikeDto> likeList(String name);
    
}
