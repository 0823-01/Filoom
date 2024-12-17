<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세조회</title>
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

    /*상세조회 메뉴 영역*/
    .menu {
        display: flex;
        justify-items: left;
        gap : 25px;
        background-color: #E4E0E1;
        height : 40px;
        font-size: 25px;
        font-weight: bold;
        color : #493628;
        padding : 10px;
        border-radius: 4px;
        margin-bottom: 10px;
    }

    #title, #createDate, #count {
        padding: 3px;
    }

    #createDate {
        margin-left: 830px;
    }

    #count {
        margin-left: 60px;
    }

    /*내용, 다음글, 이전글 영역*/
    .content-list {
        border-radius: 4px;
        background-color: #F3F3F3;
    }

    /*내용*/
    #content {
        padding: 10px;
        font-size: 17px;
        border-bottom: 2.5px solid #493628;

    }

    /*다음글 영역*/
    .nextList {
        display: flex;
        justify-items: left;
        gap : 20px;
        border-bottom: 2.5px solid #493628;
    }

    #next {
        padding: 13px;
        background-color: #E4E0E1;
        font-size: 18px;
        font-weight: bold;
        color : #493628;
    }

    #next-list {
        padding: 13px;
        font-size: 18px;
        color : #493628;
    }

    #next-list>a {
        color : #493628;
        text-decoration: none;
    }

    #next-list>a:hover, #next-list>a:active {
        color : #AB886D;
    }

    /*이전글 영역*/
    .beforeList {
        display: flex;
        justify-items: left;
        gap : 20px;
    }

    #before {
        padding: 13px;
        background-color: #E4E0E1;
        font-size: 18px;
        font-weight: bold;
        color : #493628;
        border-radius: 0 0 0 4px;
    }

    #before-list {
        padding: 13px;
        font-size: 18px;
        color : #493628;
    }

    #before-list>a {
        color : #493628;
        text-decoration: none;
    }

    #before-list>a:hover, #before-list>a:active {
        color : #AB886D;
    }

    /*목록버튼*/
    #backList {
        background-color: #E4E0E1;
        color : #493628;
        font-size: 18px;
        font-weight: bold;
        width : 100px;
        margin-top: 30px;
        border : none;
        height: 30px;
    }

    #backList:active, #backList:hover {
        background-color: #AB886D;
        color : #F3F3F3;
        font-size: 18px;
        font-weight: bold;
        width : 100px;
        margin-top: 30px;
        border : none;
        height: 30px;
        cursor: pointer;
    }


</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <!--전체영역을 감싸는 container-->
    <div class="container">
        <h2 style="color : #E4E0E1;">공지사항</h2>
        <h3 style="color : #E4E0E1; ">FILOOM의 주요한 이슈 및 여러가지 소식들을 확인할 수 있습니다.</h3>
        
        <!--공지사항 상세조회 메뉴-->
        <div class="detail-area">
            <div class="menu">
                <div id="title">2025  2026 VIP 멤버십 운영 변경 안내</div>
                <div id="createDate">작성일&emsp;2014-12-03</div>
                <div id="count">조회수&emsp;5000</div>
            </div>

            <div class="content-list">
                <div id="content">
                    안녕하세요. FlLoom입니다. <br>
                    2025년 VIP 멤버십 운영 및 2026sus VIP 멤버십 등급 변경 안내 드리오니 변경사항을 확인하시어 이용에 불편 없으시길 바랍니다.<br><br>
                    [2025 VIP 멤버십 운영 변경사항]<br>
                    - 등급 기준 및 제공 혜택 변동 없으며, 관련 내용은 하기 이벤트 페이지 확인 부탁드립니다.<br>
                    - httP://www.filoom.co.kr.asdfasdfasdfasdfasf <br><br>

                    [VIP 승급금액 미반영 기준 추가]<br>
                    - 관람권 사용 시 VIP 승급금액 미반영<br>
                    - 상영일 기준 1일 영화예매 4건 초과분에 대한 결제 금액<br><br>

                    [2025 VIP 멤버십 운영 변경사항]<br>
                    - 등급 기준 및 제공 혜택 변동 없으며, 관련 내용은 하기 이벤트 페이지 확인 부탁드립니다.<br>
                    - httP://www.filoom.co.kr.asdfasdfasdfasdfasf <br><br>

                    감사합니다.
                </div>
            
                <div class="nextList">  
                    <div id="next">다음글&emsp;︿  </div>
                    <div id="next-list" ><a href="#">다음 글이 없습니다.</a></div>
                </div>
                <div class="beforeList">  
                    <div id="before">이전글&emsp;︿  </div>
                    <div id="before-list"><a href="#">안녕안녕</a></div>
                </div>
            
            </div>

        </div>

			<div align="center">
		        <button id="backList">목록</button>
		    </div>
            
        </div>


    <jsp:include page="../common/footer.jsp" />
<title>Insert title here</title>
</head>
<body>

</body>
</html>