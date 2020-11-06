<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.study.springboot.dao.IMemberDao" %>    
<%@ page import="com.study.springboot.dto.MemberDto" %>
<%
	// mypage에서 넘긴 회원정보를 추출한다.
	MemberDto member = (MemberDto)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>마이페이지</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
  <link rel="shortcut icon" href="images/favicon.ico">
  <link rel="stylesheet" href="css/styles.css">
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
    function checkValue()
	{
    	// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if(document.userInfo.password.value != document.userInfo.checkPassword.value ){
			
			alert("비밀번호를 동일하게 입력하세요.");
			alert("메인화면으로 돌아갑니다.!!");
			return false;
		}

	}
	</script>
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
      
  <main id="edit-profile">
    <div class="edit-profile__container u-default-box">
      
      <header class="edit-profile__header">
        <div class="fucker-container">
          <img src="images/avatar.jpg" />
        </div>
        <!-- master comments -->
        <h1 class="edit-profile__username"><%=member.getName() %></h1>
      </header>

      <form class="edit-profile__form" action="membermodify" method="post" onsubmit="checkValue()" name="userInfo">
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="name">Name</label>
          <input id="name" name="name" type="text" value="<%=member.getName() %>">
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="username">Username</label>
          <input id="id" name="id" type="text" value="<%=member.getId() %>">
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="password">Password</label>
          <input type="password" name="password" placeholder="Password" required>
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="password"></label>
          <input type="password" name="checkPassword" placeholder="Check password" required>
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="email">Email</label>
          <input id="mail" name="mail" type="email" value="<%=member.getMail() %>">
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="phone-number">Phone Number</label>
          <input id="phone" name="phone" type="text" value="<%=member.getPhone() %>">
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="gender">Gender</label>
          <select  id="gender" name="gender" >
            <option value="male">Male</option>
            <option value="female">Female</option>
          </select>
        </div>
        <div class="edit-profile__row">
          <label class="edit-profile__label" for="bio">Bio</label>
          <textarea id="bio" name="bio" ><%=member.getBio() %></textarea>
        </div>
        <div class="edit-profile__row">
          <span></span>
          <input type="submit" value="정보수정하기">
        </div>
      </form>

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
    <span class="footer__copyright">© 2017 jejugram</span>
  </footer>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="js/app.js"></script>
</body>
</html>