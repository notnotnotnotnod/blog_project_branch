<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>회원가입</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    	
	<script type="text/javascript">
		// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
		
		function checkValue()
		{
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(document.userInfo.password.value != document.userInfo.checkPassword.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			
			var idChecked = $('#check_hidden').val();
			if( idChecked != "yes") {
				alert("아이디 중복확인을 해주세요.");
				return false;
			}

			var MailChecked = $('#check_hidden1').val();
			if( MailChecked != "yes") {
				alert("메일 중복확인을 해주세요.");
				return false;
			}
		}
		
		function mailCheck() {
			var user_mail = $('#mail').val();
			
			if(!user_mail){
				alert("메일을 입력하세요.");
				return false;
			}
			// ajax 용도 : 화면 갱신(reload,redirect)가 없이
			//            부분화면 갱신(통신)을 js에서 한다.
			//           예)네이버 - 실시간검색어, 실시간날씨
			
			// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
			$.ajax({
				/* url : 'http://localhost:8080/servlet3_LoginJoinDB/IdCheckAction.do?id='+ user_id, */
				url : '${pageContext.request.contextPath}/MailCheckAction?='+ user_mail,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
					
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						alert("메일이 중복됩니다.");
						$('#check_hidden1').val("no");
					} else {
						// 0 : 아이디가 안됨.
						alert("메일을 사용가능합니다.");
						$('#check_hidden1').val("yes");
					}
				}, 
				error : function() {
						console.log("실패");
				}
			});
		}

		function idCheck() {
			var user_id = $('#id').val();
			
			if(!user_id){
				alert("아이디를 입력하세요.");
				alert(user_id);
				return false;
			}
			// ajax 용도 : 화면 갱신(reload,redirect)가 없이
			//            부분화면 갱신(통신)을 js에서 한다.
			//           예)네이버 - 실시간검색어, 실시간날씨
			
			// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
			$.ajax({
				/* url : 'http://localhost:8080/servlet3_LoginJoinDB/IdCheckAction.do?id='+ user_id, */
				url : '${pageContext.request.contextPath}/IdCheckAction?id='+ user_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
					
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						alert("아이디가 중복됩니다.");
						$('#check_hidden').val("no");
					} else {
						// 0 : 아이디가 안됨.
						alert("아이디가 사용가능합니다.");
						$('#check_hidden').val("yes");
					}
				}, 
				error : function() {
						console.log("실패");
				}
			});
		}
		
		
	</script>
</head>
<body>
  <main id="dropout">

      <div class="login__column">
        <div class="login__box">
          <span>회원 가입</span>
          
           <form action="JoinAction" method="post" class="login__form" name="userInfo" onsubmit="return checkValue()">
            
            <input type="text" name="name" placeholder="이름" required>
            <input type="text" name="id" id="id" placeholder="아이디" required>
            <input id="input_userId_check" type="button" value="아이디중복확인" onclick="idCheck()">
            <input id="check_hidden" type="hidden"	value="no" />
            <input type="password" name="password" placeholder="비밀번호" required>
            <input type="password" name="checkPassword" placeholder="비밀번호 확인" required>
            <input type="text" name="mail" id="mail" placeholder="이메일" required>
            <input id="input_userMail_check" type="button" value="이메일중복확인" onclick="mailCheck()">
            <input id="check_hidden1" type="hidden"	value="no" />
            <input type="submit" value="회원가입">
          </form> 
          <span class="login__divider">
            or
          </span>
          <a href="login" class="login__small-link">뒤로가기</a>
        </div>
        <div class="login__box">
          <span class="login__text">
            다른 궁금한 점이 있으신가요? <br />
          </span>
          &nbsp;
          <a class="login__blue-link" href="#">고객센터</a>
        </div>
        <div class="login__t-box">

        </div>
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
    <span class="footer__copyright">© 2020 EZENTRUM</span>
  </footer>
  
  
</body>
</html>
