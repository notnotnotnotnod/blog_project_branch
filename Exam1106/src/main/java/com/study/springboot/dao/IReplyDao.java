package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReplyDto;

@Mapper
public interface IReplyDao {


    public int reply(int bno, String rname, String rcontent); //댓글작성
    public int delete(String rname);
    public ArrayList<ReplyDto> rlist(int bno); //글목록
	public ArrayList<ReplyDto> replyList();
	public int updateReplyDao(ReplyDto reply);
    
    public int deleteReplyDao(ReplyDto reply);
}
