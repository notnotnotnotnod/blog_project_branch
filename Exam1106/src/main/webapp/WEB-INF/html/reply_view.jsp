<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dto.BoardDto" %>    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
    <title>댓글 상세페이지</title>
    <%
		BoardDto reply_view = (BoardDto)session.getAttribute("reply_view");
	%>
   
</head>
<body>
    <table width="500" cellpadding="0" cellspacing="0" border="1">
        <form action="reply" method="post">
            <!-- 화면에 보이지는 않지만 form에 담기위해서  -->
            <input type="hidden" name="bid" value="${reply_view.bid}">
            <tr>
                <td> 번호 </td>
                <td> ${reply_view.bid} </td>
            </tr>
            <tr>
                <td> 히트 </td>
                <td> ${reply_view.bhit} </td>
            </tr>
            <tr>
                <td> 이름 </td>
                <td> <input type="text" name="bname" value="${reply_view.bname}"></td>
            </tr>
            <tr>
                <td> 제목 </td>
                <td> <input type="text" name="btitle" value="${reply_view.btitle}"></td>
            </tr>
            <tr>
                <td> 내용 </td>
                <td> <textarea rows="10"  name="bcontent">${reply_view.bcontent}</textarea></td>
            </tr>
            <tr >
                <td colspan="2"><input type="submit" value="답변"> <a href="main" >feed</a></td>
            </tr>
        </form>
    </table>
    
<!-- create table blog_board( -->
<!--     bId        number(4) primary key, -->
<!--     bName        varchar2(20), -->
<!--     bTitle        varchar2(100), -->
<!--     bContent        varchar2(300), -->
<!--     bDate        date default sysdate, -->
<!--     bHit        number(4) default 0, -->
<!--     bGroup        number(4), -->
<!--     bStep        number(4), -->
<!--     bIndent        number(4) -->
<!-- ); -->

<!-- create sequence blog_board_seq; -->

<!-- insert into blog_board(bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)  -->
<!-- values (blog_board_seq.nextval, '홍길동', '글 제목', '글 내용', 0, blog_board_seq.currval, 0, 0);     -->

</body>
</html>

