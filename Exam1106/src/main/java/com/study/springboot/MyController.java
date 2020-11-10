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
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ReplyDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.IBoardService;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IReplyService;





@Controller
public class MyController {
	
	@Autowired
	IMemberService member_service;	
	
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
		
		ArrayList<BoardDto> list = board_service.list();
		req.getSession().setAttribute("list", list);
		
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
		
		HttpSession session = req.getSession();
		String number = req.getParameter("number");
		for(int i=0;i<file.length;i++) {
			String url = fileUploadService.restore(file[i],(String)session.getAttribute("sessionID"),number);
			
			//파일이름 불러오기 arraylist에 저장가능.
			String name = fileUploadService.getname();
			System.out.println("파일 "+(i+1)+"번째 이름 : "+name);
			
		}
		ArrayList<BoardDto> list = board_service.list();
		req.getSession().setAttribute("list", list);
		req.setCharacterEncoding("utf-8");
		
		String bname = (String)session.getAttribute("sessionID");
		String bcontent = req.getParameter("bcontent");
		System.out.println(bname);
		System.out.println(session.getAttribute("sessionID"));
		int nResult = board_service.write(bname, bcontent);
		if( nResult <= 0 ) {
			System.out.println("글쓰기 실패");
			
	        model.addAttribute("msg","글쓰기 실패");
	        model.addAttribute("url","/write");
		}else {
			System.out.println("글쓰기 성공");
			
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
		
		ArrayList<ReplyDto> rlist = reply_service.rlist();
		System.out.println("댓글리스트:" + rlist);
		
		req.getSession().setAttribute("listBoard", rlist);
		
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
		
//        String bno = req.getParameter("bno");
        String rname = req.getParameter("rname");
        String rcontent = req.getParameter("rcontent");
        
		int nResult = reply_service.reply(rname, rcontent);
		if( nResult <= 0 ) {
			System.out.println("댓글작성 실패");
			
	        model.addAttribute("msg","댓글작성 실패");
	        model.addAttribute("url","/coment");
		}else {
			System.out.println("댓글작성 성공");
			
			model.addAttribute("msg","댓글작성 성공");
            model.addAttribute("url","/coment");
		}
		
		return "redirect";
	}
	
}
