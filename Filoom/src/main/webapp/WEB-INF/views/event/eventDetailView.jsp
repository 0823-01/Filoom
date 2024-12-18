<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 상세조회</title>
<style>

    body{
        background-color: black;
    }

    /*전체를 감싸는 영역*/
    .container {
        background-color: #313131;
        box-sizing: border-box;
        margin : auto;
        width : 1900px;
        max-width: 1900px;
        padding : 20px;
        margin-bottom : 30px;
    }

    /* 이벤트 제목, 이벤트 기간 */
    .menu-area {
        display: flex;
        justify-content: space-between;
        background-color: #E4E0E1;
        border-radius: 4px;
        height : 50px;
        margin-bottom: 15px;
    }

    #event_title, #event_date {
        /*border: 1px solid red;*/
        color : #493628;
        font-size: 25px;
        font-weight: bold;
        padding : 3px;
        padding-top : 6px;
    }

    #event_title {
        margin-left: 10px;
    }
    #event_date {
        margin-right: 10px;

    }

    /*내용부분*/
    .content-area {
        background-color: #F3F3F3;
        border-radius: 4px;
        /*overflow: auto;
        height : 1250px; */
        box-sizing: border-box;
    }

    .content {
        padding: 10px;
        padding-top: 20px;
        margin : auto;
        /*border: 1px solid red; */
        width : 90%;
    }
    
    #event_img {
        display: block;
        margin : auto;
        width : 100%;
    }

    /*목록버튼*/
    #listBtn {
        margin-top: 20px;
        text-align: right;
    }

    #listBtn>button {
        height : 30px;
        width : 100px;
        color : #E4E0E1;
        background-color: #493628;
        border-radius: 4px;
        font-size: 15px;
        font-weight: bold;
        border : none;
    }

    #listBtn>button:hover {
        background-color : #AB886D;
        cursor: pointer;
    }

    /*댓글부분*/
    .reply-area {
        border-top: 2.5px solid #493628;
        margin: auto;
        padding : 10px;
        width : 90%;
        border-spacing: 0;
    }

    .reply {
        margin-top: 10px;
        width : 100%;
        border-collapse : collapse;
    }

    tr {
        border : none;
        border-bottom: 2.5px solid #493628;
        height: 60px;
        font-weight: bold;
    }

    #replySize {
        margin-left: 15px;
        font-size : 18px;
        font-weight: bold;
        color : #493628;
    }

    /*댓글작성영역*/
    .replyRegister {
        display: flex;
        justify-content: center;
        gap : 5px;
        box-sizing: border-box;
        padding : 10px;
    }

    #input {
        width : 95%;
        height : 100px;
        box-sizing: border-box;
    }

    #registerBtn {
        width : 5%;
        height : 100px; 
        box-sizing: border-box;
    }

    #input>#replyInput {
        border-radius: 4px;
        resize : none;
        background-color: #E4E0E1;
        width : 100%;
        height : 100%;
        padding : 10px;
        border: none;
        box-sizing: border-box;
        box-shadow: #E4E0E1;
        border : 2px solid #493628;
    }

    #registerBtn>#register {
        background-color: #493628;
        color : #E4E0E1;
        font-size: 18px;
        font-weight: bold;
        width : 100%;
        height : 100%;
        border : none;
        border-radius: 4px;
        cursor: pointer;
    }

    #registerBtn>#register:hover {
        background-color: #AB886D;
    }

    /*운영원칙 모달*/
    #modalLink {
        text-align: right;
        margin : 0 13px 5px 0;
    }

    #modalLink>a:hover {
        color : #AB886D;
    }

    .modal {
        display: none;
        position: fixed;
        top: 50%;
        left : 50%;
        transform: translate(-50%, -50%);
        background-color: #313131;
        width : 800px;
        padding: 20px;
        margin: auto;
        border-radius: 4px;
    }

    .modalTitle {
        border-radius: 4px;
        background-color: #E4E0E1;
        color : #493628;
        padding-left : 10px;
        box-sizing: border-box;
        height : 50px;
        line-height: 50px;
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
    }

    #title {
        font-size: 20px;
        font-weight: bold;
    }

    #close {
        font-size: 20px;
        font-weight: bolder;
        margin-right: 10px;
    }

    .modalContent {
        text-align: left;
        border-radius: 4px;
        background-color: #F3F3F3;
        box-sizing: border-box;
        padding: 10px;
    }

    #deleteRull {
        text-align: left;
        background-color: #E4E0E1;
        border-radius: 4px;
        box-sizing: border-box;
        margin: auto;
        box-shadow : 3px 3px 3px rgb(0, 0, 0, 0.2);
    }

    p {
        font-size: 18px;
        font-weight: bold;
        color : #493628;
    }

    #rull{
        padding : 10px;
        font-size: 18px;
        font-weight: bold;
        color : #493628;
    }

    /*댓글 목록조회*/
    #replyWriter {
        text-align: center;
        width : 10%;
    }

    #replyDate {
        text-align: center;
        width : 20%;
    }

    .replyContent {
        width : 70%;
    }
    
    #modalLink>a {
        color : #493628;
        margin-left: 33px;
    }

    /*댓글 수정*/
    .updateReply {
        /*border: 1px solid red;*/
        display: flex;
        justify-content: left;
        gap : 10px;
        box-sizing: border-box;
    }

    #updateForm {
        /*border: 1px solid red;*/
        width : 80%;
        height : 50px;
        box-sizing: border-box;
        border-bottom: 5px;
        display: flex;
        justify-content: flex-start;
        gap : 10px;
    }

    #updateReplyContent {
        /*border: 1px solid red;*/
        resize: none;
        width : 100%;
        height: 100%;
        border: 2px solid #493628;
        background-color: #E4E0E1;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .btn {
        /*border : 1px solid  blue;*/
        line-height: 50px;
    }

    #updateBtn, #deleteBtn, #saveBtn, #cancelBtn {
        background-color: #493628;
        color : #E4E0E1;
        font-size : 15px;
        font-weight: bold;
        border-radius: 4px;
        border : none;
        height : 30px;
        width : 50px;
        margin-right: 5px;
        cursor: pointer;
    }

    #updateBtn:hover, #deleteBtn:hover, #saveBtn, #cancelBtn {
        background-color: #AB886D;
    }
    
    /*응모버튼*/
    .apply {
    	box-sizing : border-box;
    	margin-top: 10px;
    	text-align : center;
        padding-bottom : 30px;
    	
    }
    
    #applyBtn {
    	height : 70px;
    	width : 300px;
    	color : #E4E0E1;
    	background-color: #AB886D;
    	border-radius : 4px;
    	font-size : 40px;
    	font-weight : bold;
    	border : none;
    	
    }
    
    #applyBtn:hover {
        background-color : #493628;
        cursor: pointer;
    }

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <!--전체를 감싸는 container-->
    <div class="container">
    
        <!--이벤트제목, 기간-->
        <div class="menu-area">
            <div id="event_title">${requestScope.e.eventTitle}</div>
            <div id="event_date">기간&emsp;${requestScope.e.startDate} ~ ${requestScope.e.endDate}</div>
        </div>

        <!--내용부분-->
        <div class="content-area">
            <div class="content">
            	${requestScope.e.eventContent }<br><br><br>
            	<c:forEach var="file" items="${requestScope.list}">
                	<img id="event_img" src="${ pageContext.request.contextPath }${file.changeName}" alt="상세이미지">
                </c:forEach>
                <div id="listBtn">
                    <button onclick="history.back()">목록으로</button>
                </div>
            </div>
            
            
            <!-- 이벤트 타입에 따라 보여지는 화면이 다름 -->
            <c:choose>
            	
            	<c:when test="${requestScope.e.eventType == 1}">
            	   <!--댓글부분-->
		            <div class="reply-area">
		                <div id="replySize"><b style="color : #AB886D;" id="rcount">0</b>개의 댓글이 있습니다.</div>
		                <table class="reply">
		                    <thead>
		                        <tr>
		                            <td colspan="3" style="height : 50px">
		                                <div class="replyRegister">
		                                	<c:choose>	
			                                	<c:when test="${ empty sessionScope.loginUser}">
			                                	<!-- 로그인하지 않은 경우 댓글 입력 -->
				                                    <div id="input">
				                                        <textarea id="replyInput" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제제 조치를 받을 수 있습니다." readonly></textarea>
				                                    </div>
				                                    <div id="registerBtn">
				                                        <button id="register">등록</button>
				                                    </div>
			                                    </c:when>
			                                    <c:otherwise>
			                                     <!-- 로그인한 경우 댓글 입력 -->
			                                    	<div id="input">
				                                        <textarea id="replyInput" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제제 조치를 받을 수 있습니다." ></textarea>
				                                    </div>
				                                    <div id="registerBtn">
				                                        <button id="register" onclick="addReply();">등록</button>
				                                    </div>
			                                    </c:otherwise>
		                                    </c:choose>
		                                    
		                                </div>
		                                <div id="modalLink">
		                                    <a href="#">운영원칙</a>
		                                    <!--운영원칙 모달창-->
		                                    <div class="modal">
		                                        <div class="modalTitle">
		                                            <div id="title">운영원칙</div>
		                                            <div id="close">&times;</div>
		                                        </div>
		
		                                        <div class="modalContent">
		                                            <p>
		                                                FILOOM 은 올바른 커뮤니티를 지향하기 위해 몇 가지 운영원칙을 마련하고 있습니다. <br>
		                                                운영원칙에 어긋나는 게시물로 판단되는 글은 적발 시, 경고 없이 삭제되며 아이디 중지 등의 <br>
		                                                제재 조치를 받을 수 있습니다.
		                                            </p>
		                                            <p>FILOOM 은 보다 건전한 인터넷 문화를 지향합니다.</p>
		                                            <div id="deleteRull">
		                                                <p id="rull">
		                                                    <b style="font-size: 20px;">게시물 삭제 기준</b><br>
		                                                    * 개인정보(실명, 상호명, 사진, 전화번호, 주민등록번호 등) 유포<br>
		                                                    * 동일 내용의 게시글 / 댓글 반복(도배)<br>
		                                                    * 특정인 대상의 <b style="color : red;">비방 / 욕설</b> 등의 표현으로 불쾌감을 주는 내용<br>
		                                                    * 음란성 또는 청소년에게 부적합한 내용<br>
		                                                    * 서비스 취지(성격)에 맞지 않은 내용<br>
		                                                    * <b style="color : red;">비방 / 허위사실 유포</b> 등의 명예훼손 관련 게시물<br>
		                                                    * 저작권 관련 게시물 등 기타 관련 법률에 위배되는 글<br>
		                                                </p>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </td>
		
		                        </tr>
		                    </thead>
		
		                    <tbody>
		                        <tr>
		                            <!--수정상황-->
		                            <td id="replyWriter">us****</td>
		                            <td class="replyContent">
		                                
		                                    
		                                        <textarea id="updateReplyContent">모아나 정말 보고싶어용! 저희 엄마가 좋아해여!</textarea>
		                                        
		                                        <button id="saveBtn">저장</button>
		                                        <button id="cancelBtn">취소</button>
			                                    
		                                     
		                                
		                            </td>
		                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
		                        </tr>
		
		                        <!--댓글작성자인 경우, 수정 삭제 버튼 
		                        <tr>
		                            <td id="replyWriter">us****</td>
		                            <td id="replyContent">
		                                모아나 정말 보고싶어요! 저희 아빠가 좋아해여!
		                                <button id="updateBtn">수정</button>
		                                <button id="deleteBtn">삭제</button>
		                            </td>
		                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
		                        </tr> -->
		                        
		                    </tbody>
		                </table>
		            </div>
            	</c:when>
            	<c:when test="${requestScope.e.eventType == 2 }">
            		<div class="apply">
            			<button id="applyBtn">응모하기</button>
            		</div>
            	</c:when>
            	<c:otherwise>
            		
            	</c:otherwise>
            </c:choose>
        
            

        </div>

    </div>
    
    <!-- 댓글 관련 스크립트 -->
    <script>
    // 로그인 유저 정보
    var loginUser = '${sessionScope.loginUser.userId}'; // jsp 에서 로그인한 ID를 가져오기
    
    	$(function() {
    		// console.log("왜 안돼..?");
    		selectReplyList();
    		// console.log("목록조회도 안돼?");
    		// 실시간 댓글 등록 효과 
    		//setInterval(selectReplyList, 1000);
    	});
    	
    	// 댓글 작성용 함수 
    	function addReply() {
    		
    		// 댓글 내용은 not null 일 수 없으니 입력한 댓글 내용이 있는지 검사 후 진행 
    		let replyContent = $("#replyInput").val();
    		// console.log(replyContent.trim().length);
    		// > 댓글 내용 문자열 기준으로 앞뒤 공백 제거해준 후 문자열의 길이가 0과 일치하지 않으면 내용이 있는걸로 판별 
    		
    		if(replyContent.trim().length != 0) { // 댓글 내용이 있다면 
    			// > 댓글 작성용 ajax 요청 
    			$.ajax({
    				url : "rinsert.ev",
    				type : "post",
    				data : {
    					replyContent : replyContent,
    					replyWriter : "${ sessionScope.loginUser.userNo }",
    					refEno : ${requestScope.e.eventNo}
    				}, 
    				success : function(result) {
    					if(result == "success") {
    						selectReplyList();
    						$("#replyInput").val("");
    						console.log("여기까지 오나?");
    					} else {
    						alert("댓글 작성 실패");
    						$("#replyInput").val("");
    					}
    				}, 
    				error : function() {
    					console.log("댓글 작성용 ajax 통신 실패!");
    				}
 
    			});
    			
    		} else { // 댓글 내용이 없는 경우 
    			// alert 로 알려주기 
    			alert("댓글 작성 후 등록해주세요.");
    			
    		}

    	}
    	
    	// 댓글 목록조회용 함수 
    	function selectReplyList() {
    		// console.log("경로 찾았어?");
    		$.ajax({
    			url : "rlist.ev",
    			type : "get",
    			data : {eno : ${requestScope.e.eventNo}},
    			success : function(result) {
    				let resultStr ="";
    				
    				
    				for(let i=0; i<result.length; i++) {
    					resultStr += "<tr data-reply-no='" + result[i].replyNo + "'>"
    									+ "<td id='replyWriter'>" + result[i].replyWriter + "</td>"
    									+ "<td class='replyContent'>" + result[i].replyContent; 
    									
    									// 로그인한 사용자와 댓글 작성자가 동일한 경우 수정 / 삭제 버튼 추가 
    				    				if(result[i].replyWriter === loginUser) {
    				    					 resultStr +="<button id='updateBtn' onclick='editReply(" + result[i].replyNo + ");'>수정</button>"
    				    					 			+"<button id='deleteBtn' onclick='deleteReply(" + result[i].replyNo + ");'>삭제</button>";
    				    				 }

    									resultStr += "</td>"
    									+ "<td id='replyDate'>" + result[i].createDate + "</td>"
    							   +"</tr>"
    							   // console.log("수정, 삭제 버튼 왜 안보여?");
    							   // console.log("replyWriter : " + result[i].replyWriter);
    							   // console.log("loginUser : " + result[i].loginUser);
    							   
    				}
    				$(".reply>tbody").html(resultStr);
    				$("#rcount").text(result.length); // 댓글 갯수 표시
    			},
    			error : function() {
    				console.log("댓글리스트 조회용 ajax 통신 실패!");
    			}
    		});
    	}
    	
    	// 댓글 수정용 함수
    	function editReply(replyNo) {
    		let row = $("tr[data-reply-no='" + replyNo + "']");
    	    // console.log("Row element:", row); // 콘솔에서 tr 요소가 선택되는지 확인
    	    
    	    let replyContentCell = row.find("td").eq(1); // 두번째 td가 댓글 내용
    	    // console.log("replyContentCell:", replyContentCell); // td.replyContent가 제대로 선택되는지 확인
    	    
    	    let originalContent = replyContentCell.text().trim();  // 원본 댓글 내용
    	    // console.log("originalContent : ", originalContent);
    	    
    	 	// 댓글의 원본 내용을 data로 저장
    	    row.data("originalContent", originalContent); // 원본내용 저장

    	    
    	 	// 댓글 내용 텍스트 영역으로 변경
    	    replyContentCell.html('<textarea id="updateReplyContent">' + originalContent + '</textarea>');
    	    
    	 	// 버튼 영역을 "저장"과 "취소" 버튼으로 변경
    	    let buttonCell = row.find("td").eq(1);
    	 	// buttonCell.html('');
    	    // console.log(buttonCell);
    	    // buttonCell.empty();
    	    
    	    // "저장" 버튼 추가
    	    buttonCell.append('<button id="saveBtn" class="btn" onclick="saveEditedReply(' + replyNo + ')">저장</button>');
    	    // "취소" 버튼 추가
    	    buttonCell.append('<button id="cancelBtn" class="btn" onclick="cancelEditReply(' + replyNo + ')">취소</button>');
    	}

    	// 댓글 수정 저장 함수
    	function saveEditedReply(replyNo) {
    	    let updatedContent = $("#updateReplyContent").val(); // 수정된 내용 가져오기
    	 	// 댓글 작성자를 가져옵니다 (서버에서 해당 데이터를 넘기면 좋습니다)
    	    let writer = $("tr[data-reply-no='" + replyNo + "']").data("writer"); // 예시로, 댓글을 작성한 사용자의 정보를 HTML에서 data attribute로 전달했다고 가정
    	    let row = $("tr[data-reply-no='" + replyNo + "']");
    	    
    	    // Ajax로 서버에 수정된 댓글 내용 보내기
    	    $.ajax({
    	        url: "rupdate.ev", // 수정할 주소
    	        type: "POST",
    	        data: JSON.stringify({replyNo: replyNo, replyContent: updatedContent, replyWriter: "${ sessionScope.loginUser.userNo }" }),
    	        contentType: "application/json; charset=UTF-8",
    	        success: function(response) {
    	            if (response.status === "success") {
    	                alert(response.message);
    	                row.find("td.replyContent").text(updatedContent); // 댓글 내용 수정
    	                // 버튼을 "수정"과 "삭제" 버튼으로 복원
    	                let buttonCell = row.find("td").eq(1);
    	                // buttonCell.html('');
    	                buttonCell.append('<button id="updateBtn" onclick="editReply(' + replyNo + ')">수정</button>');
    	                buttonCell.append('<button id="deleteBtn" onclick="deleteReply(' + replyNo + ')">삭제</button>');
    	            } else {
    	                alert(response.message);
    	            }
    	        },
    	        error: function() {
    	            alert("댓글 수정에 실패했습니다.");
    	        }
    	    });
    	}

    	// 댓글 수정 취소 함수
    	function cancelEditReply(replyNo) {
    	    let row = $("tr[data-reply-no='" + replyNo + "']");

    	    // 댓글 원본 내용 가져오기 (최초 상태)
    	    let originalContent = row.data("originalContent"); // 이전에 저장한 댓글 원본 내용
    	    
    	    // 텍스트를 원본 내용으로 복원
    	    let replyContentCell = row.find("td.replyContent");
    	    replyContentCell.text(originalContent); // 기존 내용 복원
    	    
    	    // 버튼을 "수정"과 "삭제" 버튼으로 복원
    	    let buttonCell = row.find("td").eq(1);
    	    // buttonCell.html(''); // 기존 버튼 제거
    	    buttonCell.append('<button id="updateBtn" onclick="editReply(' + replyNo + ')">수정</button>');
    	    buttonCell.append('<button id="deleteBtn" onclick="deleteReply(' + replyNo + ')">삭제</button>');
    	}
    	
    	// 댓글 삭제
    	function deleteReply(replyNo) {
    	    $.ajax({
    	        url: "rdelete.ev",  // 삭제 요청 URL
    	        type: "POST",       // POST 방식
    	        data: { replyNo: replyNo },  // 삭제할 댓글 번호 전달
    	        success: function(response) {
    	            if (response === "success") {
    	                // 성공적인 삭제 시 해당 댓글을 DOM에서 삭제
    	                $("tr[data-reply-no='" + replyNo + "']").remove();
    	                alert("댓글이 삭제되었습니다.");
    	            } else {
    	                alert("댓글 삭제에 실패했습니다.");
    	            }
    	        },
    	        error: function() {
    	            console.log("댓글 삭제 요청 실패");
    	            alert("댓글 삭제 요청에 실패했습니다.");
    	        }
    	    });
    	}
    	
    
    </script>

    
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>