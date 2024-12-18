<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

                <!-- 혜원 - 쿠폰 목록 -->
                <div id = "admin_title_content" style="box-sizing: border-box;">
                    <div class="menu">
                        <div id="no">번호</div>
                        <div id="title">이벤트명</div>
                        <div id="type">타입</div>
                        <div id="createDate">발급일</div>
                        <div id="endDate">유효일</div>
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

                    <table>
                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        <tr id="list">
                            
                            <td id="couponNo">1</td>
                            <td id="eventTitle">[대가족] 22024.12.31 대가족 시사회</td>
                            <td id="couponType">무대/시사회</td>
                            <td id="couponDate">2024-12-01</td>
                            <td id="couponEndDate">2024-12-31</td>
                            <td id="couponStatus">Y</td>
                        </tr>

                        

                        
                    </table>

                    <!--페이징바-->
                    <div class="pagingArea">
                        <ul class="pagination">
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

                    <!--버튼--> 
                    <div class="btn">
                        <button id="couponeEnrollFormBtn">쿠폰 등록</button>
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