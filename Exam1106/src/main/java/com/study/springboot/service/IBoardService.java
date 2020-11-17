package com.study.springboot.service;

import java.util.ArrayList;

import com.study.springboot.dto.BoardDto;

public interface IBoardService {
	public int write(String bname, String bcontent); //글작성
    public ArrayList<BoardDto> list(); //글목록
    public BoardDto contentView(String bid_str); //글내용
    public int modify(int bno, String bcontent); //글수정
    public int delete(String bid); //글삭제
    public BoardDto reply_view(String str_bid); //댓글보기 
    public int reply(String bid, String bname, String bcontent); //댓글작성
    public int upHit(String bid); //조회수 올리기
    public ArrayList<BoardDto> deletelist(String bname);
    public ArrayList<BoardDto> NameSearchList(String bname);
    public ArrayList<BoardDto> BoardSearchList(String bcontent);
    public ArrayList<BoardDto> BnoSearchList(int bno);
    public int boarddelete(String bno);
}
