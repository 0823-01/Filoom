<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 본 영화 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	/* 기본 스타일 초기화 */
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	body {
	    font-family: Arial, sans-serif;
	    background-color: #121212;
	    color: #ffffff;
	}
	
	/* 마이페이지 컨테이너 */
	.mypage-container {
	    display: flex;
	    width: 1100px;
	    background-color: #1e1e1e;
	    border-radius: 10px;
	    padding: 50px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	    overflow: hidden;
	    margin: 50px auto;
	}
	
	/* 사이드바 */
	.mypage-sidebar {
	    width: 20%;
	    padding: 10px;
	}
	
	.mypage-sidebar h2 a {
	    color: #fff; /* 흰 글씨 */
	    font-size: 20px; /* 큰 폰트 크기 */
	    font-weight: bold; /* 굵은 폰트 */
	    text-decoration: none; /* 밑줄 제거 */
	    display: block;
	    margin-bottom: 30px; /* 아래 간격 */
	}
	
	.menu-list {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.menu-list li a {
	    color: #aaa; /* 기본 회색 글씨 */
	    font-size: 14px; /* 작은 폰트 크기 */
	    font-weight: normal; /* 얇은 폰트 */
	    text-decoration: none; /* 밑줄 제거 */
	    display: block;
	    padding: 10px 0; /* 상하 간격 */
	    transition: color 0.3s ease;
	}
	
	.menu-list li.active a {
	    color: #fff; /* 흰 글씨 */
	    font-size: 16px; /* 작지만 조금 큰 폰트 크기 */
	    font-weight: bold; /* 굵은 폰트 */
	}
	
	.menu-list li a:hover {
	    color: #ffffff;
	    font-weight: bold;
	}
	
	/* 콘텐츠 영역 */
	.mypage-content {
	    width: 80%;
	    padding: 10px;
	}
	
	.history-header{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    border-bottom: 1px solid #333;
	    margin-bottom: 10px;
	    padding-bottom: 10px;
	}
	
	.history-num {
	    display: flex;
	    justify-content: space-between;
	}
	
	.history-num h1 {
	    font-size: 24px;
	    font-weight: bold;
	}
	
	.history-num span {
	    font-size: 24px;
	    margin-left: 12px;
	    color: #aaa;
	}
	
	.history-list {
	    padding: 10px 20px;
	}
	
	.year-search {
	    margin-right: 10px;
	}
	
	#year-select,
	#year-btn {
	    padding: 4px 10px;
	    border: 1px solid #333;
	    border-radius: 5px;
	    background-color: #2b2b2b;
	    color: #ffffff;
	    font-size: 14px;
	    line-height: 1.5; /* 동일한 라인 높이 */
	    box-sizing: border-box; /* 박스 모델 통일 */
	    cursor: pointer;
	}
	
	#year-btn {
	    cursor: pointer;
	    padding: 2px 15px;
	    background-color: #493628;
	    font-weight: bold;
	}
	
	.history-item {
	    border-bottom: 1px solid #aaa;
	    margin-top: 20px;
	    padding-bottom: 20px;
	}
	
	.box-info {
	    display: flex;
	    gap: 10px; /* 좌우 박스 간 간격 */
	}
	
	.poster {
	    width: 110px;
	    height: 158px;
	    margin-right: 20px;
	}
	
	.history-info,
	.title-delete,
	.history-content ul {
	    overflow: hidden;
	}
	
	.history-info {
	    width: 100%;
	    display: flex;
	    flex-direction: column; /* 상하 배치 */
	    padding: 10px 0;
	}
	
	.title-delete {
	    width: 100%;
	    display: flex;
	    justify-content: space-between;
	    border-bottom: 1px solid #444;
	    padding-bottom: 13px;
	    margin-bottom: 20px;
	}
	
	.movie-title {
	    text-decoration: none;
	    color: #fff;
	    font-size: 22px;
	    font-weight: bold;
	}
	
	.history-delete-btn, .review-plz {
	    background-color: #49362800;
	    color: #aaa;
	    border: none;
	    cursor: pointer;
	    font-size: 12px;
	    text-decoration: none;
	    transition: color 0.3s ease;
	}
	
	.history-delete-btn:hover, .review-plz:hover {
		color: #fff;
	    font-weight: bold;
	}
	
	/* 전체 예약 내용 컨테이너 */
	.history-content {
	    font-size: 14px;
	}
	
	.history-content p {
	    margin-bottom: 10px;
	}
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li><a href="profile.me">내 정보</a></li>
                <li><a href="coupon.me">쿠폰 조회</a></li>
                <li><a href="reserve.me">예매 내역 조회</a></li>
                <li class="active"><a href="history.me">내가 본 영화 조회</a></li>
                <li><a href="favorite.me">보고 싶은 영화 조회</a></li>
                <li><a href="review.me">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <div class="history-header">
                
                <div class="history-num">
                    <h1>내가 본 영화</h1>
                    <span>25건</span>
                </div>

                <div class="year-search">
                    <select name="year" id="year-select">
                        <option value="all">전체</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                    </select>
                    <button type="button" id="year-btn">검색</button>
                </div>
            </div>
            <!-- 예매 내역과 취소 내역을 합친 div -->
            <div class="history-body">
            
                <!-- 예매 내역들만 묶은 div -->
                <div class="history-list">

                    <c:choose>
                    	<c:when test="${empty historyList}">
						    <div class="no-history">
						        관람 내역이 존재하지 않습니다.
						    </div>
						</c:when>
							
	                    <c:otherwise>
							<c:forEach var="history" items="${historyList}">
			                    <!-- 예매 내역 하나의 div -->
			                    <div class="history-item">
			                        <div class="box-info">
			                            <div class="box-image">
			                                <a href="#"><img src="${ pageContext.request.contextPath }/resources/images/posters/${ history.fileCodename }" class="poster"></a>
			                            </div>
			                            <div class="history-info">
			                                <div class="title-delete">
			                                    <div>
			                                        <a href="#" class="movie-title">${ history.movieTitle }</a>
			                                    </div>
			                                    <div><button class="history-delete-btn">기록에서 삭제</button></div>
			                                </div>
			                                <div class="history-content">
			                                    <p>${ history.playtime }</p>
			                                    <p>${ history.screenName }관 / ${ history.totalTickets }명</p>
			                                    <a class="review-plz" href="detail.mo?movieno=${requestScope.firstMovie[0].hisory.movieNo}">이 영화를 평가해주세요</a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
		                    </c:forEach>
	                    </c:otherwise>
					</c:choose>
                    
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp" />

    <script>
        $(function () {
            $("#year-btn").click(function () {
                const selectedYear = $("#year-select").val();
                if (selectedYear !== "all") {
                    console.log(selectedYear);
                    window.location.href = `/myPage-history?year=${selectedYear}`; // 원하는 URL로 이동
                } else {
                    alert("전체를 선택했습니다.");
                }
            });
        });
    </script>

</body>
</html>