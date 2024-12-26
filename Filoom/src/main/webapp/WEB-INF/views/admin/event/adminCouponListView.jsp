<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>쿠폰 목록 조회</title>
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

        #no, #title, #type, #createDate, #endDate, #status {
            box-sizing: border-box;
            font-size: 25px;
            font-weight: bold;
            color : #493628;
            padding: 13px 0;
        }

        #no {
            margin-left: 45px;
        }

        #title {
            margin-left: 40px;
        }

        #type {
            margin-left: 505px;
        }

        #createDate {
            margin-left: 103px;
        }

        #endDate {
            margin-left: 130px;
        }

        #status {
            margin-left: 83px;
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

        #couponNo {
            width : 10%;
        }

        #eventTitle {
            width : 40%;
            text-align: left;
            cursor: pointer;
        }

        #couponType {
            width : 10%;
        }

        #couponDate {
            width : 15%;
        }

        #couponEndDate {
            width: 15%;
        }

        #couponStatus {
            width : 10%;
        }

        /*페이징영역*/
        .pagingArea {
            width : fit-content;
            margin:auto;
        }
        .pagination {
            list-style-type : none;
        }
        .pagination>li {
            float : left;
            font-size : 20px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 3px;
        }
        li>a {
            text-decoration-line: none;
            color : black;
        }
        li>a:active {
            text-decoration-line: none;
            color : #AB886D;
        }

        /*버튼*/
        .btn {
            padding-right : 13px;
            text-align: right;
            box-sizing: border-box;
            display: flex;
            justify-content: flex-end;
            gap : 10px;
        }

       #couponeEnrollFormBtn {
            width: 170px;
            height: 38px;
            border: none;
            border-radius: 5px;
            color: #D2CECF;
            font-size: 20px;
            font-weight: bolder;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            background-color: #493628;
            cursor: pointer;
        }

        #couponeEnrollFormBtn:hover {
            transform: scale(1.1em);
        }

        #couponeEnrollFormBtn:active {
            background-color: #AB886D;
        }
        
    </style>

</head>
<body>
    <div id = "admin_content">
    <jsp:include page="../../common/adminHeader.jsp" />
        <div id = "admin_right">
            <div id ="admin_title">

                <!-- 혜원 - 쿠폰 목록 -->
                <div id = "admin_title_content" style="box-sizing: border-box;">
                    <div class="menu">
                        <div id="no">번호</div>
                        <div id="title">쿠폰이름</div>
                        <div id="type">타입</div>
                        <div id="createDate">유효기간</div>
                        <div id="endDate">보유자</div>
                        <div id="status">유효여부</div>
                    </div>
                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 혜원 목록테이블-->
                <div id ="admin_page">
                    <!--이건 버튼 이랑 text 샘플
                    <input type ="text" id ="text_sample">
                    <input type="button" id ="button_sample" value="샘플">-->

                    <table id="couponList">
                        <tbody>
                        	<c:choose>
                        		<c:when test="${not empty requestScope.list }">
                        			<c:forEach var="c" items="${requestScope.list }">
                        				<tr id="list">
				                            <td id="couponNo">${c.couponNo }</td>
				                            <td id="eventTitle">${c.couponName }</td>
				                            <td id="couponType">${c.couponLevel }</td>
				                            <td id="couponDate">${c.couponExpDate }</td>
				                            <td id="couponEndDate">dd</td>
				                            <td id="couponStatus">${c.couponStatus }</td>
				                        </tr>
                        			</c:forEach>
                        		</c:when>
                        		
                        		<c:otherwise>
                       				<tr>
                       					<td colspan="6" style="text-align: center; color : black; font-size : 50px;">현재 응모자가 없습니다.</td>
                       				<tr>
                       			</c:otherwise>
                        	</c:choose>
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
					                        <a class="page-link" href="clist.ev?cpage=${requestScope.pi.currentPage - 1}">«</a>
					                    </li>
					                </c:otherwise>
					            </c:choose>
					
					            <!-- 페이지 번호 출력 -->
					            <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}">
					                <li class="page-item ${p == requestScope.pi.currentPage ? 'active' : ''}">
					                    <a class="page-link" href="clist.ev?cpage=${p}">${p}</a>
					                </li>
					            </c:forEach>
					
					            <!-- 다음 페이지 버튼 -->
					            <c:choose>
					                <c:when test="${requestScope.pi.currentPage < requestScope.pi.maxPage}">
					                    <li class="page-item">
					                        <a class="page-link" href="clist.ev?cpage=${requestScope.pi.currentPage + 1}">»</a>
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
	                        <button id="couponeEnrollFormBtn" onclick="history.back();">이전으로</button>
	                        <!--추첨이 완료된 경우, 버튼 조작 불가-->
	                        
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
    </script>
    
</body>
</html>