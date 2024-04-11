<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- 탈퇴한 사용자 정보 출력 페이지 
	1. delete_proc.jsp에서 request userId 값 추출
	2. ${} el 태그 추출해서 표시
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 사용자 정보</title>
<link href="./css/style.css" rel="stylesheet" />
</head>
<body>
<%@ include file="./layout/header.jsp"%>
<div id="content">
<h2>탈퇴 사용자 정보</h2>
<h3>탈퇴한 사용자 Id는 ${userId} 입니다.</h3>
</div>
<%@ include file="./layout/footer.jsp"%>
</body>

</body>
</html>