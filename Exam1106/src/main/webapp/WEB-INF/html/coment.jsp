<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.BoardDto" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <title>댓글 상세페이지</title>
 <%
		BoardDto coment = (BoardDto)session.getAttribute("coment");
    	HttpServletRequest req;
	%>
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
    <div style="margin: 3cm; ">
    <header>
        <a href="main" id="home">
        <img src="images/logo.png" alt="메인화면"></a>
        <hr>
    </header>
    <main>
        <div style="margin-left: 30%; margin-right: 30%; ">
        <div class="alert alert-dark" role="alert">
           <p> 댓글1<a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
        </div>
        <div class="alert alert-dark" role="alert">
            <p> 댓글2<a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
         </div>
         <div class="alert alert-dark" role="alert">
            <p> 댓글3<a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
         </div>
         <div class="alert alert-dark" role="alert">
            <p> 댓글4<a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
         </div>
         <div class="alert alert-dark" role="alert">
            <p> 댓글5<a href="#" class="badge badge-primary" style="float: right;">삭제</a> <a href="#" class="badge badge-primary" style="float: right;">수정</a></p>
         </div>
<form action="reply" method=post>
         	<input type="hidden" name="bid" value="${coment.bid}">
<%--          	<input type="hidden" name="bname" value="${coment.bname}"> --%>
         	<input type="hidden" name="bname" value=<%= session.getAttribute("sessionID") %>>
        <div class="input-group mb-3">
            <input type="text" name="bcontent" value="${coment.bcontent}" class="form-control" placeholder="댓글달기" aria-label="Recipient's username" aria-describedby="button-addon2">
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