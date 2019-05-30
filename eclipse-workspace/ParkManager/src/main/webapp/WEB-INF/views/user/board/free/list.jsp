<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
	min-height: calc(80vh - 205px);
}
h2 {
	text-align: center;
}
</style>
</head>
<body>
<%@include file="../../../header/header.jsp" %>
<h2>커뮤니티</h2> 
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
	<%@include file="../../../footer/footer.jsp" %>
</body>
</html>
