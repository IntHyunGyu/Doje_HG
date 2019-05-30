<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/startstyle.css">
<script src="js/registPopup.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body style="background-image: url(img/bg.jpg)">
	<div class="container">
		<form id="login" method="post" action="/user/login">
			<h1 class="h3 mb-3 font-weight-normal">주차 관리</h1>
			<input type="email" name="id" id="inputEmail" class="form-control" placeholder="id" required autofocus>
			<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block mt-1" id="loginBtn" type="submit">로그인</button>
			<span>아직 회원이 아니신가요 ? <a href="" onclick="registPopUp()">회원가입</a></span><br>
		</form>
	</div>
</body>
</html>