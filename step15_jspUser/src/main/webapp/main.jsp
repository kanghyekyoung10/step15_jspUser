<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
1. main 화면
<a href="login.jsp">로그인</a>
<a href="join.jsp">회원가입</a>
<a href="list.jsp">전체 회원 조회</a>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link href="./css/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="./layout/header.jsp"%>
	<div id="content">
	<h2>회원 관리</h2>
	<c:choose>
		<c:when test="${empty user}">
			<h3>
				<a href="login.jsp">로그인</a>
			</h3>
			<h3>
				<a href="join.jsp">회원가입</a>
			</h3>
		</c:when>
		<c:otherwise>
			<%-- ${sessionScope.user} --%>
			<%-- jsp 내장객체에 저장했을 경우, el태그 변수명으로 추출가능 --%>
			<h2>${user.name}(${user.jobTitle})님이 로그인하였습니다.</h2>
			<h3>
				<a href="list_proc.jsp">전체 회원 조회</a>
			</h3>
			<h3>
				<a href="update.jsp">내정보 수정</a>
			</h3>
			<h3>
				<a href="delete_proc.jsp">탈퇴</a>
			</h3>
			<h3>
				<a href="logout_proc.jsp">로그아웃</a>
			</h3>
		</c:otherwise>
	</c:choose>
	</div>
	<%@ include file="./layout/footer.jsp"%>

</body>
</html>