<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 인코딩
	request.setCharacterEncoding("UTF-8");

	//1. 입력 정보 추출
	String userId =	request.getParameter("userId");
	String password = request.getParameter("password");
	
	//2. db 연동
	UserDAO dao = new UserDAO();
	UserDTO dto =  dao.getUser(userId, password);
	
	//3. 화면 이동할 때 전달할 데이터 확인
	//로그인한 사용자 정보 
	//어떻게 전달해줄까? -> jsp 내장객체 session 
	
	if(dto != null){
		session.setAttribute("user", dto);
		//4.화면 이동
		response.sendRedirect("main.jsp");

	}else{ //id,pw일차한 사용자 없을 경우 다시 login화면으로 이동
		response.sendRedirect("login.jsp");
	}

	
%>