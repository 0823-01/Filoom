<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<input type="hidden" id="first" value="${requestScope.pi.startPage}">
			<input type="hidden" id="last" value="${requestScope.pi.endPage}">
			<input type="hidden" id="MX" value="${requestScope.pi.maxPage}">
			
            <c:forEach var="rev" items="${list}">
            	<div id="review">
                	<!-- full id = 'tenletterstunman' -->
                    <div id="reviewerName" style="float:left;">${rev.userId}</div>
                    <div id="writtenDate" style="float:right;">${rev.reviewDate}</div><br>
					<label style='display:none;'>${rev.isWatched}</label>
					<label style='display:none;'>${rev.reviewId}</label>
                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>${rev.reviewTitle}</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>
                            	<c:set var="emptyStar" value="${5 - rev.score}" />
                            	<c:forEach var="s" begin="1" end="${rev.score}">
                            		★
                            	</c:forEach>
                            	
                            	<c:forEach var="s" begin="1" end="${emptyStar}">
                            		☆
                            	</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>${rev.reviewContent}</td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
            
            
</body>
</html>