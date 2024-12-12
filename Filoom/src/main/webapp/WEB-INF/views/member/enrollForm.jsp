<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    /* 스타일 초기화 */
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
        height: auto; /* 이거 나중에 손바야대 */
    }

    .signup-container {
        width: 100%;
        max-width: 700px;
        background-color: #1e1e1e;
        border-radius: 10px;
        padding: 50px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .enroll-Header {
        font-size: 24px;
        font-weight: 600;
        margin-bottom: 10px;
        border-bottom: 1px solid #333;
        padding-bottom: 10px;
    }

    .required-notice {
        font-size: 12px;
        color: #aaa;
        margin-bottom: 20px;
        text-align: right;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-size: 14px;
        margin-bottom: 10px;
        font-weight: 500;
    }

    span {
        font-size: 14px;
        color: #aaa;
    }

    hr {
        border: 0;
        border-top: 1px solid #333;
        margin: 30px 0;
    }

    /* 공통 입력 필드 스타일 */
    input[type="text"],
    input[type="password"],
    input[type="tel"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #333;
        border-radius: 5px;
        background-color: #2b2b2b;
        color: #ffffff;
        font-size: 14px;
        flex: 1;
    }

    input::placeholder {
    color: #777;
    }
    
    input:focus {
	  outline: none;
	}

    /* 닉네임, 이메일 중복 확인 버튼 */
    .input-with-btn {
        display: flex;
        gap: 10px;
    }

    select {
        /* -moz-appearance: none; */
        /* -webkit-appearance: none; */
        /* appearance: none; */
        /* box-shadow: 0 1px 0 1px rgba(0,0,0,.04); */
        padding: 10px;
        border: 1px solid #333;
        border-radius: 5px;
        background-color: #2b2b2b;
        color: #ffffff;
        font-size: 14px;
    }

    .check-btn {
        padding: 10px 15px;
        background-color: #493628;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .check-btn:hover {
        background-color: #8b5a2b;
    }
    
    /* 비활성화 상태 */
	.check-btn:disabled {
	    background-color: #d3d3d3; /* 비활성화된 버튼의 배경색 */
	    color: #a9a9a9; /* 비활성화된 버튼의 텍스트 색상 */
	    cursor: not-allowed; /* 비활성화된 버튼에 커서 비활성화 스타일 */
	    opacity: 0.7; /* 약간의 투명도 추가 */
	}

    /* 전화번호 그룹 */
    .phone-group {
        display: flex;
        flex-direction: column;
        /* gap: 5px; 레이블과 입력 필드 간 간격 */
    }

    .phone-group .input-with-btn {
        display: flex;
        gap: 10px; /* 입력 필드 간 간격 */
        align-items: center; /* 수직 중앙 정렬 */
    }

    /* 성별 그룹 */
    .gender-group {
        display: flex;
        align-items: center;
        gap: 60px; /* 라디오 버튼 사이의 간격 */
    }

    .gender-group label {
        font-size: 14px;
        cursor: pointer;
    }

    .gender-group input[type="radio"] {
        width: 16px;
        height: 16px;
        cursor: pointer;
        accent-color: #493628;
        margin-right: 10px; /* 라디오 버튼과 텍스트 간 간격 */
        margin-top: 5px;
        vertical-align: -3px;
    }

    /* 약관동의 css */
    .agreement-container {
        width: 100%;
        border: 1px solid #444;
        padding: 15px;
        background-color: #1e1e1e;
        color: #ffffff;
    }

    .agreement-header {
        display: flex;
        align-items: center;
        gap: 10px;
        border-bottom: 1px solid #333;
        padding-bottom: 10px;
        margin-bottom: 10px;
    }

    .all-agree {
        font-size: 16px;
        margin: 0 0 2px 0; /* 체크박스와 글자 사이 단차 */
        font-weight: bold;
        cursor: pointer;
    }

    .agreement-header span {
        font-size: 12px;
        color: #aaa;
    }

    input[type=checkbox] {
        cursor: pointer;
        zoom: 1.5;
    }

    .agreement-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    /* 약관 항목 스타일 */
    .agreement-item {
        display: flex;
        align-items: center;
        justify-content: flex-start; /* 체크박스와 제목을 왼쪽 정렬 */
        gap: 10px; /* 체크박스와 제목 간 간격 */
    }

    /* 약관 제목 */
    .agreement-label {
        flex: 1;
        font-size: 14px;
        cursor: pointer; /* 마우스 포인터 활성화 */
    }

    .agree-label {
        flex: 1;
        font-size: 14px;
        cursor: pointer; /* 마우스 포인터 활성화 */
        margin: 10px 0 14px 0; /* 체크박스와 글자 사이 단차 */
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
        max-width: 800px;
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
    .open-modal-btn {
        background: none;
        border: none;
        color: #aaa;
        cursor: pointer;
        font-size: 12px;
    }

    .open-modal-btn:hover {
        color: #fff;
    }

    .submit-btn {
        background-color: #000000;
        margin-top: 25px;
        width: 100%;
        padding: 10px;
        border: none;
        font-size: 16px;
        font-weight: bold;
        color: #ffffff;
        border-radius: 60px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease; /* 배경색과 글씨 색 변화를 위한 트랜지션 */
    }

    .submit-btn:hover {
        background-color: #fff; /* 배경을 흰색으로 변경 */
        color: #000; /* 글씨 색을 검정색으로 변경 */
    }

    /* 크롬 자동완성 시 input 색상 변경 막음 */
    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
        transition: background-color 5000s ease-in-out 0s;
        -webkit-transition: background-color 9999s ease-out;
        -webkit-box-shadow: 0 0 0px 1000px #2b2b2b inset !important;
        -webkit-text-fill-color: #fff !important;
    }
</style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-box">
            <h1 class="enroll-Header">회원가입</h1>
            <p class="required-notice">필수입력사항 *</p>
            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">아이디 *</label>
                    <div class="input-with-btn">
                        <input type="text" id="userId" name="userId" placeholder="영문, 숫자를 조합한 5-20자 이내로 입력해주세요." required>
                        <button class="check-btn" id="checkIdBtn" disabled>중복확인</button>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호 *</label>
                    <input type="password" id="userPwd" name="userPwd" placeholder="영문, 숫자, 특수기호를 포함한 10자 이상의 비밀번호를 입력해주세요." required>
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">비밀번호 확인 *</label>
                    <input type="password" id="checkPwd" name="checkPwd" placeholder="비밀번호를 다시 입력해주세요." required>
                </div>
                <hr>
                <div class="form-group">
                    <label for="userName">이름 *</label>
                    <input type="text" id="userName" name="userName" placeholder="한글 또는 영문으로 입력해주세요." required>
                </div>
                
                
                
                
                <div class="form-group">
                    <label for="email">이메일 *</label>
                    <div class="input-with-btn">
                        <input type="text" id="emailId" name="emailId" placeholder="이메일을 입력해주세요." required>
                        <span>@</span>
                        <select id="emailDomain" name="emailDomain">
                            <option value="self">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="kakao.com">kakao.com</option>
                        </select>
                        <input type="text" id="customDomain" name="customDomain" placeholder="도메인을 입력해주세요" style="display:none;">
                        <button type="button" class="check-btn" id="cert" onclick="sendCert();">인증번호 받기</button>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="checkNo">인증번호 *</label>
                    <div class="input-with-btn">
                        <input type="text" id="checkNo" name="checkNo" placeholder="인증번호를 입력해주세요." disabled>
                        <button type="button" class="check-btn" id="validate" onclick="validateCert();" disabled>인증확인</button>
                    </div>
                </div>




                
                <div class="form-group">
                    <label for="birth">생년월일 *</label>
                    <input type="text" id="birth" name="birth" placeholder="YYYYMMDD" required>
                </div>
                <div class="form-group">
                    <label for="nickname">닉네임</label>
                    <div class="input-with-btn">
                        <input type="text" id="nickname" name="nickname" placeholder="한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)">
                        <button class="check-btn">중복확인</button>
                    </div>
                </div>
                <div class="form-group">
                    <!-- 전화번호 박스 -->
                    <div class="phone-group">
                        <label for="phone">전화번호</label>
                        <div class="input-with-btn">
                            <select id="firstPhone">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="012">012</option>
                            </select>
                            <span>-</span>
                            <input type="tel" id="middlePhone" class="phone-input" placeholder="0000" maxlength="4">
                            <span>-</span>
                            <input type="tel" id="lastPhone" class="phone-input" placeholder="0000" maxlength="4">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <!-- 성별 박스 -->
                    <label for="gender">성별</label>
                    <div class="gender-group">
                        <label><input type="radio" class="gender" name="gender" value="" checked="checked">선택안함</label>
                        <label><input type="radio" class="gender" name="gender" value="M">남성</label>
                        <label><input type="radio" class="gender" name="gender" value="F">여성</label>
                    </div>
                </div>
                <hr>

                <div>
                    <label>약관동의</label>
                    <div class="agreement-container">
                        <div class="agreement-header">
                            <input type="checkbox" id="all-agree">
                            <label for="all-agree" class="all-agree">전체동의</label>
                            <span>선택항목에 대한 동의 포함</span>
                        </div>
                        <ul class="agreement-list">
                            <li>
                                <div class="agreement-item">
                                    <input type="checkbox" id="agree1" class="agree-checkbox" required>
                                    <label for="agree1" class="agree-label">(필수) 만 14세 이상입니다. *</label>
                                </div>
                            </li>
                            <li>
                                <div class="agreement-item">
                                    <input type="checkbox" id="agree2" class="agree-checkbox" required>
                                    <label for="agree2" class="agree-label">(필수) 서비스 이용 약관 동의 *</label>
                                    <button type="button" class="open-modal-btn" data-target="modal2">자세히 보기</button>
                                </div>
                            </li>
                            <li>
                                <div class="agreement-item">
                                    <input type="checkbox" id="agree3" class="agree-checkbox" required>
                                    <label for="agree3" class="agree-label">(필수) 개인정보 수집 및 이용 동의 *</label>
                                    <button type="button" class="open-modal-btn" data-target="modal3">자세히 보기</button>
                                </div>
                            </li>
                            <li>
                                <div class="agreement-item">
                                    <input type="checkbox" id="agree4" class="agree-checkbox">
                                    <label for="agree4" class="agree-label">(선택) 개인정보 마케팅 활용 동의</label>
                                    <button type="button" class="open-modal-btn" data-target="modal4">자세히 보기</button>
                                </div>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 모달 창 -->
                    <div id="modal2" class="modal">
                        <div class="modal-content">
                            <span class="close-btn">&times;</span>
                            <h3>서비스 이용 약관</h3><br><br>
                            <div>
                                <strong>제 1 조 [목적]</strong><br>
                                &nbsp;&nbsp;본 약관은 필룸(Filoom)에서 제공하는 영화 예매 및 관련 서비스(이하 "서비스")의 이용과 관련된 사항을 규정합니다.<br><br>
                                <strong>제 2 조 [회원 가입 및 관리]</strong><br>
                                &nbsp;&nbsp;- 회원은 본인의 정보로만 가입해야 하며, 허위 정보를 기입할 경우 계정이 제한될 수 있습니다.<br>
                                &nbsp;&nbsp;- 회원은 ID와 비밀번호 관리에 책임을 지며, 이를 타인에게 양도하거나 대여할 수 없습니다.<br><br>
                                <strong>제 3 조 [서비스 이용]</strong><br>
                                &nbsp;&nbsp;- 필룸은 영화 예매 서비스 외에도 영화 관련 콘텐츠 제공, 예매 내역 관리 등의 부가 서비스를 제공합니다.<br>
                                &nbsp;&nbsp;- 필룸은 시스템 점검, 운영상의 이유 등으로 서비스 제공을 일시적으로 제한할 수 있습니다.<br><br>
                                <strong>제 4 조 [책임 제한]</strong><br>
                                &nbsp;&nbsp;- 필룸은 영화 예매 후 발생하는 개인적 문제(시간 변경, 상영 취소 등)에 대해 제한적인 책임을 부담합니다.<br>
                                &nbsp;&nbsp;- 다만, 시스템 오류나 필룸 측 과실로 인한 문제는 책임을 인정하고 적절히 대응합니다.<br>
                            </div>
                        </div>
                    </div>
                    <div id="modal3" class="modal">
                        <div class="modal-content">
                            <span class="close-btn">&times;</span>
                            <h2>개인정보 수집 및 이용</h2><hr>
                            <p>개인정보 처리 방침 내용이 여기에 표시됩니다.</p>
                        </div>
                    </div>
                    <div id="modal4" class="modal">
                        <div class="modal-content">
                            <span class="close-btn">&times;</span>
                            <h2>마케팅 활용 동의</h2><hr>
                            <p>마케팅 활용에 대한 설명이 여기에 표시됩니다.</p>
                        </div>
                    </div>
                </div>
                
                
                



                <button type="submit" class="submit-btn">회원가입</button>
            </form>
        </div>
    </div>
    
    <script>
    
    	$("#emailDomain").change(function() {
    		if ($(this).val() === "self") {
    			$("#customDomain").show();
    		} else {
    			$("#customDomain").hide();
    		}
    	}
    
	 	// 이메일 인증번호 전송 요청
	 	function sendCert() {
	 		
	 		let email = $("#email").val();
	 		
	 		$.ajax({
	 			url: "cert.do",
	 			type: "post",
	 			data: {
	 				email : email
	 			},
	 			success : function(result) {
	 				
	 				alert(result);
	 				
	 				// 하단의 인증 관련 요소 활성화
					$("#checkNo").attr("disabled", false);
					$("#validate").attr("disabled", false);
					
					// 사용자가 계속 인증 요청 보내는 것을
					// 방지하기 위해 인증번호 발급 후 인증 이메일 입력창
					// 및 인증메일 보내기 버튼 비활성화
					$("#email").attr("disabled", true);
					$("#cert").attr("disabled", true);
	 			},
	 			error: function() {
	 				console.log("인증번호 발급용 ajax 통신 실패");
	 			}
	 		});
	 	}
	 	
	 	// 이메일 인증번호 대조 요청
	 	function validateCert() {
	 		
	 		let email = $("#email").val();
			let checkNo = $("#checkNo").val();
			
			$.ajax({
				url: "validate.do",
				type: "post",
				data: {
					email: email,
					checkNo: checkNo
				},
				success: function(result) {
					
					$("#result").text(result);
					
					if(result == "인증 성공") {
						
						$("#result").css("color", "green");
						
						// 인증 성공 후 인증 관련 요소들 비활성화
						$("#checkNo").attr("disabled", true);
						$("#validate").attr("disabled", true);
						
					} else {
						
						$("#result").css("color", "red");
						
						// 인증 실패 시 재인증 할 수 있도록 유도
						$("#email").attr("disabled", false);
						$("#cert").attr("disabled", false);
						
						$("#checkNo").attr("disabled", true);
						$("#validate").attr("disabled", true);
						
						$("#email").val("");
						$("#checkNo").val("");
					}
				},
				error: function() {
					console.log("인증번호 대조용 ajax 통신 실패");
				}
			});
	 	}
	 	
    
	    $(function () {
	    	
	    	// 비속어 목록
	        const restrictedWords = ["admin", "fuck"]; 
	    	
	     	// 아이디 조건 : 영문, 숫자를 조합한 5-20자
	        const idRegexp = /^[a-zA-Z0-9]{5,20}$/; 
	        
	     	// 비밀번호 조건 : 영문, 숫자, 특수기호를 포함한 10자 이상
	        const pwdRegexp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+~`|}{[\]:;?><,./-]).{10,}$/;
	        
	     	// 이름 조건 : 한글 또는 영문, 최소 2자 이상 20자 이하
	        const nameRegexp = /^[가-힣a-zA-Z]{2,20}$/;
	
	        let isIdChecked = false; // 아이디 중복 확인 여부 플래그
	
	        // 아이디 입력 실시간 검증
	        $("#userId").on("input", function () {
	        	
	            const userId = $(this).val().trim();
	
	            if (idRegexp.test(userId)) {
	                $("#checkIdBtn").prop("disabled", false); // 버튼 활성화
	                isIdChecked = false; // 아이디가 수정되면 다시 중복 확인 필요
	            } else {
	                $("#checkIdBtn").prop("disabled", true); // 버튼 비활성화
	            }
	        });
	
	        // 중복확인 버튼 클릭 이벤트
	        $("#checkIdBtn").click(function (e) {
	        	
	            e.preventDefault();
	            const userId = $("#userId").val().trim();
	
	            $.ajax({
	                url: "idCheck.me",
	                method: "post",
	                contentType: "application/json",
	                data: JSON.stringify({ userId: userId }),
	                success: function (response) {
	                	
	                    if (response.result === "duplicate") {
	                        alert("중복된 아이디입니다.");
	                        
	                    } else if (response.result === "invalid") {
	                        alert("사용이 불가능한 아이디입니다.");
	                        
	                    } else if (response.result === "available") {
	                        alert("사용 가능한 아이디입니다.");
	                        $("#userId").prop("readonly", true); // 입력창 비활성화
	                        $("#userId").css("border-color", "green"); // 입력창 테두리 초록색
	                        $("#checkIdBtn").prop("disabled", true); // 버튼 비활성화
	                        isIdChecked = true; // 중복 확인 성공
	                    }
	                },
	                error: function () {
	                    alert("아이디 중복 확인에 실패했습니다. 다시 시도해주세요.");
	                    isIdChecked = false;
	                },
	            });
	        });
	        
	     	// 비밀번호 유효성 검사
	        $("#userPwd").on("keyup", function () {
	        	
	            const password = $(this).val();

	            if (pwdRegexp.test(password)) {
	                $(this).css("border-color", "green");
	            } else {
	                $(this).css("border-color", "red");
	            }
	        });
	     	
	     	// 비밀번호 확인 검사
	        $("#checkPwd").on("keyup", function () {
	        	
	            const password = $("#userPwd").val();
	            const confirmPassword = $(this).val();

	            if (password === confirmPassword && pwdRegexp.test(password)) {
	                $(this).css("border-color", "green");
	            } else {
	                $(this).css("border-color", "red");
	            }
	        });

	     	// 이름 유효성 검사
	        $("#userName").on("keyup", function () {
	        	
	            const userName = $(this).val();

	            if (nameRegexp.test(userName)) {
	                $(this).css("border-color", "green"); // 테두리 초록색
	            } else {
	                $(this).css("border-color", "red"); // 테두리 빨간색
	            }
	        });
	     	
	        // 회원가입 버튼 클릭 시 검증
	        $(".submit-btn").click(function (e) {
	        	
	            e.preventDefault(); // 기본 제출 동작 막기
	
	            const userId = $("#userId").val().trim();
	            const password = $("#userPwd").val();
	            const confirmPassword = $("#checkPwd").val();
	            const userName = $("#userName").val().trim();
	
	            // alert
	            if (!idRegexp.test(userId)) {
	            	
	            	alert("아이디는 영문, 숫자 조합으로 5~20자 이내로 입력해주세요.");
	            	
	            } else if (!isIdChecked) {
	            	
	            	alert("아이디 중복 확인을 진행해주세요.");
	            	
	            } else if (!pwdRegexp.test(password)) {
	            	
	            	alert("비밀번호는 영문, 숫자, 특수기호를 포함한 10자 이상이어야 합니다.");
	            	
	            } else if (password !== confirmPassword) {
	            	
	            	alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	            	
	            } else if (!nameRegexp.test(userName)) {
	            	
	            	alert("이름은 한글 또는 영문으로 2~20자 이내로 입력해주세요.");
	            	
	            } else {
	            	
	                $("form").submit(); // 모든 조건이 충족되면 폼 제출
	            }
	        });
	    });
	    

    	// 약관 체크박스 ---------------------------------------------------------------------
        $(function () {
            
            // 전체동의 체크박스 동작
            $('#all-agree').change(function () {
                const isChecked = $(this).prop('checked');
                $('.agree-checkbox').prop('checked', isChecked);
            });

            // 개별 약관 체크박스 동작
            $('.agree-checkbox').change(function () {
                const allChecked = $('.agree-checkbox').length === $('.agree-checkbox:checked').length;
                $('#all-agree').prop('checked', allChecked);
            });
        });
    	
     	// 약관 모달 -------------------------------------------------------------------------
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
     	
     	
     	
     	
     	// ----------------------------------------------------------------------------------
        $(document).ready(function () {
		    const $emailId = $("#emailId");
		    const $emailDomain = $("#emailDomain");
		    const $emailDomainSelf = $("#emailDomainSelf");
		    const $emailFull = $("#emailFull");
		    const $emailForm = $("#emailForm");
		
		    // 이메일 도메인 선택 변경 시
		    $emailDomain.change(function () {
		        if ($(this).val() === "self") {
		            $emailDomainSelf.show().prop("required", true);
		        } else {
		            $emailDomainSelf.hide().prop("required", false);
		        }
		    });
		
		    // 폼 제출 시
		    $emailForm.submit(function (e) {
		        e.preventDefault(); // 기본 제출 동작 막기
		        const domain = $emailDomain.val() === "self" ? $emailDomainSelf.val() : $emailDomain.val();
		
		        if (!domain) {
		            alert("도메인을 입력해주세요.");
		            return;
		        }
		
		        // 이메일 전체 주소 조합
		        $emailFull.val(`${$emailId.val()}@${domain}`);
		
		        console.log("전송할 이메일:", $emailFull.val()); // 확인용
		        this.submit(); // 최종 폼 제출
		    });
		});
     	
     	
     	
     	
     	
     	
     	

        // 전화번호 숫자만 ---------------------------------------------------------
        $(function () {
            // 숫자만 입력 가능
            $('.phone-input').on('keypress', function (e) {
                if (!/[0-9]/.test(e.key)) {
                    e.preventDefault();
                }
            });

            // 이미 입력된 값에서 숫자 외의 문자 제거
            $('.phone-input').on('input', function () {
                const numericValue = $(this).val().replace(/[^0-9]/g, '');
                $(this).val(numericValue);
            });
        });

        $(function() {

            // 회원가입 버튼 클릭 시 확인
            $('.submit-btn').click(function (event) {
                const requiredCheckboxes = $('#agree1, #agree2, #agree3');
                const optionalCheckbox = $('#agree4');

                const isRequiredChecked = requiredCheckboxes.filter(':checked').length === requiredCheckboxes.length;
                const isOptionalChecked = optionalCheckbox.is(':checked');

                if (isRequiredChecked) {
                    if (isOptionalChecked) {
                        console.log('Y,Y'); // 필수 체크 + 선택 체크
                    } else {
                        console.log('Y,N'); // 필수 체크 + 선택 미체크
                    }
                } else {
                    event.preventDefault(); // 필수 동의가 모두 체크되지 않았을 경우 버튼 클릭 막기
                    alert('필수 약관에 모두 동의해 주세요.');
                }
            });
        })
        
        


    </script>

</body>
</html>