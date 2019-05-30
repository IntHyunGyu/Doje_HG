<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/css/noticeStyle.css">
	<style type="text/css">
	h2 {
		text-align: center;
	}
	</style>
</head>
<body>
<%@include file="../../../header/header.jsp" %>
	<h2>공지사항</h2>
	<div class="wrap">
		<table class="table table-hover">
			<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회 수</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>졸리다</td>
					<td>안현규</td>
					<td>2018.11.14</td>
					<td>20</td>
				</tr>
				<tr>
					<td>2</td>
					<td>으악</td>
					<td>정태현</td>
					<td>2018.11.14</td>
					<td>17</td>
				</tr>
				<tr>
					<td>3</td>
					<td>으으악</td>
					<td>정태현</td>
					<td>2018.11.14</td>
					<td>4</td>
				</tr>
			</tbody>
		</table>
		<br>
		<button class="btn btn-default" id="write">글쓰기</button>
	</div>
	
</body>
</html>