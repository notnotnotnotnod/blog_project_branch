<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="com.study.springboot.dto.BoardDto" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
	<%
	ArrayList<BoardDto> list = (ArrayList<BoardDto>)session.getAttribute("list");
	%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/modal.css">
  <link rel="stylesheet" href="css/image-upload.css">
  
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script>
  function setThumbnail(event) { 
	  for (var image of event.target.files) { 
		  var reader = new FileReader(); 
		  
		  reader.onload = function(event) { 
			  var img = document.createElement("img"); 
		  img.setAttribute("src", event.target.result);
		   document.querySelector("div#image_container").appendChild(img);
		    };
		    
		    console.log(image);
		    reader.readAsDataURL(image);
		  }
      }

  
    var sel_file;
    $(document).ready(function() {
      $('#input_img').on("change", handleImgFileSelect);
    });
    function handleImgFileSelect(e) {
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);
      filesArr.forEach(function(f) {
        if (!f.type.match("image.*")) {
          alert("확장자는 이미지 확장자만 가능합니다.");
          return;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function(e) {
          $('#img').attr('src', e.target.result);
        }
        reader.readAsDataURL(f);
      });
    }
    
    function checkValue(){
    	var bcontent = $('#bcontent').val();
        var image_container = $('#image_container').val();
		
    	if(!bcontent){
			alert("글을 작성 해 주세요.");
			return false;
    	}
    	
    	if(!image_container){
    		alert("사진을 넣어 주세요.");
    		return false;
    	}
    	
    	
    }
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
	<div class="container">
		<div class="box">
			<div class="bigbox">
				<div>
					<img src="images/logo_write.png" alt="x" class="image" >
				</div>
				<br />
				
				<div class="text">
				
					<hr class="hr" />
					사진업로드
					<hr class="hr" />
				</div>
				
			<form action="/uploadAction" method="post" enctype="multipart/form-data" onsubmit="return checkValue()" name="write">
				<table class="table" name="name_table">
					<tr>
					<td>
					<input id="input_img" type="file" name="filename" accept="image/*" onchange="setThumbnail(event);" multiple="multiple" ></td>
					<c:forEach var="dto" items="${list}" >
					<input id="number" name="number" type="hidden"	value="${dto.bno}" />						
					</c:forEach>
					</tr>
					<tr>
						<td>
							<div class="img_wrap" id="image_container"></div>
						</td>
					</tr>
					<tr>
						<td><textarea name="bcontent" placeholder="
						 글 내용" cols="30" rows="10" id="bcontent" style="width: 268.02px;"></textarea></td>
					</tr>
					<tr>
						<td><input type="text" name="tags" placeholder="해쉬태그 (각 태그 사이에 ','로 작성)" style="height: 70px;"></td>
					</tr>
				</table>
				<input type="submit" value="업로드">
			</form>

			</div>
		</div>
	</div>

  
</body>
</html>