<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.ReplyDto" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<% 		
		ReplyDto dto = (ReplyDto)session.getAttribute("coment");
 		List<ReplyDto> rlist = (List<ReplyDto>)session.getAttribute("listBoard");
 		System.out.println("rlist:"+rlist);
	%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Insert title here</title>
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
</head>
<body>
    <header>
        <a href="main" id="home">
        <img src="images/logo.png" alt="메인화면"></a>
        <hr>
    </header>

<%--    	<% for(int i=0; i<rlist.size(); i++) { %> --%>
<%--    	<stan><%out.print( rlist.get(i).getRname()); %></stan> <br> --%>
<%--    	<stan><%out.print( rlist.get(i).getRcontent());%></stan> <br> --%>
<%--    	<% } %> --%>
   	
   	<div style="margin-left: 30%; margin-right: 30%; ">
   	
   	<div class="alert alert-dark" role="alert">
   	<% for(int i=0; i<rlist.size(); i++) { %>
       <p><%out.print( rlist.get(i).getRname()); %>, <%out.print(rlist.get(i).getRcontent());%><a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
    <% } %>
  	</div>
   	
   	
<form action="reply" method=post>
         	<input type="hidden" name="bno" value="${dto.bno}">
         	<input type="hidden" name="bname" value="${dto.bname}">
         	<input type="hidden" name="rname" value=<%= session.getAttribute("sessionID") %>>
        <div class="input-group mb-3">
            <input type="text" name="rcontent" value="${dto.rcontent}" class="form-control" placeholder="댓글달기" aria-label="Recipient's username" aria-describedby="button-addon2">
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