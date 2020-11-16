package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.BoardDto;

@Mapper
public interface IBoardDao {
	public int write(@Param("bname") String bname,@Param("bcontent") String bcontent); //글작성
    public ArrayList<BoardDto> list(); //글목록
    public BoardDto contentView(String bid_str); //글내용
    public int modify(@Param("bno") int bno,@Param("bcontent") String bcontent); //글수정
    public int delete(String bname); //글삭제
    public BoardDto reply_view(String str_bid); //댓글보기 
    public int reply(String bid, String bname, String bcontent); //댓글작성
    public int upHit(String bid); //조회수 올리기
    public int bnodelete(String bcontent);
    public ArrayList<BoardDto> deletelist(@Param("bname") String bname); //글삭제리스트
    public int boarddelete(@Param("bno") String bno); //게시글 삭제.
}
