<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.study.springboot.MyController" %>
    <%@ page import="com.study.springboot.dao.IBoardDao" %>    
	<%@ page import="com.study.springboot.dto.BoardDto" %>
	<% ArrayList<BoardDto> list = (ArrayList<BoardDto>)session.getAttribute("modifylist"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정페이지</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
</head>
<body>
    <nav class="navigation">
    
        <img src="images/logo.png" />
      
      <input type="text" placeholder="Search">
      <div class="navigation__links">
        <a href="main" class="navigation__link">
            <i class="fa fa-compass"></i>
        </a>
        <a href="#" class="navigation__link">
            <i class="fa fa-heart-o"></i>
        </a>
        <a href="mypage" class="navigation__link">
            <i class="fa fa-user-o"></i>
        </a>
      </div>
    </nav>
    <main style="width: 50%; margin-left: 25%;">
    <ul class="list-group">
    <%for(int i=0;i<list.size();i++){ %>
        <li class="list-group-item"> 
        <form method="post" action="modifyAction" >
        <textarea cols="60" name="bcontent"><%out.print(list.get(i).getBcontent()); %></textarea>
        <input id="check_hidden" type="hidden"	name="bno" value=<%out.print(list.get(i).getBno()); %> />
        <input class="btn btn-outline-info" type="submit" value="글수정" style="float: right;">         
        <span style="float: right;">게시된 시간 : <%out.print(list.get(i).getBdate());%></span>
        </form>     
        </li>
        <%} %>
    </ul>
    </main>
    <footer>
        <nav class="footer__nav">
          <ul class="footer__list">
            <li class="footer__item"><a href="#" class="footer__link">About us</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Support</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Blog</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Press</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Api</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Jobs</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Privacy</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Terms</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Directory</a></li>
            <li class="footer__item"><a href="#" class="footer__link">Language</a></li>
          </ul>
        </nav>
        <span class="footer__copyright">© 2017 jejugram</span>
      </footer>
</body>
</html>