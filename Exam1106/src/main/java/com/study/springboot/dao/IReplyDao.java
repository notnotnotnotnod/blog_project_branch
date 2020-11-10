package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReplyDto;

@Mapper
public interface IReplyDao {

    public ReplyDto reply_view(String str_bid); //댓글보기 
    public int reply(String rname, String rcontent); //댓글작성
    
    public ArrayList<ReplyDto> rlist(); //글목록
}
