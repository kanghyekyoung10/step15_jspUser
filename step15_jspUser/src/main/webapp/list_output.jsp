<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%--
	//main.jsp ->  list_proc.jsp -> list.jsp
	//list_proc.jsp 조회정보(request) ->  추출해서 화면에서 보여주기
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록 조회 화면</title>
<link href="./css/style.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="./layout/header.jsp"%>
	<div id="content">
<%--
${list}
${list[0].userId}
 --%>
<%-- jstl 반복문 <c:forEach> --%> 
<%--
<c:forEach items="${list}" var="user" varStatus="status">
	${user.userId}<br>
</c:forEach>
 --%>
<h2>전체 회원 목록</h2>
<%--
<table border="1">
<tr>
	<td>${list[0].userId}</td>
</tr>
<tr>
	<td>${list[0].name}</td>
</tr>
</table>
 --%>
<table border="1" align="center" >
<tr>
	<td>번호</td>
	<td>ID</td>
	<td>이름</td>
	<td>이메일</td>
	<td>가입일자</td>
</tr>
<c:forEach items="${list}" var="user" varStatus="status">
<tr>
	<td>${status.count}</td>
	<td>${user.userId}</td>
	<td>${user.name}</td>
	<td>${user.email}</td>
	<td>${user.joinDate}</td>
</tr>
</c:forEach>
</table>
</div>
	<%@ include file="./layout/footer.jsp"%>

</body>
</html>