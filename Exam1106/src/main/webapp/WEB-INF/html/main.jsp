<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.study.springboot.MyController" %>
    <%@ page import="com.study.springboot.dao.IBoardDao" %>    
	<%@ page import="com.study.springboot.dto.BoardDto" %>
    <%@ page import="com.study.springboot.dto.FileDto" %>
    <%@ page import="com.study.springboot.dto.ReplyDto" %>

    <%
    	ArrayList<FileDto> fileset = (ArrayList<FileDto>)session.getAttribute("filelist"); 
       	   ArrayList<BoardDto> board =(ArrayList<BoardDto>)session.getAttribute("list");
       	   ArrayList<BoardDto> totallist =(ArrayList<BoardDto>)session.getAttribute("totallist");
       	   ArrayList<FileDto> hashList = (ArrayList<FileDto>)session.getAttribute("hashlist");
       	   ArrayList<FileDto> asidehashList = (ArrayList<FileDto>)session.getAttribute("asidehashlist");
       	   ArrayList<ReplyDto> rlist = (ArrayList<ReplyDto>)session.getAttribute("listBoard");
       	   int num_page_size = 5; //한 화면당 보여줄 페이지 수
       	   int totalpage = (int)Math.ceil(totallist.size()/(double) num_page_size);
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/modal.css">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
		crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
        
    <title>메인페이지</title>
        
    <style>
    	.photo__header img {
  		width: 40px;
  		height: 40px;
		}
    
        @media screen and (max-width: 1460px){
            aside{
              display: none;
            }
        }
        aside { 
           left: 70%; 
           position:fixed;
           top: 88px;
           width: 10cm;
        }
		
		.aside{
            font-size: 25px;
            font-family: 'Times New Roman', Times, serif;
            font-style: oblique; 
        }

        #Main {
            margin: 32px auto 0;
            max-width: 935px;
            padding-bottom: 32px;
            width: 100%;
            justify-content: center;
            flex-direction: column;
            overflow:auto;
        }

        #icon {
            float: right;
        }

        #serch {
            width: 80%;
        }



        #section {
            margin-top: 32px;
            border-radius: 3px;
            border: 1px solid rgb(210, 210, 210);
            width: 577px;
			

        }

        header {
            margin: 10px;
            width: 50%;
        }
    </style>
    
    <script>
	    function likeup(i,k){
	    	console.log("likeupdateclick");
			var bno = i;
			var id = k;
			console.log( bno );
			console.log( id );
			console.log(i);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/likeUpdate',
				type: 'post',
				data: {
                    bno: bno,
                    id: id
                },
				success : function(data) {
					console.log("성공");
					likeCount(bno);
				}, 
				error : function() {
					console.log("실패");
				}
			});	

		    }
			// 게시글 추천수
		    function likeCount(i) {
		    	var bno =i;
		    	console.log(bno);
				$.ajax({
					url: "${pageContext.request.contextPath}/likeCount",
	                type: "POST",
	                data: {
	                    bno: bno
	                },
	                success: function(count) {
	                	console.log("성공");
	                	$(".like_count"+i).html("like:" + count);
	                },	                
				})
		    };

    

    </script>
</head>

<body>
    <header>
        <nav class="navigation fixed-top">
              <img src="images/logo.png" />
            <form action="searchAction" method="post">
            <input type="text" name="search" placeholder="Search">
            <button type="submit" class="btn btn-outline-secondary">검색</button>
            </form>
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
    </header>
    
    
    <main id="feed">
    <% for(int i=0;i<board.size();i++) {
    	int sum=0;
    	int gap=0;  %>
        <div id="section">
            <div>
                <header class="photo__header" >
                    <img src="upload/<%out.print(board.get(i).getBname()); %>.jpg" onerror="this.src='http://placehold.it/150x150'" >
                    <span class="photo__username" style="font-size: 20px; text-align: center;" name="username"><%out.print(board.get(i).getBname()); %></span>                 
                </header>
            </div>
            <br>
            <br>
            <div>
                <div id="demo" class="carousel slide container align-center" data-ride="carousel">
                    <div class="carousel-inner">
                        <!-- 슬라이드 쇼 -->
                       <%for(int k=0;k<fileset.size();k++){
                      		if(board.get(i).getBno()==fileset.get(k).getBno()){System.out.println(fileset.get(k).getFilename());
                      			if(gap==0){%>
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="upload/<%out.print(fileset.get(k).getFilename());%>" alt="First slide">
                        </div>
                        <% gap++;
                        sum++;
                        
                        }else{ %>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="upload/<%out.print(fileset.get(k).getFilename());%>" alt="next slide">
                        </div>
                        <%sum++;
                        }}} %> 
                      


                        <!-- / 슬라이드 쇼 끝 -->
                        <!-- 왼쪽 오른쪽 화살표 버튼 -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <!-- <span>Previous</span> -->
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <!-- <span>Next</span> -->
                        </a> <!-- / 화살표 버튼 끝 -->
                        <!-- 인디케이터 -->
                        <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <% if(sum>=2){
                        	for(int j=1;j<sum;j++){%>
                        		<li data-target="#demo" data-slide-to="<%out.print(j);%>"></li>
                        	<%}
                        } %>
                            <!--0번부터시작-->
                            <!-- <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li> -->
                            <!-- <li data-target="#demo" data-slide-to="3"></li> -->
                        </ul> <!-- 인디케이터 끝 -->
                    </div>

                    <ul class="photo__comments">
                        <!-- 메인 글 내용. -->
                    	<li class="photo__comment"><span style="font-size: 20px;"><%out.print(board.get(i).getBcontent()); %></span>
                    	<li class="photo__comment">
                        <%for(int k=0;k<hashList.size();k++){
                        	String hashtag=hashList.get(k).getTagname();
                        	String tag="";
                        	for(int j=1;j<hashtag.length();j++){
                        		tag += hashtag.charAt(j);
                        	}
                      		if(board.get(i).getBno()==hashList.get(k).getBno()){%>
                        <a href="hashtagAction?search=<%=tag%>"><span><%out.print(hashList.get(k).getTagname());%></span></a><%}}%></li>
                         <li class="photo__comment">
						<!-- 댓글 보기 / 쓰기 -->
                         	<form action="coment" method=post>
	                         	<input type="hidden" id="bno" name="bno" value="<%=board.get(i).getBno()%>">
	                         	<button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글 더보기</button>
	                        </form>
                         </li>
                         
                        <!-- 추천 기능(좋아요) -->
                 		    <div>
                    		  <script type="text/javascript">
							  likeCount(<%=board.get(i).getBno()%>)
							  </script>
		                    	<input id="bno_value" type="hidden" value="<%=board.get(i).getBno()%>" >
		                    	<% System.out.println(board.get(i).getBno()); %>
						   		<input id="id_value" type="hidden" value=" <%=board.get(i).getBname()%>" >
		                        <input type="button" class="like_update" value="좋아요" onclick="likeup(<%=board.get(i).getBno()%>,'<%= session.getAttribute("sessionID") %>')"> &nbsp;
								<span class="like_count<%=board.get(i).getBno()%>">like:</span>
		                  	</div>
                         <hr>
                     </ul>
                     
				  		<% for(int r=0; r<rlist.size(); r++) { 
				  			  if(board.get(i).getBno()==rlist.get(r).getBno()){%>
				  	 <ul class="photo__comments">
                         <li class="photo__comment">
                             <span class="photo__comment-author"><b><%out.print( rlist.get(r).getRname()); %></b></span>
                             &nbsp <%out.print(rlist.get(r).getRcontent());%>
                         </li>
                         <% }}%>
                     </ul>
                    <span class="photo__date"><%out.print(board.get(i).getBdate()); %></span>
                    <hr>
                </div>
            </div>
        </div>
        <% } %>
            
                <!-- class="COOzN MnWb5 YT6rB " -->
                <aside id="aside">
                    <div class="photo__header" style="border: 1px solid rgb(210, 210, 210); height: 1.5cm;">
                    
                    <img src="upload/<%out.print(session.getAttribute("sessionID")); %>.jpg" onerror="this.src='http://placehold.it/150x150'" >
                    <span class="photo__username aside" name = "id"><%= session.getAttribute("sessionID") %></span>
                    <a class="btn btn-primary" href="write" role="button" style="float: right;">글쓰기</a>
                    <a class="btn btn-primary" href="LogoutAction" role="button" style="float: right;">로그아웃</a>
                    </div>
                    <br>
                    <div style="border: 1px solid rgb(210, 210, 210); height: 5cm;">
                    <%for(int i=0;i<asidehashList.size();i++){
                    	String hashtag=asidehashList.get(i).getTagname();
                        String tag="";
                    	for(int k=1;k<hashtag.length();k++){
                    		tag += hashtag.charAt(k);
                    	}                  
                    	if(i==(asidehashList.size()-1)){ %>
                        <a href="hashtagAction?search=<%=tag%>"><span><%out.print(asidehashList.get(i).getTagname()); %></span></a>
                        <%}else{%>
                        <a href="hashtagAction?search=<%=tag%>"><span><%out.print(asidehashList.get(i).getTagname()); %></span></a>,
                     <%}}%>
                        
                        
                    </div>
                        
                </aside>
            
            <div>
                <nav id="Main" aria-label="Page navigation example" style="width: 100%;">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        	<%for(int i=1;i<=totalpage;i++){%>
		                        <li class="page-item"><a class="page-link" href="main?page=<%=i%>"><%=i%></a></li>
	                        <%}%>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
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
            <span class="footer__copyright">© 2020</span>
    </footer>

</body>

</html>