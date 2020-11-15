package com.study.springboot.service;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.study.springboot.dto.BoardDto;

import com.study.springboot.dto.ReplyDto;

public interface IReplyService {
	 
    public int reply(String bno, String rname, String rcontent); //댓글작성
    public int delete(String rname);
    public ArrayList<ReplyDto> rlist(String bno); //글목록
	public ArrayList<ReplyDto> replyList();
	public int updateReply(HttpServletRequest req);
    
    public int deleteReply(HttpServletRequest req);
}
