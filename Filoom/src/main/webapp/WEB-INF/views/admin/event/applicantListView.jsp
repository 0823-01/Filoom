<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>응모자 목록조회</title>
<link rel="stylesheet" href="resources/css/admin.css" />
    <style>
        /*메뉴 부분*/
        #titleContent {
            height : 65px;
            font-size: 30px;
            font-weight: bold;
            color : #493628;
        }

        .menu {
            box-sizing: border-box;
            padding: 5px;
            margin: 5px;
            width : 100%;
            display: flex;
            justify-content: left;
            gap : 10px;
        }

        #no, #title, #applicants, #date, #drawing {
            box-sizing: border-box;
            font-size: 25px;
            font-weight: bold;
            color : #493628;
            padding: 13px 0;
        }

        #no {
            margin-left: 50px;
        }

        #title {
            margin-left: 50px;
        }

        #applicants {
            margin-left: 480px;
        }

        #date {
            margin-left: 195px;
        }

        #drawing {
            margin-left: 126px;
        }


        
        /*목록영역*/
        table {
            border : none;
            border-collapse: collapse;
            box-sizing: border-box;
            width : 100%;
        }

        #list {
            height : 63px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 2.5px solid #493628;
            text-align: center;
        }

        #list:hover {
            background-color: white;
            border-bottom : 2px solid #493628;
            text-align : center;
            font-weight: bold;
            height : 63px;
        }

        #applicantNo {
            width : 10%;
        }

        #eventTitle {
            width : 40%;
            text-align: left;
            cursor: pointer;
        }

        #applicant {
            width : 10%;
            text-align: left;
        }

        #applicantDate {
            width : 20%;
        }

        #drawingStatus {
            width : 10%;
        }

        /*페이징영역*/
        
        .foot {
        	box-sizing : border-box;
        	display: flex;
        	justify-content: center;
        	align-items : center;
        	flex-direction: column;
        	position: relative;
        
        }
        
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
		
		.pagination>li>a {
		    margin : 0 10px; /*리스트 항목 간의 간격*/
		    cursor: pointer;
		    transition: color 0.3s ease; /*색상 전환 효과*/
		    font-size: 25px;
		    font-weight: bold;
		    color : #493628;
		    text-decoration : none;
		}
		
		.pagination>li>a:hover {
		    text-decoration-line: none;
		    color : #AB886D;
		}

		.pagination > li>a.active {
		    color: #493628; 
		}
		
		.pagination .active .page-link {
	
		    color: #AB886D;
	
		}
		
		.pagination .page-link {
		    color: #493628; 
		    text-decoration: none;
		}
		
		.pagination .disabled .page-link {
		    color: #ccc;
		    pointer-events: none;
		    cursor: default;
		}

        /*버튼*/
        .btn {
            padding-right : 13px;
            box-sizing: border-box;
            display: flex;
            justify-content: flex-end;
            gap : 10px;
            position: absolute; 
            right: 0;
        }

       #back, #couponList {
            width: 170px;
            height: 38px;
            border: none;
            border-radius: 5px;
            color: #D2CECF;
            font-size: 20px;
            font-weight: bolder;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            background-color: #493628;1
            cursor: pointer;
        }

        #back:hover, #couponList:hover {
            transform: scale(1.1em);
        }

        #back:active, #couponList:active {
            background-color: #AB886D;
        }
        
    </style>

</head>
<body>
    <div id = "admin_content">
        <div id = "navbar">
            
            <div id = "logo">
                <img src="../main/Filoom.png">
            </div>
           
            <div id = "nav">
                <ul>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                </ul>
    
            </div>
        </div>
        <div id = "admin_right">
            <div id ="admin_title">

                <!-- 혜원 - 버튼 응모자 목록 -->
                <div id = "admin_title_content" style="box-sizing: border-box;">
                    <div class="menu">
                    	<c:forEach var="item" items="${alist}">
						    <input type="hidden" id="eventNo" value="${eventNo}"> <!-- eventNo 값이 넘어옴 -->
						    <input type="hidden" id="couponNo" value="${couponNo}"> <!-- couponNo 값이 넘어옴 -->
						    <input type="hidden" id="userNo" value="${userNo}"> <!-- userNo 값이 넘어옴 -->
						</c:forEach>
                        <div id="no">번호</div>
                        <div id="title">응모내용</div>
                        <div id="applicants">응모자</div>
                        <div id="date">응모날짜</div>
                        <div id="drawing">당첨여부</div>
                        
                    </div>
                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 혜원 목록테이블-->
                <div id ="admin_page">
                    <!--이건 버튼 이랑 text 샘플
                    <input type ="text" id ="text_sample">
                    <input type="button" id ="button_sample" value="샘플">-->

                    <table id="applicantList">
                        <tbody>
                        	<c:forEach var="item" items="${alist }">
	                        	<tr id="list" class="applicant-item" data-event-no="${item.eventNo}" data-coupon-no="${item.couponNo}" data-user-no="${item.userNo}">
		                          
		                           	<td id="applicantNo" class="ano">${item.applicantNo }</td>
		                           	<td id="eventTitle">${item.eventTitle}</td>
		                           	<td id="applicant">${item.userId}</td>
		                          	<td id="applicantDate">${item.applicationDate }</td>
		                            <td id="a">
		                            	<c:if test="${item.drawingStatus == 'Y'}">
		                            		쿠폰 발급 완료
		                            	</c:if>
		                            	<c:if test="${item.drawingStatus == 'N'}">
		                            		<select name="drawingStatus" id="drawingStatusSelect" 
										        onchange="updateDrawingStatus(this)">
										    <option value="N" ${item.drawingStatus == 'N' ? 'selected' : ''}>N</option>
										    <option value="Y" ${item.drawingStatus == 'Y' ? 'selected' : ''}>Y</option>
										</select>
		                            	</c:if>

		                            </td>

	                        	</tr>
                        	</c:forEach>
                        </tbody>

                    </table>
                    
                    <script>
	                    function insertCoupon(userNo, couponNo, eventNo, selectElement) {
	                    	
	                        // console.log("Event No: " + eventNo + ", Coupon No: " + couponNo + ", User No: " + userNo);
	                        
	                        $.ajax({
	                            url: "sendCoupon.ev", // 서버의 URL
	                            type: "POST",
	                            data: {
	                            	userNo: userNo,    // userNo를 전달
	                                couponNo: couponNo,
	                                eventNo: eventNo
	                            },
	                            success: function(response) {
	                                if (response.success) {
	                                	console.log(response);
	                                    alert("쿠폰이 성공적으로 발급되었습니다!");
	                                    $(selectElement).closest('td').html('발급 완료');
	                                } else {
	                                	alert("발급 실패: " + response.message);
	                                }
	                            },
	                            error: function() {
	                                alert("서버와 통신 중 오류가 발생했습니다.");
	                            }
	                        });
	                    }
                    
	                 	// 2. updateDrawingStatus 함수 정의
	                    function updateDrawingStatus(selectElement) {
	                    	// 선택된 select box의 부모 tr을 찾고, 그 트리에서 data-* 속성으로 값을 가져옵니다.
	                        var parentRow = $(selectElement).closest('.applicant-item');
	                        var eventNo = $(parentRow).data('event-no');
	                        var couponNo = $(parentRow).data('coupon-no');
	                        var userNo = $(parentRow).data('user-no')
	                 		
	                 		
	                 		// drawingStatus가 "Y"로 변경되었을 때만 쿠폰 발급 함수 호출
						    if (selectElement.value === "Y") {
						        // 응모자 회원 번호와 쿠폰 번호를 넘겨서 insertCoupon 함수 호출
						        insertCoupon(userNo, couponNo, eventNo, selectElement);
						    }
						}
	                 
					</script>

                    <div class="foot" style="box-sizing: border-box;" >
                        <!-- 페이징바 -->
					    <div class="pagingArea">
					        <ul class="pagination" id="pagination">
					            <!-- 이전 페이지 버튼 -->
					            <c:choose>
					                <c:when test="${requestScope.pi.currentPage == 1}">
					                    <li class="page-item disabled">
					                        <a class="page-link" href="#">«</a>
					                    </li>
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item">
					                        <a class="page-link" href="alist.ev?cpage=${requestScope.pi.currentPage - 1}">«</a>
					                    </li>
					                </c:otherwise>
					            </c:choose>
					
					            <!-- 페이지 번호 출력 -->
					            <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}">
					                <li class="page-item ${p == requestScope.pi.currentPage ? 'active' : ''}">
					                    <a class="page-link" href="alist.ev?cpage=${p}">${p}</a>
					                </li>
					            </c:forEach>
					
					            <!-- 다음 페이지 버튼 -->
					            <c:choose>
					                <c:when test="${requestScope.pi.currentPage < requestScope.pi.maxPage}">
					                    <li class="page-item">
					                        <a class="page-link" href="alist.ev?cpage=${requestScope.pi.currentPage + 1}">»</a>
					                    </li>
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item disabled">
					                        <a class="page-link" href="#">»</a>
					                    </li>
					                </c:otherwise>
					            </c:choose>
					        </ul>
					    </div>
           				
           				<!--버튼--> 
	                    <div class="btn">
	                    	<button id="back" onclick="history.back();">이전으로</button>
							
	                        <a href="clist.ev?eventNo=${e.eventNo}&cpage=1">
	                        	<button id="couponList">쿠폰발급하기</button>
                        	</a>
	                        <!--추첨이 완료된 경우, 버튼 조작 불가-->
	                        
	                    </div>
           				
		    		</div>

                </div>


            </div>
        </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const navItems = document.querySelectorAll("#nav > ul > li");
    
        navItems.forEach(item => {
            item.addEventListener("click", function () {
                // 모든 항목에서 selected 클래스 제거
                navItems.forEach(nav => nav.classList.remove("selected"));
    
                // 클릭된 항목에 selected 클래스 추가
                this.classList.add("selected");
            });
        });
    });
    
	/*
    $(document).ready(function() {
        // eventNo 값 가져오기
        var eventNo = $('#eventNum').val();
        console.log("eventNo는 " + eventNo);  // 확인하기 위해 로그 출력

        // 사용자 번호 가져오기
        var userNo = $("#applicant").text();  // 텍스트 값 가져오기
		console.log("userNo는 : " + userNo);

        // drawingStatus 선택 값이 변경될 때마다 AJAX 호출
        $('select[name="drawingStatus"]').change(function() {
            var selectedStatus = $(this).val();  // 선택된 값 가져오기
            console.log('selectedStatus:', selectedStatus);  // 선택된 값이 출력되는지 확인

            $.ajax({
                url: 'insertCoupon.co',  
                type: 'POST',  
                data: {
                    userNo: userNo,  // 사용자 번호
                    eventNo: eventNo  // 이벤트 번호
                },
                success: function(response) {
                    console.log('응답:', response);  // 성공적으로 응답을 받았을 때 처리할 코드
                    alert('상태가 변경되었습니다.');
                },
                error: function(xhr, status, error) {
                    console.error('에러 발생:', error);  // 오류 발생 시 처리할 코드
                    alert('상태 변경 중 오류가 발생했습니다.');
                }
            });
        });
    }); */
    
    /*
    function updateDrawingStatus(selectElement) {
        // 선택된 응모자 상태 값
        var newStatus = selectElement.value;

        // 응모자의 고유 식별자 (예: 응모자 번호)
        var applicantNo = selectElement.getAttribute('data-applicant-no');

        // 상태값이 "Y"로 변경되었을 때, 쿠폰 발급을 처리하기 위해 AJAX 요청 보내기
        if (newStatus === "Y") {
            $.ajax({
                url: 'sendCoupon.ev',  // 서버에서 쿠폰을 발급하는 엔드포인트
                type: 'POST',
                data: {
                    applicantNo: applicantNo,
                    status: newStatus
                },
                success: function(response) {
                    // 서버에서 응답을 받은 후 처리
                    if (response.success) {
                        alert('쿠폰이 발급되었습니다!');
                    } else {
                        alert('쿠폰 발급에 실패하였습니다.');
                    }
                },
                error: function() {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    } */
    </script>
    
</body>
</html>