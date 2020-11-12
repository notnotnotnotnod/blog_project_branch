package com.study.springboot.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;

import com.study.springboot.dao.IBoardDao;
import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dao.IReplyDao;
import com.study.springboot.dto.FileDto;
import com.study.springboot.dto.MemberDto;

//@Service, @Controller, @Repository가 동일한 기능을 한다.
//해당 클래스의 객체들을 빈으로 등록하고 만들때 사용.
@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberDao memberDao;
	
	@Autowired
	IReplyDao replyDao;
	
	@Autowired
	IBoardDao boardDao;
	
	@Autowired
	MemberDto memberDto;

	@Autowired
	PlatformTransactionManager transactionManager;
	@Autowired
	TransactionDefinition definition;
	
	@Override
	public int insertMember(HttpServletRequest req) {
		
		memberDto.setId(req.getParameter("id"));
		memberDto.setPassword(req.getParameter("password"));
		memberDto.setName(req.getParameter("name"));

		String mail = req.getParameter("mail");
		memberDto.setMail(mail);

		int nResult = memberDao.insertMemberDao(memberDto);
		return nResult;
	}

	@Override
	public int loginCheck(String id, String pw) {
		int nResult = memberDao.loginCheckDao(id, pw);
		return nResult;
	}
		@Override
	public MemberDto getUserInfo(String id) {
		return memberDao.getUserInfoDao(id);
	}

		@Override
		public int picset(int bno,String filename) {
			int nResult = memberDao.picset(bno, filename);
			return nResult;
		}
		
		
	@Override
	public int updateMember(HttpServletRequest req) { // 세션이 가지고있는 로그인한ID 정보를 가져온다
		HttpSession session = req.getSession();
		String id = session.getAttribute("sessionID").toString();

		// 수정할 정보를 자바빈에 세팅한다.

		memberDto.setId(id);
		memberDto.setPassword(req.getParameter("password"));
		memberDto.setName(req.getParameter("name"));
		memberDto.setGender(req.getParameter("gender"));
		memberDto.setMail(req.getParameter("mail"));
		memberDto.setPhone(req.getParameter("phone"));
		memberDto.setBio(req.getParameter("bio"));

		
		  System.out.println("password : "+req.getParameter("password"));
		  System.out.println("name : "+req.getParameter("name"));
		  System.out.println("gender : "+req.getParameter("gender"));
		  System.out.println("mail : "+req.getParameter("mail"));
		  System.out.println("phone : "+req.getParameter("phone"));
		  System.out.println("bio : "+req.getParameter("bio"));
		 

		int nResult = memberDao.updateMemberDao(memberDto);
		return nResult;
	}
	
	@Override
	public String FindId(String name, String mail) {
		String nResult = memberDao.FindIdDao(name, mail);
		return nResult;
	}

	@Override
	public String FindPw(String id, String name, String mail) {
		String nResult = memberDao.FindPwDao(id, name, mail);
		return nResult;
	}
	
	@Override
	public int getBno2(String id) {
		boardDao.bnodelete("get");
		return 1;
	}
	
	@Override
	public int getBno(String id) {
			boardDao.write(id, "get");
			return 1;		
	}
	@Override
	public int deleteMember(String id, String pw) {
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try {
			
			boardDao.delete(id);
			
			memberDao.deleteMemberDao(id, pw);
			
			replyDao.delete(id);
			
			transactionManager.commit(status);
			return 1;
			
		}catch(Exception e) {
			System.out.println("오류발생");
			transactionManager.rollback(status);
			return 0;
		}	
	}
	
	@Override 
	public int idCheck(String id) { 
		int nResult =  memberDao.idCheckDao(id);
		return nResult; 
		}
	
	
	@Override 
	public int mailCheck(String mail) { 
		int nResult =  memberDao.mailCheckDao(mail);
		return nResult; 
		}
	
	
	@Override
	public ArrayList<MemberDto> userList() { 
		ArrayList<MemberDto> list = memberDao.userListDao();
		return list; 
		}
	
	@Override 
	public int logoutDao() { 
		return 1; //항상 성공 
		}
	
	@Override
	public ArrayList<FileDto> fileList(){
		ArrayList<FileDto> list = memberDao.fileListDao();
		return list;
	}
	
	@Override
	public int hashtag(int bno,String tagname) {
		int nResult = memberDao.hashtag(bno, tagname);
		return nResult;
	}
	
	/*
	 * @Override public MemberDto getUserInfo(String id) { return
	 * memberDao.getUserInfoDao(id); }
	 * 
	 * @Override public int updateMember(HttpServletRequest req) { // 세션이 가지고있는 로그인한
	 * ID 정보를 가져온다 HttpSession session = req.getSession(); String id =
	 * session.getAttribute("sessionID").toString();
	 * 
	 * // 수정할 정보를 자바빈에 세팅한다.
	 * 
	 * memberDto.setId(id); memberDto.setPassword(req.getParameter("password"));
	 * String mail1 = req.getParameter("mail1"); String mail2 =
	 * req.getParameter("mail2"); memberDto.setMail( mail1 + "@" + mail2 );
	 * 
	 * int nResult = memberDao.updateMemberDao(memberDto); return nResult; }
	 * 
	 * @Override public int deleteMember(String id, String pw) {
	 * 
	 * int nResult = memberDao.deleteMemberDao(id, pw); return nResult; }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */



}
