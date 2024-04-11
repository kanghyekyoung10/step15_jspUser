<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정 화면</title>
<link href="./css/style.css" rel="stylesheet" />
<script type="text/javascript">
    //html 다 읽은 후 실행
	document.addEventListener("DOMContentLoaded", () =>{
        
        //alert("${user.jobTitle}");
        <%--javascript에서도 ${}el 태그 사용 가능 --%>
        console.log("${user.jobTitle}");

        //radio name값으로 추출 -> 배열

        //index 값 필요 없음
        //foreach 화살표 함수 실행
        let radio = document.getElementsByName("jobTitle");
        radio.forEach(element => {
           if(element.value == "${user.jobTitle}"){ //인턴, 사원,.... 값이 같을 때 checked = true 체크
                element.checked = true;
           }

           element.disabled = true;
        });

    });
</script>
</head>
<body>
	<%@ include file="./layout/header.jsp"%>
	<div id="content">

		<h2>회원 정보 수정</h2>
		<form action="update_proc.jsp" method="post">
			아이디 : <input type="text" name="userId" value="${user.userId}"
				readonly> <br> 비밀번호 : <input type="password"
				name="password" value="${user.password}"> <br> 이름 : <input
				type="text" name="name" value="${user.name}" readonly> <br>
			나이 : <input type="number" name="age" value="${user.age}" readonly>
			<br> 이메일 : <input type="email" name="email"
				value="${user.email}"> <br> 직책 : <input type="radio"
				name="jobTitle" value="인턴" />인턴 <input type="radio" name="jobTitle"
				value="사원" />사원 <input type="radio" name="jobTitle" value="대리" />대리
			<input type="radio" name="jobTitle" value="과장" />과장 <input
				type="radio" name="jobTitle" value="차장" />차장 <input type="radio"
				name="jobTitle" value="부장" />부장 <br>
			<button type="submit">수정</button>
		</form>
		</div>
	<%@ include file="./layout/footer.jsp"%>
</body>
</html>