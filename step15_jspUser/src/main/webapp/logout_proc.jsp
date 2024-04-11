<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	로그아웃 처리
	//1. 입력 정보 추출
	//2.db 연동
	//3. 화면 이동
--%>
<%

	session.removeAttribute("user");
	
	//세션 삭제
	session.invalidate();
	
	response.sendRedirect("main.jsp");

%>