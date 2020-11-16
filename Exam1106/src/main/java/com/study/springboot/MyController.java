package com.study.springboot;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.FileDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.IBoardService;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IReplyService;
import com.study.springboot.service.IWriteSetService;

@Controller
public class MyController {
	
	@Autowired
	IMemberService member_service;	
	
	@Autowired
	IWriteSetService Write_service;
	
	@Autowired
	IBoardService board_service;
	
	@Autowired
	IReplyService reply_service;
	
	@Autowired
	FileUploadService fileUploadService;

	@RequestMapping("/")
	public String root() throws Exception {
		return "redirect:login";
	}

	@RequestMapping("/login")
	public String login() throws Exception {
		return "login";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		//각각의 list를 ArrayList로 생성 후 세션에 저장.
		ArrayList<FileDto> hashlist = Write_service.hashtagList();
		ArrayList<FileDto> asidehashlist = Write_service.aside_hashtagList();
		ArrayList<FileDto> filelist = Write_service.fileList();
		ArrayList<BoardDto> list = board_service.list();
		ArrayList<ReplyDto> rlist = reply_service.replyList();
		
		session.setAttribute("filelist", filelist);
		session.setAttribute("list", list);
		session.setAttribute("asidehashlist", asidehashlist);
		session.setAttribute("hashlist", hashlist);
		session.setAttribute("listBoard", rlist);
		
		return "main";
	}

	@RequestMapping("/findId")
	public String findId() throws Exception {
		return "findId";
	}
	
	@RequestMapping("/findPw")
	public String findPw() throws Exception {
		return "findPw";
	}
	
	@RequestMapping("/ask")
	public String ask() throws Exception {
		return "ask";
	}
	
	@RequestMapping("/deleteboard")
	public String deleteboard(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();
		String name = (String)session.getAttribute("sessionID");
		ArrayList<BoardDto> deletelist = board_service.deletelist(name);
		session.setAttribute("deletelist", deletelist);		
		return "deleteboard";
	}
	
	@RequestMapping("/modifyboard")
	public String bodifyboard(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();
		String name = (String)session.getAttribute("sessionID");
		ArrayList<BoardDto> deletelist = board_service.deletelist(name);
		session.setAttribute("modifylist", deletelist);		
		return "modifyboard";
	}
	
	@RequestMapping("/modifyAction")
	public String modifyboardAction(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();
		int bno = Integer.parseInt(req.getParameter("bno"));
		String bcontent = req.getParameter("bcontent");
		System.out.println("bno : "+bno+"bcontent : "+bcontent);
		int nResult = board_service.modify(bno, bcontent);
		if(nResult <= 0) {
			System.out.println("글 수정 실패");
			model.addAttribute("msg","글수정실패");
			model.addAttribute("url","/mypage");
		}else {
			System.out.println("글 수정 성공");
			model.addAttribute("msg","글수정성공");
			model.addAttribute("url","/mypage");
		}
		return "redirect";
	}
	
	@RequestMapping("/deleteAction")
	public String deleteAction(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();
		//String name = (String)session.getAttribute("sessionID");
		String bno = req.getParameter("bno");
		System.out.println(bno+" bno");
		int nResult = board_service.boarddelete(bno);
		if(nResult <= 0) {
			System.out.println("글 삭제 실패");
			model.addAttribute("msg","글삭제실패");
			model.addAttribute("url","/mypage");
		}else {
			System.out.println("글 삭제 성공");
			model.addAttribute("msg","글삭제성공");
			model.addAttribute("url","/mypage");
		}
		return "redirect";
	}
	
	@RequestMapping("/join")
	public String join() throws Exception {
		return "join";
	}
	
	@RequestMapping(value = "/JoinAction", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String MemberJoinAction(HttpServletRequest req, Model model) throws Exception{
		req.setCharacterEncoding("utf-8"); // 인코딩
		
		int nResult = member_service.insertMember( req );
		if( nResult <= 0 ) {
			System.out.println("회원가입 실패");
			
	        model.addAttribute("msg","회원가입 실패");
	        model.addAttribute("url","/join");
		}else {
			System.out.println("회원가입 성공");
			
			model.addAttribute("msg","회원가입 성공");
            model.addAttribute("url","/login");
		}
		
		return "redirect";
	}
	
	@RequestMapping("/MemberLoginAction")
	public String MemberLoginAction(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		
		int nResult = member_service.loginCheck(id, pw);
		if( nResult <= 0 ) {
			System.out.println("로그인 실패");
			
	        model.addAttribute("msg","로그인 실패 - 아이디나 암호를 확인해주세요");
	        model.addAttribute("url","/login");

		}else {
			System.out.println("로그인 성공");
			
			//로그인 성공 -> 세션에 아이디를 저장
			HttpSession session = req.getSession();
	   		session.setAttribute("sessionID", id);
	   		
			model.addAttribute("msg","로그인 성공");
            model.addAttribute("url","/main");

		}
		return "redirect";
		 //redirect.jsp
		}
	
	@RequestMapping("/LogoutAction")
	public String MemberLogoutAction(HttpServletRequest req, Model model) {
		int nResult = member_service.logoutDao();
		if( nResult <= 0 ) {
			System.out.println("로그아웃 실패");
			
	        model.addAttribute("msg","로그아웃 실패");
	        model.addAttribute("url","/");
		}else {
			System.out.println("로그아웃 성공");
			
			// 로그아웃시 세션정보를 모두 삭제한다.
			req.getSession().invalidate();
			
			model.addAttribute("msg","로그아웃 성공");
            model.addAttribute("url","/login");
		}
		
		return "redirect"; //redirect.jsp
	}
	
		@RequestMapping("/mypage")
	public String mypage(HttpServletRequest req) {
		String id = req.getSession().getAttribute("sessionID").toString();
		
		MemberDto dto = member_service.getUserInfo(id);
		
		req.getSession().setAttribute("memberInfo", dto);
		  
		return "mypage";
	}
	
	@RequestMapping(value="/membermodify", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String membermodify(HttpServletRequest req, Model model) throws Exception {
		System.out.println("name : "+req.getParameter("name"));
		
		req.setCharacterEncoding("utf-8"); // 인코딩
		
		int nResult = member_service.updateMember(req);
		
		if( nResult <= 0 ) {
			System.out.println("회원수정 실패");
			
			model.addAttribute("msg","회원수정 실패");
			model.addAttribute("url","/mypage");

		}else {
			System.out.println("회원수정 성공");
			
			model.addAttribute("msg","회원수정 성공");
			model.addAttribute("url","/main");

		}
	return "redirect";
	}
	@RequestMapping(value="/IdCheckAction", method=RequestMethod.GET)
	public @ResponseBody String IdCheckAction(HttpServletRequest req, Model model) {
		
		System.out.println( "userID:" + req.getParameter("id"));
		
		
		int nResult = member_service.idCheck((String)req.getParameter("id"));
		if( nResult > 0 ) {
			System.out.println("중복된 아이디 있음");
			
		}else {
			System.out.println("중복된 아이디 없음");
			
		}
		
		return String.valueOf( nResult );
	}
	
	@RequestMapping(value="/MailCheckAction", method=RequestMethod.GET)
	public @ResponseBody String MailCheckAction(HttpServletRequest req, Model model) {
		
		System.out.println( "userMail:" + req.getParameter("mail"));
		
		
		int nResult = member_service.idCheck( req.getParameter("mail") );
		if( nResult > 0 ) {
			System.out.println("중복된 메일 있음");
			
		}else {
			System.out.println("중복된 메일 없음");
			
		}
		
		return String.valueOf( nResult );
	}
	 
	@RequestMapping(value = "/uploadAction", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public  String uploadOk(
			HttpServletRequest req,
			Model model,
			MultipartHttpServletRequest mtfRequest,
			@RequestParam("filename") MultipartFile[] file) throws Exception{
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		// board에 bno생성하고 데이터입력.
		String bname = (String)session.getAttribute("sessionID");
		String bcontent = req.getParameter("bcontent");
		int nResult = board_service.write(bname, bcontent);
		
		
		String numberset = req.getParameter("number");
		int number = Integer.parseInt(numberset);
		ArrayList<BoardDto> list = board_service.list();
	ArrayList<FileDto> filelist = Write_service.fileList();
		
		ArrayList fileset = new ArrayList();
		//해시태그란에 들어있던 해시태그를 ,기준으로 받아서 #OOO으로 ArrayList에 삽입.
		ArrayList hashtagList = new ArrayList();
		String hashtag = req.getParameter("tags");
		int j=0;
		for(int i=0;i<hashtag.length();i++) {
			String get="#";
			if(hashtag.charAt(i)==',') {
				for(int k=j;k<i;k++) {
					get+=hashtag.charAt(k);
				}
				hashtagList.add(get);
				j=i+1;
			}
			if(i==(hashtag.length()-1)) {
				if(hashtag.charAt(i)==',') {
			}else {
				for(int k=j;k<=i;k++) {
					get+=hashtag.charAt(k);
				}
				hashtagList.add(get);
				}
			}
		}		
		
		for(int i=0;i<hashtagList.size();i++) {
			Write_service.hashtag(number,(String)hashtagList.get(i));
		}
		
			 
		for(int i=0;i<file.length;i++) {
			String url = fileUploadService.restore(file[i],(String)session.getAttribute("sessionID"),numberset);
			
			//파일이름 불러오기 arraylist에 저장가능.
			String name = fileUploadService.getname();
			fileset.add(name);
		}
		for(int i=0;i<fileset.size();i++) {
			System.out.println("파일이름 : "+fileset.get(i));
			int result = Write_service.picset(number, (String)fileset.get(i));
		}
		
		
		session.setAttribute("list", list);
		session.setAttribute("filelist", filelist);
		
		

		
		
		System.out.println(bname);
		System.out.println(session.getAttribute("sessionID"));
		
		
		if( nResult <= 0 ) {
			System.out.println("글쓰기 실패");
			
	        model.addAttribute("msg","글쓰기 실패");
	        model.addAttribute("url","/write");
		}else {
			System.out.println("글쓰기 성공");
			/*
			 * int i =member_service.getBno2(id);
			 * 
			 * if(i==1) { System.out.println("getBno2성공!"); }
			 */
			model.addAttribute("msg","글쓰기 성공");
            model.addAttribute("url","/main");
		}
		
		
		return "redirect";
	}


	@RequestMapping("/FindIdAction")
	public String FindIdAction(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		
		String nResult = member_service.FindId(name, mail);
		
		if( nResult == null ) {
			System.out.println("입력하신 정보를 다시 확인해주세요");
			
	        model.addAttribute("msg","입력하신 정보를 다시 확인해주세요");
	        model.addAttribute("url","/findId");
	        return "redirect";
		}else {
			System.out.println("아이디 찾기 성공");
//			model.addAttribute("name", req.getParameter("name"));
//			model.addAttribute("mail", req.getParameter("mail"));
			model.addAttribute("id", nResult);
		}	
            return "findIdResult";
		}
	
	@RequestMapping("/FindPwAction")
	public String FindPwAction(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		
		String nResult = member_service.FindPw(id, name, mail);
		
		if( nResult == null ) {
			System.out.println("이름과 메일주소를 다시 확인해주세요");
			
	        model.addAttribute("msg","입력하신 정보를 다시 확인해주세요");
	        model.addAttribute("url","/findPw");
	        return "redirect";
		}else {
			System.out.println("비밀번호 찾기 성공");
//			model.addAttribute("name", req.getParameter("name"));
//			model.addAttribute("mail", req.getParameter("mail"));
			model.addAttribute("pw", nResult);
		}	
            return "findPwResult";
		}

	@RequestMapping("/coment")
	public String coment(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		
		String bno = req.getParameter("bno");
		System.out.println("bno(mc)="+bno);
		
		ArrayList<BoardDto> list = board_service.list();
		System.out.println("게시판리스트:" + list);
		
		ArrayList<ReplyDto> rlist = reply_service.rlist(bno);
		System.out.println("댓글리스트:" + rlist);
		
		session.setAttribute("list", list);
		session.setAttribute("listBoard", rlist);
		session.setAttribute("bno", bno);
//		req.getSession().setAttribute("listBoard", rlist);
		
		return "coment";
	}
	@RequestMapping("/contents")
	public String contents() throws Exception {
		return "contents";
	}
	@RequestMapping("/dropout")
	public String dropout() throws Exception {
		return "dropout";
	}
	@RequestMapping("/dropoutAction")
	public String dropoutAction(HttpServletRequest req, Model model) throws Exception {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("sessionID");
		String password = req.getParameter("password");
		
		int nResult = member_service.deleteMember(id, password);
		
		if( nResult <= 0 ) {
			System.out.println("회원탈퇴 실패");
			
			model.addAttribute("msg","회원탈퇴 실패");
			model.addAttribute("url","/dropout");

		}else {
			System.out.println("회원탈퇴 성공");
			
			session.invalidate(); // 회원정보 담긴 세션 삭제 - 로그아웃함.
			
			model.addAttribute("msg","회원탈퇴 성공");
			model.addAttribute("url","/login");

		}
		return "redirect";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest req, Model model) throws Exception {
		ArrayList<BoardDto> list = board_service.list();
		req.getSession().setAttribute("list",list);
		
		
		return "write";
	}
	
	//------------------------------------------------------------------ 수정중
	
	@RequestMapping(value="/reply", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String reply(HttpServletRequest req, Model model) throws Exception {
		
		req.setCharacterEncoding("utf-8"); // 인코딩
		HttpSession session = req.getSession();
		
        String bno = req.getParameter("bno");
        String rname = req.getParameter("rname");
        String rcontent = req.getParameter("rcontent");
        
        System.out.println("bno(mc)(reply)="+bno);
        System.out.println("rname(mc)(reply)="+rname);
        System.out.println("rcontent(mc)(reply)="+rcontent);
        
		int nResult = reply_service.reply(bno, rname, rcontent);
		if( nResult <= 0 ) {
			System.out.println("댓글작성 실패");
			
	        model.addAttribute("msg","댓글작성 실패");
	        model.addAttribute("url","/coment");
		}else {
			System.out.println("댓글작성 성공");
			
			model.addAttribute("msg","댓글작성 성공");
            model.addAttribute("url","/main");
		}
		
		return "redirect";
	}
	
	
	@RequestMapping(value="/reply_modify", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String reply_modify(HttpServletRequest req, Model model) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		int nResult = reply_service.updateReply(req);
		
		System.out.println("rno=" + req.getParameter("rno"));
		System.out.println("rname=" + req.getParameter("rname"));
		System.out.println("rcontent=" + req.getParameter("rcontent"));
		
		if( nResult <= 0 ) {
			System.out.println("댓글수정 실패");
			
			model.addAttribute("msg","댓글수정 실패");
			model.addAttribute("url","/coment");
			return "redirect";
		}else {
			System.out.println("댓글수정 성공");
			
			model.addAttribute("msg","댓글수정 성공");
			model.addAttribute("url","/main");
			return "redirect";
		}	
	}
	
	@RequestMapping(value="/reply_delete", method=RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String reply_delete(HttpServletRequest req, Model model) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		int nResult = reply_service.deleteReply(req);
		
		System.out.println("rno=" + req.getParameter("rno"));
		System.out.println("rname=" + req.getParameter("rname"));
		System.out.println("rcontent=" + req.getParameter("rcontent"));
		
		if( nResult <= 0 ) {
			System.out.println("댓글삭제 실패");
			
			model.addAttribute("msg","댓글삭제 실패");
			model.addAttribute("url","/coment");
			return "redirect";
		}else {
			System.out.println("댓글삭제 성공");
			
			model.addAttribute("msg","댓글삭제 성공");
			model.addAttribute("url","/main");
			return "redirect";
		}	
	}
	
}
