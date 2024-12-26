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
                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>${rev.reviewTitle}</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>
                            	<c:set var="empty-star" value="${5 - rev.score}" />
                            	<c:forEach var="s" begin="1" end="${rev.score}">
                            		★
                            	</c:forEach>
                            	
                            	<c:if test="${empty-star} > 0">
	                            	<c:forEach var="s" begin="1" end="5-${empty-star}">
	                            		☆
	                            	</c:forEach>
                            	</c:if>
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