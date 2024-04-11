<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="./css/style.css" rel="stylesheet" />
</head>
<body>
<%@ include file="./layout/header.jsp"%>
<div id="content">
<h2>회원 가입</h2>
<form action="join_proc.jsp" method="post">
	아이디 : <input type="text" name="userId" > <br>
	비밀번호 : <input type="password" name="password"> <br>
	이름 : <input type="text" name="name">  <br>
	나이 : <input type="number" name="age"> <br>
	이메일 : <input type="email" name="email"> <br>
	직책 : <input type="radio" name="jobTitle" value="인턴"/>인턴
	<input type="radio" name="jobTitle" value="사원" />사원
	<input type="radio" name="jobTitle" value="대리" />대리
	<input type="radio" name="jobTitle" value="과장" />과장
	<input type="radio" name="jobTitle" value="차장" />차장
	<input type="radio" name="jobTitle" value="부장" />부장 <br>
	<button type="submit">회원가입</button>
</form>
	</div>
	<%@ include file="./layout/footer.jsp"%>
</body>
</html>