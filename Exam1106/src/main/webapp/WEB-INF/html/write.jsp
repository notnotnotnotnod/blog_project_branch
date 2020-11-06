<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/modal.css">
  <link rel="stylesheet" href="css/image-upload.css">
  <style>
  </style>
</head>
<body>
	<header>
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
			<form action="/uploadAction" method="post"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td><input id="input_img" type="file" name="filename" multiple="multiple" ></td>
					</tr>
					<tr>
						<td>
							<div class="img_wrap">
								<img id="img" />
							</div>
						</td>
					</tr>
					<tr>
						<td><textarea name="bcontent" placeholder="
							글 내용" cols="30" rows="10" style="width: 268.02px;"></textarea></td>
					</tr>
					<tr>
						<td><input type="text" name="tags" placeholder="#태그" style="height: 70px;"></td>
					</tr>
				</table>
				<input type="submit" value="업로드">
			</form>

			</div>
		</div>
	</div>

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script>
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
  </script>
</body>
</html>