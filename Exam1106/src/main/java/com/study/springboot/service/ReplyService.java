package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.ReplyDto;

@Service
public class ReplyService implements IReplyService{
	
	@Autowired
	IReplyDao replyDao;
	@Autowired
	ReplyDto replyDto;
	
	@Override
	public ReplyDto reply_view(String str_bid) {
		ReplyDto dto = replyDao.reply_view(str_bid);
		return dto;
	}

	@Override
	public int reply(String rname, String rcontent) {
		int nResult = replyDao.reply(rname, rcontent);
		return nResult;
	}

	@Override
	public ArrayList<ReplyDto> rlist() {
		ArrayList<ReplyDto> rlist = replyDao.rlist();
		return rlist;
	}

}
