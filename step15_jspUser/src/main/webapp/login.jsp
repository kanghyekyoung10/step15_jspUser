<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="./css/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="./layout/header.jsp"%>
	<div id="content">
		<h2>로그인</h2>
		<form action="login_proc.jsp" method="post">
			ID:<input type="text" name="userId"> 비밀번호 : <input
				type="password" name="password">
			<button type="submit">로그인</button>

		</form>
	</div>
	<%@ include file="./layout/footer.jsp"%>

</body>
</html>