<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

       #back, #applicantBtn {
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

        #back:hover, #applicantBtn:hover {
            transform: scale(1.1em);
        }

        #back:active, #applicantBtn:active {
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
                        <div id="no">번호</div>
                        <div id="title">응모내용</div>
                        <div id="applicants">응모자</div>
                        <div id="date">응모날짜</div>
                        <div id="drawing">추첨여부</div>
                        <div id="win">당첨여부</div>
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
                        	<c:forEach var="a" items="${requestScope.alist }">
	                        	<tr id="list" class="applicant-item">
		                            <td id="applicantNo" class="ano">${a.applicantNo }</td>
		                            <td id="eventTitle">버튼클릭!</td>
		                            <td id="applicant">${a.userNo}</td>
		                            <td id="applicantDate">${a.applicationDate }</td>
		                            <td id="drawingStatus">${a.drawingStatus }</td>
		                            <td id="winStatus">${w.winStatus }</td>
	                        	</tr>
                        	</c:forEach>
                        </tbody>

                    </table>

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
	                        <button id="applicantBtn">당첨자 추첨</button>
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
    
 	// 당첨자 추첨 
    document.getElementById("applicantBtn").addEventListener("click", function() {
        // 화면에 출력된 목록에서 데이터 추출 (클래스명에 따라 대상 선택)
        const applicants = document.querySelectorAll(".applicant-item"); // 응모자 데이터 탐색 (tr 태그)

        // 댓글 작성자명 추출
        const names = Array.from(applicants).map(item => {
            return item.querySelector("#applicant").textContent.trim(); // 응모자 이름 가져오기
        });
        
        if (names.length === 0) {
            alert("추첨 가능한 응모자가 없습니다.");
            return;
        }

        const winnerCount = 10; // 당첨자 수
        const winners = []; // 당첨자 목록

        // 중복되지 않게 당첨자 10명 뽑기
        while (winners.length < winnerCount && names.length > 0) {
            const randomIndex = Math.floor(Math.random() * names.length);
            const winner = names[randomIndex];
            winners.push(winner);
            names.splice(randomIndex, 1); // 뽑은 사람을 배열에서 제거
        }

     	// 당첨자 출력
        if (winners.length > 0) {
            alert("🎉 당첨자: " + winners.join(", "));
            
	        // 추첨 후 버튼 비활성화 및 텍스트 변경
	        const enrollButton = document.getElementById("applicantBtn");
	        enrollButton.disabled = true;  // 버튼 비활성화
	        enrollButton.textContent = "당첨자 추첨 완료";  // 버튼 텍스트 변경
	
	        // 추첨 후 상태 업데이트 (서버로 상태 보내기)
	        updateDrawingStatus(eventNo);
	        
	        // 쿠폰 발송 로직 호출 (추첨된 사람들에게 쿠폰 발급)
	        sendCoupons(winners);
	    } else {
	        alert("추첨 가능한 인원이 부족합니다.");
	    }
    });
    </script>
    
</body>
</html>