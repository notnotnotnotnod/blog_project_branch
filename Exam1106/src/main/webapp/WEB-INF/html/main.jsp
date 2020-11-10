<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>메인페이지</title>
        
    <style>
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
            border: 1px solid black;
            width: 577px;


        }

        header {
            margin: 10px 100px;
            width: 50%;
        }
    </style>
    <script >
    /* alert('${msg}'); */
    </script>
</head>

<body>
    <header>
        <nav class="navigation fixed-top">
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
    </header>
    <main id="feed">
        <div id="section">
            <div>
                <header class="photo__header">
                    <img src="http://placehold.it/150x150" alt="프로필사진">
                    <span class="photo__username">닉네임</span>
                </header>
            </div>
            <div>
                <div id="demo" class="carousel slide container align-center" data-ride="carousel">
                    <div class="carousel-inner">
                        <!-- 슬라이드 쇼 -->
                        <div class="carousel-item active">
                            <!--가로-->
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                                <h5></h5>
                                <p></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="Third slide">
                        </div>


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
                            <!--0번부터시작-->
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                            <!-- <li data-target="#demo" data-slide-to="3"></li> -->
                        </ul> <!-- 인디케이터 끝 -->
                    </div>

                    <div>
                        <a href="#"><span>해쉬태그</span></a>
                        <a href="coment?bno=2"><span>댓글 더보기</span></a>
                        <hr>
                    </div>
                    <ul class="photo__comments">
                        <li class="photo__comment">
                            <span class="photo__comment-author">댓글작성자닉네임</span> 이뻐요!
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">댓글작성자닉네임</span> 이뻐요!
                        </li>
                    </ul>
                    <span class="photo__date">몇 시간 전 작성</span>
                    <hr>
                    <div class="photo__add-comment-container">
                        <textarea placeholder="댓글을 작성하세요.."></textarea>
				<a href="#"><span>go</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="section">
            <div>
                <header class="photo__header">
                    <img src="http://placehold.it/150x150" alt="프로필사진">
                    <span class="photo__username">닉네임</span>
                </header>
            </div>
            <div>
                <div id="demo" class="carousel slide container align-center" data-ride="carousel">
                    <div class="carousel-inner">
                        <!-- 슬라이드 쇼 -->
                        <div class="carousel-item active">
                            <!--가로-->
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                                <h5></h5>
                                <p></p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="http://placehold.it/200x200" alt="Third slide">
                        </div>


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
                            <!--0번부터시작-->
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                            <!-- <li data-target="#demo" data-slide-to="3"></li> -->
                        </ul> <!-- 인디케이터 끝 -->
                    </div>

                    <div>
                        <a href="#"><span>해쉬태그</span></a>
                            <a href="#"><span>댓글 더보기</span></a>
                        <hr>
                    </div>
                    <ul class="photo__comments">
                        <li class="photo__comment">
                            <span class="photo__comment-author">댓글작성자닉네임</span> 이뻐요!
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">댓글작성자닉네임</span> 이뻐요!
                        </li>
                    </ul>
                    <span class="photo__date">몇 시간 전 작성</span>
                    <div class="photo__add-comment-container">
                        <textarea placeholder="댓글을 작성하세요.."></textarea>
                        <i class="fa fa-ellipsis-h"></i>
                    </div>
                </div>
            </div>
        </div>
            
                <!-- class="COOzN MnWb5 YT6rB " -->
                <aside id="aside">
                    <div class="photo__header" style="border: 1px solid black; height: 1.5cm;">
                    <img src="http://placehold.it/150x150" alt="프로필사진">
                    <span class="photo__username aside" name = "id"><%= session.getAttribute("sessionID") %></span>
                    <a class="btn btn-primary" href="write" role="button" style="float: right;">글쓰기</a>
                    </div>
                    <br>
                    <div style="border: 1px solid black; height: 5cm;">
                        <a href="#"><p>Hash tag</p></a>
                        
                    </div>
                        
                </aside>
            
            <div>
                <nav id="Main" aria-label="Page navigation example" style="width: 45%;">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">6</a></li>
                        <li class="page-item"><a class="page-link" href="#">7</a></li>
                        <li class="page-item"><a class="page-link" href="#">8</a></li>
                        <li class="page-item"><a class="page-link" href="#">9</a></li>
                        <li class="page-item"><a class="page-link" href="#">10</a></li>
        
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
            <span class="footer__copyright">© 2017 jejugram</span>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

</body>

</html>