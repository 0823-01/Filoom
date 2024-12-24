<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="result-container">
	    <h1>아이디 찾기 결과</h1>
	    <p>회원님의 아이디는 <strong>${userId}</strong> 입니다.</p>
	    <button onclick="location.href='loginForm.me'">로그인 하기</button>
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>