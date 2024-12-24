<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

	<div class="change-pwd-container">
	    <h1>비밀번호 변경</h1>
	    <form id="changePwdForm">
	        <input type="hidden" id="userId" name="userId" value="${userId}"> <!-- 숨겨진 필드 -->
	
	        <div class="form-group">
	            <label for="newPwd">새 비밀번호</label>
	            <input type="password" id="newPwd" name="newPwd" placeholder="새 비밀번호를 입력해주세요." required>
	        </div>
	
	        <div class="form-group">
	            <label for="confirmPwd">비밀번호 확인</label>
	            <input type="password" id="confirmPwd" name="confirmPwd" placeholder="비밀번호를 다시 입력해주세요." required>
	        </div>
	
	        <div class="form-buttons">
	            <button type="button" id="changePwdBtn">변경</button>
	            <button type="button" onclick="location.href='loginForm.me'">취소</button>
	        </div>
	    </form>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	$("#changePwdBtn").click(function () {
	    const newPwd = $("#newPwd").val().trim();
	    const confirmPwd = $("#confirmPwd").val().trim();
	    const userId = $("#userId").val(); // 숨겨진 필드에서 userId 가져오기
	
	    const pwdRegexp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+~`|}{[\]:;?><,./-]).{10,}$/;
	
	    if (!pwdRegexp.test(newPwd)) {
	        alert("비밀번호는 영문, 숫자, 특수기호를 포함하여 10자 이상 입력해야 합니다.");
	        return;
	    }
	
	    if (newPwd !== confirmPwd) {
	        alert("비밀번호가 일치하지 않습니다.");
	        return;
	    }
	
	    $.ajax({
	        url: "updatePwd.me",
	        type: "post",
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        data: {
	            userId: userId,
	            newPwd: newPwd,
	        },
	        success: function (response) {
	            if (response === "SUCCESS") {
	                alert("비밀번호가 성공적으로 변경되었습니다. 로그인 페이지로 이동합니다.");
	                location.href = "loginForm.me";
	            } else {
	                alert("비밀번호 변경 중 오류가 발생했습니다.");
	            }
	        },
	        error: function () {
	            alert("비밀번호 변경 중 오류가 발생했습니다.");
	        },

	    });
	});
	</script>


</body>
</html>