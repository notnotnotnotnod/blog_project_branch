package com.study.springboot.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.ReplyDto;

@Service
public class ReplyService implements IReplyService{
	
	@Autowired
	IReplyDao replyDao;
	@Autowired
	ReplyDto replyDto;

	@Override
	public int reply(String bno, String rname, String rcontent) {
		int nResult = replyDao.reply(Integer.parseInt(bno), rname, rcontent);
		return nResult;
	}

	@Override
	public ArrayList<ReplyDto> rlist(String bno) {
		ArrayList<ReplyDto> rlist = replyDao.rlist(Integer.parseInt(bno));
		return rlist;
	}

	@Override
	public int delete(String rname) {
		
		return replyDao.delete(rname);
	}

	@Override
	public ArrayList<ReplyDto> replyList() {
		ArrayList<ReplyDto> replyList = replyDao.replyList();
		return replyList;
	}
	@Override
	public int updateReply(HttpServletRequest req) {
		HttpSession session = req.getSession();

		replyDto.setRno(Integer.parseInt(req.getParameter("rno")));
		
		replyDto.setRcontent(req.getParameter("rcontent"));
		
		int nResult = replyDao.updateReplyDao(replyDto);
		
		return nResult;
	}

	
	@Override
	public int deleteReply(HttpServletRequest req) {
		HttpSession session = req.getSession();

		replyDto.setRno(Integer.parseInt(req.getParameter("rno")));
		
		int nResult = replyDao.deleteReplyDao(replyDto);
		
		return nResult;
	}
}
