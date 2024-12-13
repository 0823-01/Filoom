<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
	
	.withdrawal-header {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 30px;
	    border-bottom: 1px solid #333;
	    padding-bottom: 10px;
	}
	
	.withdrawal-title {
	    font-size: 18px;
	}
	
	.withdrawal-content {
	    border: 1px solid #666;
	    margin: 20px 0 0;
	    padding: 24px;
	}
	
	.box:not(.not-margin) {
	    margin-bottom: 40px;
	}
	
	.label {
	    font-size: 16px;
	    font-weight: 600;
	    margin-bottom: 16px;
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	.final-label {
	    font-size: 16px;
	    font-weight: 400;
	    display: flex;
	    align-items: center;
	    gap: 10px;
	}
	
	label {
	    margin: 0 0 3px 0;
	    cursor: pointer;
	}
	
	.text {
	    font-size: 13px;
	}
	
	ul:not(.menu-list) {
	    margin-left: 14px;
	}
	
	ul:not(.not-margin) {
	    margin-bottom: 15px;
	}
	
	li:not(.not-margin) {
	    margin-top: 8px;
	    color: #ffffffd8;
	}
	
	h6 {
	    font-size: 14px;
	    font-weight: bold;
	}
	
	.withdrawal-footer {
	    margin-top: 20px;
	}
	
	.withdrawal-btn-box {
	    /* display: flex; */
	    text-align: center;
	    /* gap: 15px; */
	    padding-top: 40px;
	}
	
	.byebye-btn, .cancel-btn {
	    width: 120px;
	    padding: 10px;
	    border: none;
	    font-size: 14px;
	    /* font-weight: bold; */
	    color: #ffffff;
	    border-radius: 60px;
	    cursor: pointer;
	}
	
	.byebye-btn {
	    background-color: #555555;
	}
	
	.cancel-btn {
	    background-color: #493628;
	    margin-left: 8px;
	}
	
	
	input[type=checkbox] {
	    cursor: pointer;
	    zoom: 1.5;
	}
</style>
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li class="not-margin"><a href="myPage-profile.html">내 정보</a></li>
                <li class="not-margin"><a href="myPage-coupon.html">쿠폰 조회</a></li>
                <li class="not-margin"><a href="myPage-reserve.html">예매 내역 조회</a></li>
                <li class="not-margin"><a href="myPage-history.html">내가 본 영화 조회</a></li>
                <li class="not-margin"><a href="myPage-favorite.html">보고 싶은 영화 조회</a></li>
                <li class="not-margin"><a href="myPage-review.html">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <h1 class="withdrawal-header">회원 탈퇴</h1>
            <div class="withdrawal-body">
                <h4 class="withdrawal-title">회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요.</h4>
                <!-- -------------------------------------- -->
                <div class="withdrawal-content">
                    
                    <div class="box">
                        <div class="label">
                            <input type="checkbox" id="info-check">
                            <label for="info-check">KREAM을 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.</label>
                        </div>
                        <div class="text">
                            <ul>
                                <li>내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시글/댓글), 미사용 보유 포인트 등 사용자의 모든 정보가 사라지며 재가입하더라도 복구가 불가능합니다.</li>
                                <li>탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="box">
                        <div class="label">
                            <input type="checkbox" id="law-check">
                            <label for="law-check">관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.</label>
                        </div>
                        <div class="text">
                            <h6>1. 전자상거래 등 소비자 보호에 관한 법률</h6>
                            <ul>
                                <li>계약 또는 청약철회에 관한 기록: 5년 보관</li>
                                <li>대금결제 및 재화 등의 공급에 관한 기록: 5년 보관</li>
                                <li>소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관</li>
                            </ul>
                            <h6>2. 통신비밀보호법</h6>
                            <ul>
                                <li>접속 로그 기록: 3개월 보관</li>
                            </ul>
                            <h6>3. 내부 기준에 따라 별도 보관</h6>
                            <ul>
                                <li>부정 이용 방지를 위해 이메일(로그인 ID), 전화번호, CI/DI: 3년 보관</li>
                            </ul>
                        </div>
                    </div>

                    <div class="not-margin">
                        <div class="label">
                            <input type="checkbox" id="restriction-check">
                            <label for="restriction-check">KREAM 탈퇴가 제한된 경우에는 아래 내용을 참고하시기 바랍니다.</label>
                        </div>
                        <div class="text">
                            <ul class="not-margin">
                                <li>진행 중인 거래(판매/구매)가 있을 경우: 해당 거래 종료 후 탈퇴 가능</li>
                                <li>진행 중인 입찰(판매/구매)가 있을 경우: 해당 입찰 취소 후 탈퇴 가능</li>
                                <li>미납 수수료(판매 수수료/페널티)가 있을 경우: 해당 결제 완료 후 탈퇴 가능</li>
                                <li>이용 정지 상태인 경우: 이용 정지 해제 후 탈퇴 가능</li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <!-- -------------------------------------- -->
                <div class="withdrawal-footer">
                    <div class="final-label">
                        <input type="checkbox" id="final-check">
                        <label for="final-check">회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</label>
                    </div>
                </div>

                <div class="withdrawal-btn-box">
                    <button type="button" class="byebye-btn" onclick="location.href='byebye.html'">탈퇴하기</button>
                    <button type="button" class="cancel-btn" onclick="location.href='myPage-profile.html'">취소하기</button>
                </div>
                <!-- -------------------------------------- -->
            </div>
        </div>
    </div>
</body>
</html>