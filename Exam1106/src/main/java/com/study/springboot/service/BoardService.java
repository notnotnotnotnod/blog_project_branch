package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IBoardDao;
import com.study.springboot.dto.BoardDto;

@Service
public class BoardService implements IBoardService {

	@Autowired
	IBoardDao boardDao;
	@Autowired
	BoardDto boardDto;
	
	@Override
	public int write(String bname, String bcontent) {
		int nResult = boardDao.write(bname, bcontent);
		return nResult;
	}
	
	@Override
	public ArrayList<BoardDto> deletelist(String name){
		ArrayList<BoardDto> deletelist = boardDao.deletelist(name);
		return deletelist;
	}
	
	@Override
	public ArrayList<BoardDto> NameSearchList(String bname){
		ArrayList<BoardDto> list = boardDao.NameSearchList(bname);
		return list;
	}
	
	@Override
	public ArrayList<BoardDto> BoardSearchList(String bcontent){
		ArrayList<BoardDto> list = boardDao.BoardSearchList(bcontent);
		return list;
	}
	
	@Override
	public ArrayList<BoardDto> BnoSearchList(int bno){
		ArrayList<BoardDto> list = boardDao.BnoSearchList(bno);
		return list;
	}
	
	@Override
	public ArrayList<BoardDto> list() {
		ArrayList<BoardDto> list = boardDao.list();
		return list;
	}

	@Override
	public BoardDto contentView(String bid_str) {
		boardDao.upHit(bid_str);
		
		return boardDao.contentView(bid_str);
	}

	@Override
	public int modify(int bno, String bcontent) {
		int nResult = boardDao.modify(bno, bcontent);
		return nResult;
	}

	@Override
	public int delete(String bid) {
		
		return boardDao.delete(bid);
	}
	
	@Override
	public int boarddelete(String bno) {
		return boardDao.boarddelete(bno);
	}

	@Override
	public BoardDto reply_view(String str_bid) {
		BoardDto dto = boardDao.reply_view(str_bid);
		return dto;
	}

	@Override
	public int reply(String bid, String bname, String bcontent) {
		
		int nResult = boardDao.reply(bid, bname, bcontent);
		
		return nResult;
	}

	@Override
	public int upHit(String bid) {
		int nResult = boardDao.upHit(bid);
		return nResult;
	}
	
}
