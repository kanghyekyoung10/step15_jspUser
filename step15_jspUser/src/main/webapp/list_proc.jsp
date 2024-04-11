<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	전체 회원정보 조회

	1. 입력 정보 추출
	2. db 연동
	3. 전달 데이터 확인
	4. 화면 이동
--%>

<%
	//1. 입력 정보 추출
	//x
	
	//2. db 연동
	UserDAO dao = new UserDAO();
	List<UserDTO> list = dao.getUserList();
	
	//3. 전달 데이터 확인
	//어디에 저장해서 보낼까?? 페이지 이동시 필요해보임
	request.setAttribute("list", list);
	
	//4. 화면 이동
	RequestDispatcher rd = request.getRequestDispatcher("list_output.jsp");
	rd.forward(request, response);
%>