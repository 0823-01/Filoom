<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
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
	    width: 60%;
	    padding: 10px;
	}
	
	.profile-header {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 30px;
	    border-bottom: 1px solid #333;
	    padding-bottom: 10px;
	}
	
	/* 정보 리스트 */
	.info-list {
	    display: flex;
	    flex-direction: column;
	    gap: 20px;
	}
	
	.info-item {
	    /* display: flex; */
	    align-items: center;
	    border-bottom: 1px solid #333;
	    /* padding: 10px 0; */
	}
	
	.label {
	    font-size: 14px;
	    font-weight: bold;
	    color: #fff;
	    border-left: 2px solid #666;
	    padding-left: 10px;
	}
	
	.value-btn {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    flex: 1; /* 남은 공간을 차지 */
	}
	
	.value-btn {
	    display: flex;
	    justify-content: space-between;
	}
	
	.value, .value-notChange {
	    font-size: 16px;
	    font-weight: 400;
	    margin: 15px 0;
	    padding-left: 10px;
	}
	
	.value-notChange {
	    color: #888;
	}
	
	.btn-change {
	    padding: 5px 10px;
	    background-color: transparent;
	    border: 1px solid rgba(228, 224, 225, 20%);
	    border-radius: 10px;
	    color: #fff;
	    cursor: pointer;
	    font-size: 14px;
	    transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
	}
	
	.btn-change:hover {
	    background-color: #999999;
	    color: #000;
	}
	
	/* 모달 스타일 */
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
	
	/* 토글스위치 */
	/* The switch - the box around the slider */
	.switch {
	    position: relative;
	    display: inline-block;
	    width: 40px;
	    height: 22px;
	    vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	    position: absolute;
	    cursor: pointer;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    background-color: #939393;
	    -webkit-transition: .4s;
	    transition: .4s;
	}
	
	.slider:before {
	    position: absolute;
	    content: "";
	    height: 18px;
	    width: 18px;
	    left: 2px;
	    bottom: 2px;
	    background-color: white;
	    -webkit-transition: .4s;
	    transition: .4s;
	}
	
	input:checked + .slider {
	    background-color: #67503F;
	}
	
	input:focus + .slider {
	    box-shadow: 0 0 1px #67503F;
	}
	
	input:checked + .slider:before {
	    -webkit-transform: translateX(18px);
	    -ms-transform: translateX(18px);
	    transform: translateX(18px);
	}
	
	/* Rounded sliders */
	.slider.round {
	    border-radius: 34px;
	}
	
	.slider.round:before {
	    border-radius: 50%;
	}
</style>
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li class="active"><a href="myPage-profile.html">내 정보</a></li>
                <li><a href="myPage-coupon.html">쿠폰 조회</a></li>
                <li><a href="myPage-reserve.html">예매 내역 조회</a></li>
                <li><a href="myPage-history.html">내가 본 영화 조회</a></li>
                <li><a href="myPage-favorite.html">보고 싶은 영화 조회</a></li>
                <li><a href="myPage-review.html">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <h1 class="profile-header">내 정보</h1>
            <div class="info-list">
                <div class="info-item">
                    <label class="label">아이디</label>
                    <div class="value-notChange">
                        dahoon0823
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">이메일</label>
                    <div class="value-notChange">
                        dahoon0823@naver.com
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">비밀번호</label>
                    <div class="value-btn">
                        <div class="value">
                            ●●●●●●●●●●
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">이름</label>
                    <div class="value-btn">
                        <div class="value">
                            김다훈
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">성별</label>
                    <div class="value-btn">
                        <div class="value">
                            남성
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">닉네임</label>
                    <div class="value-btn">
                        <div class="value">
                            김청설모
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">생년월일</label>
                    <div class="value-btn">
                        <div class="value">
                            20010823
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">전화번호</label>
                    <div class="value-btn">
                        <div class="value">
                            01023932841
                        </div>
                        <div class="btn-change">
                            변경
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <label class="label">약관동의</label>
                    <div class="value-btn">
                        <div class="value">
                            개인 정보 마케팅 활용 동의
                            <button class="open-modal-btn" data-target="modal">내용 보기</button>
                        </div>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

                <a class="out" href="myPage-withdrawal.html">회원탈퇴</a>

                <!-- 약관 내용 모달 -->
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>마케팅 활용 동의</h2><hr>
                        <p>마케팅 활용에 대한 설명이 여기에 표시됩니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {

            // 약관모달-------------------------------------------------
            $(function () {
                // 모달 열기
                $('.open-modal-btn').click(function () {
                    const targetModal = `#${$(this).data('target')}`;
                    $(targetModal).fadeIn(200); // 모달을 서서히 나타냄
                });

                // 모달 닫기
                $('.close-btn').click(function () {
                    $(this).closest('.modal').fadeOut(100); // 모달을 서서히 사라지게 함
                });

                // 모달 외부 클릭 시 닫기
                $(window).click(function (event) {
                    if ($(event.target).hasClass('modal')) {
                        $(event.target).fadeOut(100);
                    }
                });
            });

            // 마케팅 활용 동의 여부---------------------------------------
            $(function () {

                $('.switch input[type="checkbox"]').change(function () {

                    if ($(this).is(':checked')) {

                        console.log('체크박스 활성화 (동의)');
                        
                    } else {

                        console.log('체크박스 비활성화 (비동의)');
                    }
                });
            });
        });
    </script>
</body>
</html>