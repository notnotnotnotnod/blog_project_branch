<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.ReplyDto" %>
<%@ page import="com.study.springboot.dto.BoardDto" %>
<%@ page import="com.study.springboot.dao.IBoardDao" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<% 	
		
		String bno = (String)session.getAttribute("bno");
		String sessionId = (String)session.getAttribute("sessionID");
		ArrayList<BoardDto> board =(ArrayList<BoardDto>)session.getAttribute("list");
		ArrayList<ReplyDto> rlist = (ArrayList<ReplyDto>)session.getAttribute("listBoard");
 		
 		System.out.println("rlist(coment상단):"+rlist);
 		System.out.println("list(coment상단):"+board);
 		System.out.println("bno(coment상단):"+bno);
 		System.out.println("sessionId(coment상단):"+sessionId);
	%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>댓글 상세페이지</title>
    <style>
        
        #home{
            margin-left: 10px;
        }
        header{
            margin-left: 30%;
            padding-bottom: 1cm;
            padding-top: 1cm;
        }
        hr{
            margin-right: 30%;
        }
    </style>
    <script>
	    function formSubmit( index )
	    {
	    	document.getElementById("form" + index).action = "reply_delete";
	        document.getElementById("form" + index).submit();
	    }
    </script>
</head>
<body>
    <header>
        <a href="main" id="home">
        <img src="images/logo.png" alt="메인화면"></a>
        <hr>
    </header>
   	<div style="margin-left: 30%; margin-right: 30%; ">
   	
<!--    	<div class="alert alert-dark" role="alert"> -->
<%--    	<% for(int i=0; i<rlist.size(); i++) { %> --%>
<%--        <p><%out.print( rlist.get(i).getRname()); %>, <%out.print(rlist.get(i).getRcontent());%> --%>
<!--        	  <a href="#" class="badge badge-primary" style="float: right;">삭제</a> -->
<!--        	  <a href="#" class="badge badge-primary" style="float: right;">수정</a> -->
<!--        </p> -->
<%--     <% } %> --%>
<!--   	</div> -->
  	
  	<div class="alert alert-dark" role="alert">
   	<% for(int i=0; i<rlist.size(); i++) { %>
   	   <form id="form<%= i %>"  action="reply_modify" method="post">
   	   	   <input type="hidden" name="rno" value=<%out.print( rlist.get(i).getRno()); %>>
   	   	   <input type="hidden" name="rname" value=<%out.print( rlist.get(i).getRname()); %>>
	       <p><%out.print( rlist.get(i).getRname()); %>
	       	  <input type="button" onclick="formSubmit(<%= i %>)"  
	       	  		 value="삭제" class="btn" style="float: right;">
        	  <input type="submit" class="btn" value="수정" style="float: right;">
	       </p>
	       <input type="text" name="rcontent" value="${dto.rcontent}" class="form-control" 
	       		  placeholder="<%out.print(rlist.get(i).getRcontent());%>" aria-label="Recipient's username" aria-describedby="button-addon2">
	   </form>
    <% } %>
  	</div>
   	
   	
<form action="reply" method=post>
         	<input type="hidden" name="bno" value="<%= session.getAttribute("bno") %>">
         	<input type="hidden" name="rname" value=<%= session.getAttribute("sessionID") %>>
        <div class="input-group mb-3">
            <input type="text" name="rcontent" class="form-control" 
            	   placeholder="댓글달기" aria-label="Recipient's username" aria-describedby="button-addon2">
            <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="submit" id="button-addon2">작성</button>
            </div>
          </div>
</form>
        </div>
        <hr style="margin-left: 30%">
    </main>
</div>

    <footer class="container align-center">
        <nav id="page" aria-label="Page navigation example" style="margin-left: 40%;">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>

                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <p style="text-align: center;">Copyright 2020 blog Corp. All Rights Reserved.</p>
    </footer>
   	
</body>
</html>