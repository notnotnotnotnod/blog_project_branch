<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>자주하는질문!</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    rel="stylesheet">
  <link rel="shortcut icon" href="images/favicon.ico">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
  <nav class="navigation">
    <a href="feed.html">
      <a href="login"><img src="images/logo.png" alt="loginLogo"></a>
    </a>
    <input type="text" placeholder="Search">
    <div class="navigation__links">
      <a href="explore.html" class="navigation__link">
          <i class="fa fa-compass"></i>
      </a>
      <a href="#" class="navigation__link">
          <i class="fa fa-heart-o"></i>
      </a>
      <a href="profile.html" class="navigation__link">
          <i class="fa fa-user-o"></i>
      </a>
    </div>
  </nav>


  <main id="edit-profile">
    <div class="edit-profile__container u-default-box">
      <br>
      <br>
      <table class="table">
        <thead>
          <tr>
            <th>no</th>
            <th>등록일</th>
            <th>제  목</th>
            <th>글쓴이</th>
            <th>수정</th>
          </tr>
          </thead>
          <tbody>
            <tr>
              <td>01</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문1!!!!!!!!!!!!!!!!!!!!!!!!!!</td>
              <td>admin</td>
              <td>-</td>
            </tr>
            <tr>
              <td>02</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문2!!!!!!!!!!!!!!!!!!!!!!!!!!</td>
              <td>admin</td>
              <td>-</td>
            </tr>
            <tr>
              <td>03</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문3!!!!!!!!!!!!!!!!!!!!!!</td>
              <td>admin</td>
              <td>-</td>
            </tr>
            <tr>
              <td>04</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문4</td>
              <td>admin</td>
              <td>-</td>
            </tr>
            <tr>
              <td>05</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문5</td>
              <td>admin</td>
              <td>-</td>
            </tr>
            <tr>
              <td>06</td>
              <td>2020-11-01</td>
              <td>자주 하는 질문6</td>
              <td>admin</td>
              <td>-</td>
            </tr>
          </tbody>
      </table>
      
      <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">페이지</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>

                </li>

                <div class="btn-group " style="float: right;" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary">글쓰기</button>
                    <button type="button" class="btn btn-secondary">수정</button>
                    <button type="button" class="btn btn-secondary">삭제</button>
                </div>
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
    <span class="footer__copyright">© 2020 EZENTRUM</span>
  </footer>
  
  <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
    