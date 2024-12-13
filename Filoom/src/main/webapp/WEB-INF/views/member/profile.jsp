<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	.alert {
		margin-left: 10px;
		font-size: 12px;
		color: rgb(255, 255, 0);
		display: none;
	}

	.button-area {
		text-align: center;
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
	
	/* 약관 모달 스타일 */
	.agreement-modal {
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
	.agreement-modal-content {
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

	.changes-btn {
        background-color: #493628;
        margin-top: 50px;
		width: 50%;
        padding: 10px;
        border: none;
        font-size: 16px;
        font-weight: bold;
        color: #ffffff;
        border-radius: 60px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

	.changes-btn:hover {
        background-color: #fff; /* 배경을 흰색으로 변경 */
        color: #000; /* 글씨 색을 검정색으로 변경 */
    }

/* ----------------------------- */
	
	/* 모달 전체 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6); /* 반투명 배경 */
    justify-content: center;
    align-items: center;
}

/* 모달 컨텐츠 */
.modal-content {
    background: #fff;
    border-radius: 8px;
    padding: 20px;
    width: 400px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    position: relative;
    text-align: center;
}

/* 모달 닫기 버튼 */
.modal-content .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    font-weight: bold;
    color: #333;
    cursor: pointer;
}

/* 제목 스타일 */
.modal-content h2 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #444;
}

/* 폼 그룹 */
.form-group {
    margin-bottom: 20px;
    text-align: left;
}

/* 라벨 */
.form-group label {
    font-size: 14px;
    font-weight: 600;
    color: #555;
    display: block;
    margin-bottom: 5px;
}

/* 입력 필드 */
.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.form-group input:focus {
    border-color: #007bff;
    outline: none;
}

/* 안내 텍스트 */
.form-group .info-text {
    font-size: 12px;
    color: #888;
    margin-top: 5px;
    display: block;
}

/* 버튼 그룹 */
.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

/* 버튼 스타일 */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

/* 기본 버튼 스타일 */
.btn-primary {
    background: #007bff;
    color: #fff;
}

.btn-primary:hover {
    background: #0056b3;
}

.btn-secondary {
    background: #ccc;
    color: #333;
}

.btn-secondary:hover {
    background: #bbb;
}
	


</style>
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-sidebar">
            <h2><a href="myPage.me">마이 페이지</a></h2>
            <ul class="menu-list">
                <li class="active"><a href="profile.me">내 정보</a></li>
                <li><a href="coupon.me">쿠폰 조회</a></li>
                <li><a href="reserve.me">예매 내역 조회</a></li>
                <li><a href="history.me">내가 본 영화 조회</a></li>
                <li><a href="favorite.me">보고 싶은 영화 조회</a></li>
                <li><a href="review.me">내가 쓴 리뷰 조회</a></li>
            </ul>
        </div>
        <div class="mypage-content">
            <h1 class="profile-header">내 정보</h1>
            <div class="info-list">

                <div class="info-item">
                    <label class="label">아이디</label>
                    <div class="value-notChange">
                        ${ sessionScope.loginUser.userId }
                    </div>
                </div>

                <div class="info-item">
                    <label class="label">이메일</label>
                    <div class="value-notChange">
                        ${ sessionScope.loginUser.email }
                    </div>
                </div>

                <div class="info-item">
                    <label class="label">비밀번호</label><apan class="alert">수정하기를 눌러주세요.</apan>
                    <div class="value-btn">
                        <div class="value">
                            ●●●●●●●●●●
                        </div>
                        <button type="button" class="btn-change" onclick="showChangePasswordModal()">
                            변경
                        </button>
                    </div>
                </div>

				<!-- 비밀번호 변경 모달창 -->
				<!-- 비밀번호 변경 모달창 -->
				<div id="changePasswordModal" class="modal">
				    <div class="modal-content">
				        <span class="close" onclick="closeChangePasswordModal()">&times;</span>
				        <h2>비밀번호 변경</h2>
				        <form>
				            <div class="form-group">
				                <label for="currentPassword">기존 비밀번호</label>
				                <input type="password" id="currentPassword" placeholder="기존 비밀번호를 입력해주세요">
				            </div>
				            <div class="form-group">
				                <label for="newPassword">새 비밀번호</label>
				                <input type="password" id="newPassword" placeholder="새 비밀번호를 입력해주세요">
				                <small class="info-text">* 영문, 숫자, 특수기호 포함 10자 이상</small>
				            </div>
				            <div class="form-group">
				                <label for="confirmNewPassword">새 비밀번호 확인</label>
				                <input type="password" id="confirmNewPassword" placeholder="새 비밀번호를 다시 입력해주세요">
				            </div>
				            <div class="button-group">
				                <button type="button" onclick="changePassword()" class="btn btn-primary">완료</button>
				                <button type="button" onclick="closeChangePasswordModal()" class="btn btn-secondary">취소</button>
				            </div>
				        </form>
				    </div>
				</div>




                <div class="info-item">
                    <label class="label">이름</label><apan class="alert">수정하기를 눌러주세요.</apan>
                    <div class="value-btn">
                        <div class="value">
                            ${ sessionScope.loginUser.userName }
                        </div>
                        <button class="btn-change" data-target="name-modal">
                            변경
                        </button>
                    </div>
                </div>

                <div class="info-item">
                    <label class="label">성별</label><apan class="alert">수정하기를 눌러주세요.</apan>
                    <div class="value-btn">
                        <div class="value">
                            <c:choose>
		                        <c:when test="${empty sessionScope.loginUser.gender}">
		                            선택 안함
		                        </c:when>
		                        <c:when test="${sessionScope.loginUser.gender == 'M'}">
		                            남성
		                        </c:when>
		                        <c:when test="${sessionScope.loginUser.gender == 'F'}">
		                            여성
	                        </c:when>
                    </c:choose>
                        </div>
                        <button class="btn-change" data-target="gender-modal">
                            변경
                        </button>
                    </div>
                </div>
                
                <div class="info-item">
                    <label class="label">생년월일</label><apan class="alert">수정하기를 눌러주세요.</apan>
                    <div class="value-btn">
                        <div class="value">
                            <c:set var="birth" value="${sessionScope.loginUser.birth}" />
				            <c:if test="${not empty birth}">
				                ${birth.substring(0, 4)}년 ${birth.substring(4, 6)}월 ${birth.substring(6, 8)}일
				            </c:if>
                        </div>
                        <button class="btn-change" data-target="birth-modal">
                            변경
                        </button>
                    </div>
                </div>
                
                <div class="info-item">
                    <label class="label">약관동의</label><apan class="alert">수정하기를 눌러주세요.</apan>
                    <div class="value-btn">
                        <div class="value">
                            개인 정보 마케팅 활용 동의
                            <button class="open-modal-btn" data-target="modal">내용 보기</button>
                        </div>
                        <label class="switch">
                            <input type="checkbox"
                            	<c:if test="${sessionScope.loginUser.marketing == 'Y'}">
				                    checked
				                </c:if>
                            >
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>

				<div class="button-area">
					<button id="changes-submit" class="changes-btn">수정하기</button>
				</div>

                <a class="out" href="withdrawal.me">회원탈퇴</a>

                <!-- 약관 내용 모달 -->
                <div id="agreement-modal" class="agreement-modal">
                    <div class="agreement-modal-content">
                        <span class="close-btn">&times;</span>
                        <h2>마케팅 활용 동의</h2><hr>
                        <p>마케팅 활용에 대한 설명이 여기에 표시됩니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        	
        // 약관모달-------------------------------------------------
        $(function () {
            // 모달 열기
            $('.open-modal-btn').click(function () {
                const targetModal = '#' + $(this).data('target');
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




     	// 비밀번호 변경 모달 보여주기
        function showChangePasswordModal() {
            document.getElementById('changePasswordModal').style.display = 'block';
        }

        // 비밀번호 변경 모달 닫기
        function closeChangePasswordModal() {
            document.getElementById('changePasswordModal').style.display = 'none';
        }

        // 비밀번호 유효성 검사
        $("#newPassword").on("keyup", function () {
            const password = $(this).val();
            if (pwdRegexp.test(password)) {
                $(this).css("border-color", "green");
            } else {
                $(this).css("border-color", "red");
            }
        });

        // 비밀번호 확인 검사
        $("#confirmNewPassword").on("keyup", function () {
            const password = $("#newPassword").val();
            const confirmPassword = $(this).val();
            if (password === confirmPassword && pwdRegexp.test(password)) {
                $(this).css("border-color", "green");
            } else {
                $(this).css("border-color", "red");
            }
        });

        // 비밀번호 변경
        function changePassword() {
            const currentPassword = $("#currentPassword").val();
            const newPassword = $("#newPassword").val();
            const confirmNewPassword = $("#confirmNewPassword").val();

            if (!pwdRegexp.test(newPassword)) {
                alert("새 비밀번호는 영문, 숫자, 특수기호를 포함한 10자 이상이어야 합니다.");
                return;
            }

            if (newPassword !== confirmNewPassword) {
                alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
                return;
            }

            $.ajax({
                url: "changePassword.me",
                type: "post",
                data: JSON.stringify({
                    currentPassword: currentPassword,
                    newPassword: newPassword
                }),
                contentType: "application/json", // 서버가 JSON으로 인식하도록 설정
                success: function (response) {
                    if (response.result === "success") {
                        alert("비밀번호가 성공적으로 변경되었습니다.");
                        closeChangePasswordModal();
                    } else if (response.result === "mismatch") {
                        alert("기존 비밀번호가 일치하지 않습니다.");
                        $("#currentPassword").css("border-color", "red").focus();
                    } else {
                        alert("비밀번호 변경에 실패했습니다.");
                    }
                },
                error: function () {
                    alert("비밀번호 변경 중 오류가 발생했습니다.");
                }
            });

        }



		

    </script>
</body>
</html>