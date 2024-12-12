<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 조회</title>
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
	    width: 70%;
	    padding: 10px;
	}
	
	.header-register {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 30px;
	    border-bottom: 1px solid #333;
	    padding-bottom: 10px;
	}
	
	.coupon-header {
	    font-size: 24px;
	    font-weight: bold;
	}
	
	.register-btn {
	    padding: 5px 10px;
	    background-color: #493628;
	    color: #ffffff;
	    border: none;
	    border-radius: 5px;
	    cursor: pointer;
	    font-size: 12px;
	    font-weight: 600;
	}
	
	/* 쿠폰 리스트 */
	/* .coupon-list {
	    display: flex;
	    flex-direction: column;
	} */
	/* 최근 발급받은 쿠폰이 상단에 표시 될 지, 유효기간에 임박한쿠폰이 상단에 표시 될 지 고민 중. 최근에 발급받은 쿠폰의 유효기간이 더 길다는 점때무네.  */
	
	.coupon-item {
	    margin-bottom: 30px;
	    /* border-radius: 10px;
	    background: linear-gradient(145deg, #fff8dc, #a39e95);
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
	    opacity: 90%; */
	}
	
	.coupon-body {
	    padding: 20px 30px 30px 30px;
	    /* border-top: 1px solid #F1F1E5;
	    border-left: 1px solid #F1F1E5;
	    border-right: 1px solid #F1F1E5; */
	    border-radius: 10px;
	    background: linear-gradient(145deg, #fff8dc, #a39e95);
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
	    opacity: 90%;
	}
	
	.coupon-footer {
	    display: flex;
	    padding: 10px 30px;
	    line-height: 30px;
	    gap: 15px;
	    /* border-bottom: 1px solid #F1F1E5;
	    border-left: 1px solid #F1F1E5;
	    border-right: 1px solid #F1F1E5; */
	    border-radius: 10px;
	    background: linear-gradient(145deg, #fff8dc, #a39e95);
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
	    opacity: 90%;
	}
	
	.coupon-title {
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 6px;
	    color: rgb(34, 34, 34);;
	}
	
	.coupon-detail {
	    font-size: 14px;
	    font-weight: bold;
	    margin-bottom: 16px;
	    color: rgb(34, 34, 34);;
	}
	
	.coupon-caution {
	    font-size: 12px;
	    font-weight: 400;
	    color: rgba(34, 34, 34, .8);
	}
	
	hr {
	    border-width: 1px 0 0 0;
	    border-style: dashed;
	    border-color: #999;
	    margin: 0 10px;
	}
	
	.count-day {
	    color: #F15746;
	    font-size: 13px;
	    font-weight: bold;
	}
	
	.d-day {
	    font-size: 13px;
	    font-weight: 400;
	    color: rgba(34, 34, 34, .8);;
	}
	
	
	/* 쿠폰등록 모달 스타일 */
	.modal {
	    display: none; /* 기본적으로 숨김 */
	    position: fixed;
	    z-index: 1000;
	    left:50%;
	    top: 50%;
	    width: 100%;
	    height: 100%;
	    transform: translate(-50%, -50%);
	    background-color: rgba(0, 0, 0, 0.6);
	    max-width: 1100px;
	}
	
	/* 모달 내용 */
	.modal-content {
	    background-color: #fff;
	    color: #000;
	    margin: 15% auto;
	    padding: 20px;
	    border-radius: 10px;
	    width: 60%;
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	    position: relative;
	}
	
	/* 닫기 버튼 */
	.close-btn {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	    cursor: pointer;
	}
	
	.close-btn:hover {
	    color: #000;
	}
	
	/* 자세히 보기 버튼 */
	.open-modal-btn, .out {
	    background: none;
	    border: none;
	    border-bottom: 1px solid #aaa;
	    color: #aaa;
	    cursor: pointer;
	    font-size: 12px;
	    margin-left: 5px;
	}
	
	.out {
	    margin-top: 70px;
	    width: 48px;
	    text-decoration: none;
	}
	
	.open-modal-btn:hover, .out:hover {
	    color: #fff;
	}
</style>
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li><a href="myPage-profile.html">내 정보</a></li>
                <li class="active"><a href="myPage-coupon.html">쿠폰 조회</a></li>
                <li><a href="myPage-reserve.html">예매 내역 조회</a></li>
                <li><a href="myPage-history.html">내가 본 영화 조회</a></li>
                <li><a href="myPage-favorite.html">보고 싶은 영화 조회</a></li>
                <li><a href="myPage-review.html">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <div class="header-register">
                <h1 class="coupon-header">내 쿠폰</h1>
                <button class="register-btn">+ 쿠폰 등록하기</button>
            </div>
            <div class="coupon-list">

                <div class="coupon-item">
                    <div class="coupon-body">
                        <h3 class="coupon-title">[Filoom] 회원가입 기념 환영 쿠폰</h3>
                        <p class="coupon-detail">회원가입 기념 무료 영화 관람권</p>
                        <li class="coupon-caution">쿠폰 1매당 1인 적용 가능</li>
                        <li class="coupon-caution">평일/주말/공휴일 모두 가능</li>
                        <li class="coupon-caution">일부 상영관 제외</li>
                    </div>
                    <hr>
                    <div class="coupon-footer">
                        <span class="count-day">D-3</span>
                        <p class="d-day">24/12/09 00:00:00 까지</p>
                    </div>
                </div>

                <div class="coupon-item">
                    <div class="coupon-body">
                        <h3 class="coupon-title">[Filoom] 1주년 기념 쿠폰</h3>
                        <p class="coupon-detail">1주년 기념 무료 영화 관람권</p>
                        <li class="coupon-caution">쿠폰 1매당 1인 적용 가능</li>
                        <li class="coupon-caution">평일/주말/공휴일 모두 가능</li>
                        <li class="coupon-caution">일부 상영관 제외</li>
                    </div>
                    <hr>
                    <div class="coupon-footer">
                        <p class="count-day">D-4</p>
                        <p class="d-day">24/12/10 00:00:00 까지</p>
                    </div>
                </div>

                <div class="coupon-item">
                    <div class="coupon-body">
                        <h3 class="coupon-title">[Filoom] 회원가입 기념 환영 쿠폰</h3>
                        <p class="coupon-detail">회원가입 기념 무료 영화 관람권</p>
                        <li class="coupon-caution">쿠폰 1매당 1인 적용 가능</li>
                        <li class="coupon-caution">평일/주말/공휴일 모두 가능</li>
                        <li class="coupon-caution">일부 상영관 제외</li>
                    </div>
                    <hr>
                    <div class="coupon-footer">
                        <span class="count-day">D-3</span>
                        <p class="d-day">24/12/09 00:00:00 까지</p>
                    </div>
                </div>

                <div class="coupon-item">
                    <div class="coupon-body">
                        <h3 class="coupon-title">[Filoom] 1주년 기념 쿠폰</h3>
                        <p class="coupon-detail">1주년 기념 무료 영화 관람권</p>
                        <li class="coupon-caution">쿠폰 1매당 1인 적용 가능</li>
                        <li class="coupon-caution">평일/주말/공휴일 모두 가능</li>
                        <li class="coupon-caution">일부 상영관 제외</li>
                    </div>
                    <hr>
                    <div class="coupon-footer">
                        <p class="count-day">D-4</p>
                        <p class="d-day">24/12/10 00:00:00 까지</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>