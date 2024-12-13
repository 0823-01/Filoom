<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보고싶은 영화 조회</title>
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
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: auto;
	}
	
	/* 마이페이지 컨테이너 */
	.mypage-container {
	    display: flex;
	    width: 100%;
	    max-width: 1100px;
	    background-color: #1e1e1e;
	    border-radius: 10px;
	    padding: 50px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	    overflow: hidden;
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
	
	.favorite-header{
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    border-bottom: 1px solid #333;
	    margin-bottom: 10px;
	    padding-bottom: 10px;
	}
	
	.favorite-num {
	    display: flex;
	    justify-content: space-between;
	}
	
	.favorite-num h1 {
	    font-size: 24px;
	    font-weight: bold;
	}
	
	.favorite-num span {
	    font-size: 24px;
	    margin-left: 12px;
	    color: #aaa;
	}
	
	.favorite-list {
	    padding: 10px 20px;
	    margin-top: 30px;
	    display: grid; /* flex 대신 grid를 사용 */
	    grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개 */
	    gap: 50px; /* 요소 간의 간격 */
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
	/* 
	.favorite-item {
	    margin-bottom: 30px;
	} */
	
	.box-image {
	    margin-bottom: 14px;
	    padding: 6px;
	    /* background-color: white; */
	}
	
	
	.poster {
	    width: 185px;
	    height: 261px;
	}
	
	.movie-title {
	    text-decoration: none;
	    color: #fff;
	    font-size: 20px;
	    font-weight: bold;
	}
	
	.release-date {
	    font-size: 12px;
	    color: #aaa;
	}
	
	.reserve-btn {
	    margin-top: 10px;
	    padding: 2px 5px;
	    border: 1px solid #333;
	    border-radius: 5px;
	    background-color: #493628;
	    color: #ffffff;
	    font-size: 12px;
	    line-height: 1.5; /* 동일한 라인 높이 */
	    box-sizing: border-box; /* 박스 모델 통일 */
	    cursor: pointer;
	}
	
	.delete-btn {
	    margin-left: 10px;
	    background-color: #49362800;
	    color: #aaa;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size: 12px;
	    font-weight: 600;
	}
</style>
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li><a href="myPage-profile.html">내 정보</a></li>
                <li><a href="myPage-coupon.html">쿠폰 조회</a></li>
                <li><a href="myPage-reserve.html">예매 내역 조회</a></li>
                <li><a href="myPage-history.html">내가 본 영화 조회</a></li>
                <li class="active"><a href="myPage-favorite.html">보고 싶은 영화 조회</a></li>
                <li><a href="myPage-review.html">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <div class="favorite-header">
                
                <div class="favorite-num">
                    <h1>보고싶은 영화</h1>
                    <span>5건</span>
                </div>

                <div class="year-search">
                    <select name="year" id="year-select">
                        <option value="1">등록일 순</option>
                        <option value="2">개봉일 순</option>
                    </select>
                    <button type="button" id="year-btn">검색</button>
                </div>
            </div>
            <!-- 예매 내역과 취소 내역을 합친 div -->
            <div class="favorite-body">
            
                <!-- 예매 내역들만 묶은 div -->
                <div class="favorite-list">

                    <div class="favorite-item">
                        <div class="box-image">
                            <a href="#"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88920/88920_185.jpg" class="poster"></a>
                        </div>
                        <div class="box-content">
                            <div>
                                <a href="#" class="movie-title">히든페이스</a>
                                <p class="release-date">2024.11.20 개봉</p>
                                <div class="reserve-delete">
                                    <button class="reserve-btn">예매하기</button>
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="favorite-item">
                        <div class="box-image">
                            <a href="#"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000077/77372/77372_185.jpg" class="poster"></a>
                        </div>
                        <div class="box-content">
                            <div>
                                <a href="#" class="movie-title">인터스텔라</a>
                                <p class="release-date">2024.11.20 개봉</p>
                                <div class="reserve-delete">
                                    <button class="reserve-btn">예매하기</button>
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="favorite-item">
                        <div class="box-image">
                            <a href="#"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88797/88797_185.jpg" class="poster"></a>
                        </div>
                        <div class="box-content">
                            <div>
                                <a href="#" class="movie-title">하얼빈</a>
                                <p class="release-date">2024.11.20 개봉</p>
                                <div class="reserve-delete">
                                    <button class="reserve-btn">예매하기</button>
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="favorite-item">
                        <div class="box-image">
                            <a href="#"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88992/88992_185.jpg" class="poster"></a>
                        </div>
                        <div class="box-content">
                            <div>
                                <a href="#" class="movie-title">소방관</a>
                                <p class="release-date">2024.11.20 개봉</p>
                                <div class="reserve-delete">
                                    <button class="reserve-btn">예매하기</button>
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="favorite-item">
                        <div class="box-image">
                            <a href="#"><img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88076/88076_185.jpg" class="poster"></a>
                        </div>
                        <div class="box-content">
                            <div>
                                <a href="#" class="movie-title">위키드</a>
                                <p class="release-date">2024.11.20 개봉</p>
                                <div class="reserve-delete">
                                    <button class="reserve-btn">예매하기</button>
                                    <button class="delete-btn">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>