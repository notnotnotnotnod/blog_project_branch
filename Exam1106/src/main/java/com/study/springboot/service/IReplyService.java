package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReplyDto;

public interface IReplyService {
	
	public ReplyDto reply_view(String str_bid); //댓글보기 
    public int reply(String rname, String rcontent); //댓글작성
    public int delete(String rname);
    public ArrayList<ReplyDto> rlist(); //글목록
}
