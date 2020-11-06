<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>로그인</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <script>
    /* alert('${msg}'); */
    </script>
</head>
<body>
  <main id="login">

      <div class="login__column">
        <div class="login__box">
          <img src="images/logo.png" alt="loginLogo">
          <form action="MemberLoginAction" method="post" class="login__form">
            <input type="text" name="id" placeholder="Id" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
          </form>
          <span class="login__divider">
            or
          </span>
          <a href="findId" class="login__small-link">아이디찾기</a>
          <br>
          <a href="findPw" class="login__small-link">비밀번호찾기</a>
        </div>
        <div class="login__box">
          <span class="login__text">
            계정이없으신가요? <br />
          </span>
          &nbsp;
          <a class="login__blue-link" href="join">회원가입</a>
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
