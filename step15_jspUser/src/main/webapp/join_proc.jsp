
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원가입
	
	//0. post 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//1. 입력 정보 추출
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String jobTitle = request.getParameter("jobTitle");
	
	//out.println("jobTitle : " + jobTitle);
	
	
	
	//2.db 연동
	//입력된 정보 dto에 담아서 dao 전달
	UserDTO dto = new UserDTO(userId, name, password, age, email, jobTitle);
							
	
	UserDAO dao = new UserDAO();
	dao.insertUser(dto);
	
	//3. 화면 이동 시 전달 데이터
	request.setAttribute("userId", dto.getUserId());
	
	
	//4. 화면 이동
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("join_output.jsp");
	dispatcher.forward(request, response);
	

%>