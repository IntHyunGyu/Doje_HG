<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
		integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
		crossorigin="anonymous">
	<link rel="stylesheet" href="css/registstyle.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="wrap">
		<form id="registAjax" action="" method="post">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">아이디</label> <input type="email"
						class="form-control" name="id" id="id" placeholder="아이디">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">비밀번호</label> <input type="password"
						class="form-control" name="password" id="passowrd"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-4">
					<label for="inputState">차량 종류</label> <select name="carType"
						id="carType" class="form-control">
						<option selected>선택</option>
						<option>외제차</option>
						<option>국내차</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">차량 번호</label> <input type="text"
					class="form-control" name="carNum" id="carNum" placeholder="차량 번호">
			</div>
			<div class="form-group">
				<label for="inputAddress">이름</label> <input type="text"
					class="form-control" name="name" id="name" placeholder="이름">
			</div>
			<div class="form-group">
				<label for="inputAddress2">전화번호</label> <input type="text"
					class="form-control" name="Phone" id="Phone"
					placeholder="01012345678">
			</div>
			<button type="button" id="ajaxBtn" class="btn btn-primary">회원가입</button>
			<button class="btn btn-primary" onclick="self.close()">취소</button>
		</form>
	</div>
</body>
<script>
	$(document).on("click", "#ajaxBtn",  function() {		
	    $.ajax({
	        type: "POST",
	        url: "/user/regist",
	        data: $('#registAjax').serialize(),
	        dataType : "json",
	        error: function(alertMsg) {
	        	alert(alertMsg);
	        	window.location.reload();
	        },
	        success: function() {
	        	alert(asdf);
	            alert(가입성공!);
	        }
	    });
	    return false;
	});
	</script>
</html>