<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트목록조회</title>
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

    /*메뉴영역*/
    .menu {
        border-bottom : 2.5px solid #F3F3F3;
        margin-top: 20px;
        padding : 20px;
        color : #F3F3F3;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    #title {
        font-size: 30px;
        /*border: 1px solid red;*/
    }

    #eventing, #winner, #evented {
        /*border: 1px solid red;*/
        padding: 5px;
        font-size: 20px;
    }

    #eventing {
        margin-left: 1185px;
    }

    #eventing>a, #winner>a, #evented>a {
        text-decoration: none;
        color : #F3F3F3;
    }

    #eventing>a:hover, #winner>a:hover, #evented>a:hover {
        color : #AB886D;;
    }

    /*추천 이벤트 영역*/
    .recommendEventArea {
        display: flex;
        justify-content : center;
        gap : 50px;
        padding: 20px;
        border : 2px solid #F3F3F3;
        border-radius: 4px;
        margin-bottom: 20px;
    }

    .recommendCard {
        width : 40%; 
        height : 100%;
        border-radius: 4px;
        box-shadow: 3px 3px 4px;
        transition-duration: 0.3s; /*0.3초만에 돌아옴*/
     
    }

    .recommendCard:hover {
        cursor: pointer;
        transform: scale(1.05, 1.05); /*가로세로 각각 1.05배씩 확대*/
        transition-duration : 0.5s; /*0.5chehddks*/
    }

    .recommendCard img {
        border-radius: 4px 4px 0 0;
        
    }

    .recommend-card-info {
        display: flex;
        background-color : #F3F3F3;
        color : black;
        font-size: 20px;
        font-weight: bold;
        border-radius: 0 0 4px 4px;
        padding : 20px;
    }

    #recommend-card-title {
        align-self: flex-start;
    }
    #recommend-card-date {
        margin-left : auto;
        font-size: 17px;
        padding : 3px;
        
    }

    /*이벤트별 목록 리스트*/
    .eventTitle-more {
        display: flex;
        justify-content: space-between;
        padding : 20px;
        border-bottom: 2px solid #F3F3F3;
    }

    #eventTitle {
        font-size: 23px;
        color : #F3F3F3;
        font-weight: bold;
    }

    #more>a {
        font-size: 23px;
        color : #F3F3F3;
        font-weight: bold;
    }

    
    #more>a:hover {
        color : #AB886D;
    }

    .card {
        display: flex;
        justify-content : space-between;
        padding: 20px;
    }

    .event-card {
        width : 23%;
        height : 100%;
    }

    .event-card:hover {
        cursor: pointer;
        transform: scale(1.05, 1.05); /*가로세로 각각 1.05배씩 확대*/
        transition-duration : 0.5s; /*0.5chehddks*/
    }

    .event-card img {
        border-radius: 4px 4px 0 0;
        
    }

    .event-card-info {
        
        background-color : #F3F3F3;
        color : black;
        font-size: 18px;
        font-weight: bold;
        border-radius: 0 0 4px 4px;
        padding : 20px;
    }

    #event-card-title, #event-card-date {
        padding : 5px;
    }

    /*더보기 버튼*/
    #btn-more {
        /*background-color: #E4E0E1; */
        border-radius: 4px;
        color :/* #493628*/ #313131;
        font-size: 18px;
        font-weight: bold;
        width : 98%;
        margin-top : 15px;
        background-color: none;
        border : 1px solid #F3F3F3;
        height: 40px;
    }
    #btn-more:hover, #btn-more:active {
        background-color: #AB886D;
        color : #F3F3F3;
        font-size: 18px;
        font-weight: bold;
        width : 98%;
        margin-top: 15px;
        border : none;
        height: 40px;
        cursor: pointer;
    }


</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>


    <!--전체 영역을 감싸는 영역-->
    <div class="container">

        <!--메뉴영역-->
        <div class="menu">
            <div id="title">전체 이벤트</div>
            <div id="eventing"><a href="#">진행중인 이벤트&emsp;</a>|</div>
            <div id="winner"><a href="#">당첨자 발표&emsp;</a>|</div>
            <div id="evented"><a href="#">지난 이벤트&emsp;</a></div>
        </div>

        <!-- 추천 이벤트 영역 -->
        <h2 style="color : #F3F3F3; padding: 10px;">✨추천이벤트✨</h2>
        <div class="recommendEventArea">
            <div class="recommendCard">
                <a href="#" style="text-decoration: none;">
                    <img src="${pageContext.request.contextPath}/resources/eventUploadFiles/2024121214211983175.png" alt="추천이미지" style="width : 100%; height : 200px;">
                    <div class="recommend-card-info" >
                        <div id="recommend-card-title">[필룸] 수험생 특별 할인 이벤트!</div>
                        <div id="recommend-card-date">2024.12.12 ~ 2024.12.31</div>
                    </div>
                </a>
            </div>

            <div class="recommendCard">
                <a href="#" style="text-decoration: none;">
                    <img src="${pageContext.request.contextPath}/resources/eventUploadFiles/2024121214211983175.png" alt="추천이미지" style="width : 100%; height : 200px;">
                    <div class="recommend-card-info">
                        <div id="recommend-card-title">[필룸] 수험생 특별 할인 이벤트!</div>
                        <div id="recommend-card-date">항시 진행</div>
                    </div>
                </a>
            </div>

            <div class="recommendCard">
                <a href="#" style="text-decoration: none;">
                    <!--  <img src="${pageContext.request.contextPath}/resources/event_images/itmd.jpg" alt="추천 이벤트2"  style="width : 100%; height : 200px;">-->
                    <img src="${pageContext.request.contextPath}/resources/eventUploadFiles/2024121214211983175.png" alt="추천이미지" style="width : 100%; height : 200px;">
                    <div class="recommend-card-info" >
                        <div id="recommend-card-title">[필룸] 수험생 특별 할인 이벤트!</div>
                        <div id="recommend-card-date">~ 2024.12.31</div>
                    </div>
                </a>
            </div>
        </div>

        <!--이벤트 목록 리스트-->
        <!--진행중인이벤트-->
        <div class="eventTitle-more">
            <div id="eventTitle">진행중인 이벤트</div>
            <!--div id="more"><a href="#" style="text-decoration: none;">더보기 ></a></!--div-->
        </div>
        <div class="card">
	        <c:forEach var="event" items="${requestScope.list}">
	            <div class="event-card">
	            	<a href="#" style="text-decoration: none;">
	                    <img src="${pageContext.request.contextPath}/resources/eventUploadFiles/2024121214211983175.png" alt="추천이미지" style="width : 100%; height : 350px;">
	                    <div class="event-card-info" >
	                        <div id="event-card-title">${event.eventTitle }</div>
	                        <div id="event-card-date">${event.startDate }~${event.endDate } <b style="color : red;">D-2</b></div>
	                    </div>
                   </a>
	            </div>
            </c:forEach>
            
<!-- 
            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/dnlzlem.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[1승] 1승 시사회</div>
                        <div id="event-card-date">2024.12.07~2024.12.15.</div>
                    </div>
                </a>
            </div>

            <div class="event-card"> 
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/fire_thum.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[소방관] 소방관 시사회</div>
                        <div id="event-card-date">2024.12.08~2023.12.09. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>

            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/모아나.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[모아나] 모아나 키링 증정 이벤트</div>
                        <div id="event-card-date">~ 2024.12.31. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="card">
            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/1tmd.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[위키드] 위키드 무대인사</div>
                        <div id="event-card-date">2024.12.03~2024.12.09. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>

            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/dnlzlem.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[1승] 1승 시사회</div>
                        <div id="event-card-date">2024.12.07~2024.12.15.</div>
                    </div>
                </a>
            </div>

            <div class="event-card"> 
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/fire_thum.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[소방관] 소방관 시사회</div>
                        <div id="event-card-date">2024.12.08~2023.12.09. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>

            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/모아나.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[모아나] 모아나 키링 증정 이벤트</div>
                        <div id="event-card-date">~ 2024.12.31. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="card">
            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/1tmd.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[위키드] 위키드 무대인사</div>
                        <div id="event-card-date">2024.12.03~2024.12.09. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>

            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/dnlzlem.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[1승] 1승 시사회</div>
                        <div id="event-card-date">2024.12.07~2024.12.15.</div>
                    </div>
                </a>
            </div>

            <div class="event-card"> 
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/fire_thum.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info">
                        <div id="event-card-title">[소방관] 소방관 시사회</div>
                        <div id="event-card-date">2024.12.08~2023.12.09. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div>

            <div class="event-card">
                <a href="#" style="text-decoration: none;">
                    <img src="../../resources/event_images/모아나.jpg" style="width : 100%; height : 350px;">
                    <div class="event-card-info" >
                        <div id="event-card-title">[모아나] 모아나 키링 증정 이벤트</div>
                        <div id="event-card-date">~ 2024.12.31. <b style="color : red;">D-2</b></div>
                    </div>
                </a>
            </div> -->
        </div>

        <!--더보기 버튼 -->
        <div align="center">
            <button id="btn-more">더보기</button>
        </div>

    </div>

	<jsp:include page="../common/footer.jsp"/>
<title>Insert title here</title>
</head>
<body>

</body>
</html>