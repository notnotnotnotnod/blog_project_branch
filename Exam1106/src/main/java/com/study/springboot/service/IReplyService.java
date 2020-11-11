package com.study.springboot.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReplyDto;

public interface IReplyService {
	
	public ReplyDto reply_view(String str_bid); //댓글보기 
    public int reply(String rname, String rcontent); //댓글작성
    
    public ArrayList<ReplyDto> rlist(); //글목록
    
    public int updateReply(HttpServletRequest req);
    
    public int deleteReply(HttpServletRequest req);
    
}
