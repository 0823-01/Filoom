<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	    height: auto; /* 이거 나중에 손바야대 */
	}
	
	.login-container {
	    width: 100%;
	    max-width: 600px;
	    background-color: #1e1e1e;
	    border-radius: 10px;
	    padding: 50px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	}
	
	.login-Header {
	    font-size: 24px;
	    font-weight: 600;
	    margin-bottom: 20px;
	    border-bottom: 1px solid #333;
	    padding-bottom: 10px;
	}
	
	.form-group {
	    margin-bottom: 15px;
	}
	
	.form-group label {
	    display: block;
	    font-size: 14px;
	    margin-bottom: 10px;
	    font-weight: 500;
	}
	
	input {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #333;
	    border-radius: 5px;
	    background-color: #2b2b2b;
	    color: #ffffff;
	    font-size: 14px;
	}
	
	input::placeholder {
	    color: #777;
	} 
	
	.findId-btn {
	    background-color: #555555;
	    margin-top: 15px;
	}
	
	.findPwd-btn {
	    background-color: #000000;
	    margin-top: 15px;
	}
	
	hr {
	    border: 0;
	    border-top: 1px solid #333;
	    margin: 30px 0;
	}
	
	.signup-text1 {
	    font-size: 20px;
	    font-weight: 600;
	    color: #aaaaaa;
	    padding-bottom: 30px;
	}
	
	.signup-text2 {
	    font-size: 14px;
	    color: #aaaaaa;
	    padding-bottom: 20px;
	}
	
	.signup-btn {
	    background-color: #493628;
	    margin-top: 15px;
	}
	
	.findId-btn, .findPwd-btn, .signup-btn {
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
	
	.signup-btn:hover, .findId-btn:hover, .findPwd-btn:hover {
	    background-color: #fff; /* 배경을 흰색으로 변경 */
	    color: #000; /* 글씨 색을 검정색으로 변경 */
	}
	
	.input-with-btn {
	    display: flex;
	    gap: 10px;
	    align-items: center;
	}
	
	select {
	    /* -moz-appearance: none; */
	    /* -webkit-appearance: none; */
	    /* appearance: none; */
	    /* box-shadow: 0 1px 0 1px rgba(0,0,0,.04); */
	    font-size: 14px;
	    background-color: #2b2b2b;
	    color: #ffffff;
	    padding: 10px;
	    border: 1px solid #333;
	    border-radius: 5px;
	}
	
	span {
	    font-size: 14px;
	    color: #aaa;
	}
	
	.find-button {
	    display: flex;
	    gap: 10px;
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
    <div class="login-container">
        <div class="login-box">
            <h1 class="login-Header">아이디 찾기</h1>
            <form>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="userName" id="userName" placeholder="한글 또는 영문으로 입력해주세요." required>
                </div>
                <div class="form-group">
                    <label for="birth">생년월일</label>
                    <input type="text" id="birth" placeholder="YYYYMMDD" required>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <div class="input-with-btn">
                        <input type="text" id="email" placeholder="이메일을 입력해주세요." required>
                        <span>@</span>
                        <select id="emailDomain">
                            <option value="self">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="kakao.com">kakao.com</option>
                        </select>
                    </div>
                </div>
                <div class="find-button">
                    <button type="submit" class="findId-btn">아이디 찾기</button>
                    <button type="button" class="findPwd-btn" onclick="location.href='findPwdForm.html'">비밀번호 찾기</button>
                </div>
            </form>
            <hr>
            <div class="signup-box">
                <p class="signup-text1">아직 계정이 없으신가요?</p>
                <p class="signup-text2">개인 계정을 생성하시면 더욱 다양한 혜택을 누리실 수 있습니다.</p>
                <button type="button" class="signup-btn" onclick="location.href='enrollForm.html'">Filoom 계정 만들기</button>
            </div>
        </div>
    </div>
</body>
</html>