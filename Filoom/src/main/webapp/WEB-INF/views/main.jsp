

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" />	
	
	<div style="border: 3px solid black; height: 500px">
		이곳은 메인페이지 입니다. 
		
		<a href="/filoom/paymentForm.pm?playingNo=1&seatNos=L1-1&seatNos=L2-2"><button>결제하기</button></a>
	
		<a href="/filoom/ResultTest.pm">결제후 화면 테스트</a>
		
		<a href="/filoom/boxoffice.mo">박스오피스 테스트</a>
	</div>
	
	<a href="${ pageContext.request.contextPath }/ad.li">관리자</a>
	
	<jsp:include page="common/footer.jsp" />
</body>
</html>