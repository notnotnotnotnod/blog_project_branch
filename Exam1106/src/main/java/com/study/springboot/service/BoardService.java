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
	public ArrayList<BoardDto> pageList(String page) {
		
		int num_page_no = Integer.parseInt(page); //page번호
		int num_page_size = 5; //한 화면당 보여줄 페이지 수
		int endRowNum = 0;
		int startRowNum = 0;
		ArrayList<BoardDto> boardlist = boardDao.list();
		//page번호가 1이면 1~5,2이면 6~10,3이면 11~15,4이면 16~20		
		int i=num_page_no*num_page_size;
		if(i>boardlist.size()) {
			endRowNum = boardlist.get(i-5).getBno();
			startRowNum = boardlist.get(boardlist.size()-1).getBno();
		}else {
			 endRowNum = boardlist.get(i-5).getBno();
			 startRowNum = boardlist.get(i-1).getBno();
		}
		
		
		System.out.println("num_page_no"+num_page_no);
		System.out.println("num_page_size"+num_page_size);
		System.out.println("startRowNum"+startRowNum);
		System.out.println("endRowNum"+endRowNum);
		
		ArrayList<BoardDto> list = boardDao.pageList(startRowNum, endRowNum);
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
