<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인한 사용자 삭제 구현 
	//1. 입력 정보 추출
	
	//2. db 연동
	
	//3. 화면 이동 시 전달 데이터
	
	//4. 화면 이동

--%>

<%
	//1. 입력 정보 추출
	//session 정보 추출
	UserDTO dto = (UserDTO)session.getAttribute("user");
	
	//2. db 연동
	UserDAO dao = new UserDAO();
	dao.deleteUser(dto.getUserId());
	
	//3. 화면 이동 시 전달 데이터
	//탈퇴한 사용자 정보
	request.setAttribute("userId", dto.getUserId());
	//session 삭제
	session.removeAttribute("user");
	
	//4. 화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("delete_output.jsp");
	dispatcher.forward(request, response);
	
%>