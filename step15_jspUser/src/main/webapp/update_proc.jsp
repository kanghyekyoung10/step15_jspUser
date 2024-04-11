<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    update.jsp 비밀번호, 이메일주소 입력 받아 db 업데이트 하기    
	1. 입력 정보 추출
	2. db 연동
	3. 전달 데이터 확인
	4. 화면 이동

--%>

<%

    //0. post 방식 요청 인코딩
    request.setCharacterEncoding("UTF-8");
    
	//1. 입력 정보 추출
	String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
	
    //2. db 연동
  
    
    UserDTO dto = new UserDTO();
    dto.setUserId(userId);
    dto.setPassword(password);
    dto.setEmail(email);
    
    out.println(dto);
    
    UserDAO dao = new UserDAO();
   	dao.updateUser(dto);
   	
   	
	//3. 전달 데이터 확인
	//session에 저장된 user 정보 update
	//동일한 이름으로 생성하면 덮어쓰기 됨
	dto = dao.getUser(dto.getUserId(), dto.getPassword());
	out.println(dto);
	session.setAttribute("user", dto);
	
	//4. 화면 이동
	response.sendRedirect("main.jsp");
%>

