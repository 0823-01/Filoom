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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    #listBtn>button, #updateBtn, #deleteBtn {
        height : 30px;
        width : 100px;
        color : #E4E0E1;
        background-color: #493628;
        border-radius: 4px;
        font-size: 15px;
        font-weight: bold;
        border : none;
    }

    #listBtn>button:hover, #updateBtn:hover, #deleteBtn:hover  {
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


    /*댓글 목록조회*/
       #replyWriter {
           text-align: center;
           width : 10%;
       }

       #replyDate {
           text-align: center;
           width : 20%;
       }

       #replyContent {
           width : 60%;
       }

       #buttons {
           width : 10%;
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
       }

       #updateReply {
           /*border: 1px solid red;*/
           resize: none;
           width : 100%;
           height: 100%;
           border: 2px solid #493628;
           background-color: #E4E0E1;
           border-radius: 4px;
           box-sizing: border-box;
       }

       #updateBtn, #deleteBtn, #savedBtn, #cancelBtn {
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

       #updateBtn:hover, #deleteBtn:hover,
       #savedBtn:hover, #cancelBtn:hover {
           background-color: #AB886D;
       }

       /*페이징영역*/
       .pagingArea {
           display: flex;
           justify-content: center;
           padding : 20px;
           font-size: 20px;
           font-weight: bold;

       }
       .pagination {
           list-style-type : none;
           display: flex;
           padding : 0;
           margin: 0;
           font-size: 20px;
           font-weight: bold;
       }
       .pagination>li {
           margin : 0 10px; /*리스트 항목 간의 간격*/
           cursor: pointer;
           transition: color 0.3s ease; /*색상 전환 효과*/
           font-size: 25px;
           font-weight: bold;
           color : #F3F3F3;
       }

       li>a {
           text-decoration: none;
           color :  #493628;
       }

       li>a:hover {
           text-decoration: none;
           color : #AB886D;
       }

       li>a.disabled {
           color: #AB886D;
           pointer-events: none;
       }

       li>a.active {
           color: #AB886D;
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
    
    #disabledBtn {
    	height : 70px;
    	width : 500px;
    	color : #E4E0E1;
    	background-color : #AB886D;
    	border-radius : 4px;
    	font-size : 30px;
    	font-weight : bold;
    	border : none;
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
                
                <form id="postForm" action="" method="post">
                	<input type="hidden" name="eno" value="${requestScope.e.eventNo }">
                	<input type="hidden" name="filePath" value="${file.changeName }">
                </form>
                
                <div id="listBtn">
                    <button onclick="history.back()">목록으로</button>

                    <c:if test="${sessionScope.loginUser.userNo eq 1 }">
	                    <button id="updateBtn" onclick="postFormSubmit(1);">수정</button>
	                    <button id="deleteBtn" onclick="postFormSubmit(2);">삭제</button>
                    </c:if>
                </div>
            </div>
            
            <script>
            	function postFormSubmit(num) {
            		console.log(num);
            		
            		if(num == 1) {
            			$("#postForm").attr("action", "updateForm.ev").submit();
            		} else {
            			$("#postForm").attr("aciont", "${pageContext.request.contextPath}/delete.ev").submit();
            		}
            	}
            </script>
            
            
            <!-- 이벤트 타입에 따라 보여지는 화면이 다름 -->
            <c:choose>
            	
            	<c:when test="${requestScope.e.eventType == 1}">
            	   <!--댓글부분-->
		            <div class="reply-area">
		                <div id="replySize"><b style="color : #AB886D;" id="rcount">0</b>개의 댓글이 있습니다.</div>
		                <table class="reply">
		                    <thead>
		                        <tr>
		                            <td colspan="4" style="height : 50px">
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
		                                
		                            </td>
		
		                        </tr>
		                    </thead>
		
		                    <tbody>
		                       <tr>
	                            <!--수정상황-->
	                            <td id="replyWriter">us****</td>
	                            <td id="replyContent">
	                                <textarea id="updateReply" readonly>모아나 정말 보고싶어용! 저희 엄마가 좋아해여!</textarea>
	                            </td>
	                            <td id="buttons">
	                                <button id="savedBtn">저장</button>
	                                <button id="cancelBtn">취소</button>
	                            </td>
	                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
		                        </tr>
		
		                        <!--댓글작성자인 경우, 수정 삭제 버튼 -->
		                        <tr>
		                            <td id="replyWriter">us****</td>
		                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
		                            <td id="buttons">
		                                <button id="updateBtn">수정</button>
		                                <button id="deleteBtn">삭제</button>
		                            </td>
		                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
		                        </tr>
		                        <tr>
		                            <td id="replyWriter">us****</td>
		                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
		                            <td></td>
		                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
		                            
		                        </tr>
		                    </tbody>
		                </table>
		                
		                <!-- 댓글 페이징 영역 -->
		                <div class="pagingArea">
		                    <ul class="pagination" id="pagination">
		                        <li class="page-item disabled"><a class="page-link" href="#">«</a></li>
		                        <li class="page-item"><a class="page-link" href="#">1</a></li>
		                        <li class="page-item"><a class="page-link" href="#">2</a></li>
		                        <li class="page-item"><a class="page-link" href="#">3</a></li>
		                        <li class="page-item"><a class="page-link" href="#">4</a></li>
		                        <li class="page-item"><a class="page-link" href="#">5</a></li>
		                        <li class="page-item"><a class="page-link" href="#">6</a></li>
		                        <li class="page-item"><a class="page-link" href="#">7</a></li>
		                        <li class="page-item"><a class="page-link" href="#">8</a></li>
		                        <li class="page-item"><a class="page-link" href="#">9</a></li>
		                        <li class="page-item"><a class="page-link" href="#">10</a></li>
		                        <li class="page-item"><a class="page-link" href="#">»</a></li>
		                    </ul>
		                </div>
		            </div>
            	</c:when>
            	<c:when test="${requestScope.e.eventType == 2 }">
            		<form id="participateForm">
            			<input type="hidden" name="applicantNo" value="${requestScope.a.applicantNo }" />
            			<input type="hidden" name="refEno" value="${requestScope.e.eventNo != null ? requestScope.e.eventNo : 0  }"; />
            			<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo != null ? sessionScope.loginUser.userNo : 0  }"; />
            			<input type="hidden" name="applicationDate" value="${requestScope.a.applicationDate }" />
            			<input type="hidden" name="drawingStatus" value="${requestScope.a.drawingStatus }" />
            			<input type="hidden" id="endDate" name="endDate" value="${requestScope.e.endDate }" />
	            		<div class="apply">
	            			<c:if test="${sessionScope.loginUser != null }">
	            				<!-- 로그인 유저가 있을 경우 응모 가능 -->
								<button type="submit" id="applyBtn">응모하기</button>
	            			</c:if>
	            			
	            			<c:if test="${sessionScope.loginUser == null }">
	            				<!-- 로그인하지 않은 경우 메세지 표시 또는 비활성화-->
								<button id="disabledBtn" disabled>로그인 후 응모가능합니다.</button>
	            			</c:if>
	            			
	            		</div>
            		</form>
            	</c:when>
            	<c:otherwise></c:otherwise>
            </c:choose>
        
        </div>

    </div>
    
    <!-- 댓글 관련 스크립트 -->
    <script>
    var loginUser = '${sessionScope.loginUser.userId}';  // 로그인한 ID

    $(function() {
        selectReplyList(1); // 페이지 첫 로딩시 댓글 목록 조회
        // setInterval(selectReplyList, 10000); // 10초마다 댓글 목록 갱신
    });
    
	 // 댓글 작성자 가공 함수
	    function maskUsername(loginUser) {
	        if (loginUser.length <= 3) {
	            return loginUser[0] + '*'.repeat(loginUser.length - 1);
	        }
	        return loginUser.substring(0, 3) + '*'.repeat(loginUser.length - 3);
	    }

    // 댓글 목록 조회
    function selectReplyList(cpage = 1) {
        $.ajax({
            url: "rlist.ev", // 댓글 목록 조회 API URL
            type: "get",
            data: { eno: ${requestScope.e.eventNo}, cpage: cpage },
            success: function(response) {
                var resultStr = "";
                // 댓글 목록 렌더링
                if (response.list && Array.isArray(response.list)) {
                    response.list.forEach(function(reply) {
                        resultStr += "<tr data-reply-no='" + reply.replyNo + "'>";
                        
                     	// 댓글 작성자 마스킹 처리
                        var maskedWriter = maskUsername(reply.replyWriter);
                        resultStr += "<td id='replyWriter'>" + maskedWriter + "</td>";
                        
                        resultStr += "<td id='replyContent'>" + reply.replyContent + "</td>";

                        // 댓글 작성자와 로그인 유저가 같으면 수정 및 삭제 버튼 추가
                        if (reply.replyWriter === loginUser) {
                            resultStr += "<td id='buttons'><button id='updateBtn' onclick='editReply(" + reply.replyNo + ")'>수정</button><button id='deleteBtn' onclick='deleteReply(" + reply.replyNo + ")'>삭제</button></td>";
                        } else {
                            resultStr += "<td></td>";
                        }

                        resultStr += "<td id='replyDate'>" + reply.createDate + "</td>";
                        resultStr += "</tr>";
                    });

                    $(".reply>tbody").html(resultStr); // 댓글 내용 업데이트
                    $("#rcount").text(response.list.length); // 댓글 갯수 표시
                    handlePagination(response.pi, cpage); // 페이징 처리
                }
            },
            error: function() {
                console.error("댓글 목록 조회 실패");
            }
        });
    }

    // 댓글 작성 함수
    function addReply() {
        let replyContent = $("#replyInput").val();

        if(replyContent.trim().length != 0) { 
            $.ajax({
                url: "rinsert.ev", // 댓글 작성 API
                type: "post",
                data: {
                    replyContent: replyContent,
                    replyWriter: "${ sessionScope.loginUser.userNo }",
                    refEno: ${requestScope.e.eventNo}
                },
                success: function(result) {
                    if(result === "success") {
                        selectReplyList(); // 댓글 목록 갱신
                        $("#replyInput").val(""); // 입력창 비우기
                    } else {
                        alert("댓글 작성 실패");
                    }
                },
                error: function() {
                    alert("댓글 작성 오류");
                }
            });
        } else {
            alert("댓글을 작성해주세요.");
        }
    }
    
    
   // 수정, 저장 다시

    // 댓글 수정 취소
    function cancelEdit(replyNo) {
        selectReplyList(); // 댓글 목록 새로고침
    }

    // 댓글 삭제
    function deleteReply(replyNo) {
        $.ajax({
            url: "rdelete.ev", 
            type: "POST",
            data: { replyNo: replyNo },
            success: function(response) {
                if (response === "success") {
                    alert("댓글이 삭제되었습니다.");
                    selectReplyList(); // 댓글 목록 갱신
                } else {
                    alert("댓글 삭제 실패");
                }
            },
            error: function() {
                alert("댓글 삭제 오류");
            }
        });
    }

    // 페이징 처리 함수
    function handlePagination(pi, currentPage) {
        const totalPages = pi.totalPage;
        let paginationHtml = "";

        // 이전 페이지 버튼
        if (currentPage > 1) {
            paginationHtml += "<button class='pagination-btn' onclick='selectReplyList(" + (currentPage - 1) + ")'>«</button>";
        }

        // 페이지 번호 버튼
        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += "<button class='pagination-btn' onclick='selectReplyList(" + i + ")'>" + i + "</button>";
        }

        // 다음 페이지 버튼
        if (currentPage < totalPages) {
            paginationHtml += "<button class='pagination-btn' onclick='selectReplyList(" + (currentPage + 1) + ")'>»</button>";
        }

        // 페이징 영역 갱신
        $(".pagination").html(paginationHtml);
    }
    
    
 	// 응모버튼 스크립트 
    $('#applyBtn').click(function (e) {
        e.preventDefault(); // 기본 동작 방지

        // hidden 필드의 값 가져오기
        const refEno = $('input[name="refEno"]').val();
        const userNo = $('input[name="userNo"]').val();
        const applicationDate = $('input[name="applicationDate"]').val();
        const drawingStatus = $('input[name="drawingStatus"]').val();

        $.ajax({
            type: 'POST',
            url: 'apply.ev',
            contentType: 'application/json; charset=UTF-8',
            data: JSON.stringify({ 
                refEno: refEno, 
                userNo: userNo, 
                applicationDate: applicationDate, 
                drawingStatus: drawingStatus
            }),
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    alert("응모가 완료되었습니다!");
                } else {
                    alert(response.message);
                }
            },
            error: function (error) {
                console.error('Error:', error);
                alert('응모 처리 중 오류가 발생했습니다.');
            }
        });
    });
 	
 	// 이벤트 종료일에 따라 댓글창, 응모버튼 비활성화
    $(document).ready(function () {
        // 종료일 값을 가져오기
        var eventEndDateStr = "${e.endDate}"; // 서버에서 전달된 종료일
        // console.log("Original Event End Date String:", eventEndDateStr);

        // 문자열을 Date 객체로 변환 (yyyy-MM-dd 형식 가정)
        var eventEndDate = new Date(eventEndDateStr);
        // console.log("Parsed Event End Date:", eventEndDate);

        // 자정 기준으로 설정 (종료일 다음날 00:00:00)
        eventEndDate.setDate(eventEndDate.getDate() + 1); // 종료일 다음날로 이동
        eventEndDate.setHours(0, 0, 0, 0); // 자정 시점으로 설정
        // console.log("Adjusted Event End Date:", eventEndDate);

        // 현재 시간과 비교
        var currentDate = new Date();
        // console.log("Current Date:", currentDate);

        if (currentDate >= eventEndDate) {
            alert("이미 종료된 이벤트입니다.");
            $("#applyBtn").$("#replyInput").prop("disabled", true); // 버튼 비활성화
        }
    });
 
</script>


    
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>