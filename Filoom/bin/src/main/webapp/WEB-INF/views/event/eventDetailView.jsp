<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /*overflow: auto; */
        /*height : 1250px;*/
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

    #replyContent {
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

    .btn {
        /*border : 1px solid  blue;*/
        line-height: 50px;
    }

    #updateBtn, #deleteBtn {
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

    #updateBtn:hover, #deleteBtn:hover {
        background-color: #AB886D;
    }

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <!--전체를 감싸는 container-->
    <div class="container">
    
        <!--이벤트제목, 기간-->
        <div class="menu-area">
            <div id="event_title">[모아나 2] 행운의 캐릭터 키링 증정 이벤트!</div>
            <div id="event_date">기간&emsp;2024.11.30 ~ 2024.12.08</div>
        </div>

        <!--내용부분-->
        <div class="content-area">
            <div class="content">
                <img id="event_img" src="https://img.cgv.co.kr/WebApp/contents/eventV4/42865/17331207457360.jpg" alt="이벤트">
                <div id="listBtn">
                    <button>목록으로</button>
                </div>
            </div>
        
            <!--댓글부분-->
            <div class="reply-area">
                <div id="replySize"><b style="color : #AB886D;">879</b>개의 댓글이 있습니다.</div>
                <table class="reply">
                    <thead>

                        <tr>
                            <td colspan="3" style="height : 50px">
                                <div class="replyRegister">
                                    <div id="input">
                                        <textarea id="replyInput" placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제제 조치를 받을 수 있습니다." readonly></textarea>
                                    </div>
                                    <div id="registerBtn">
                                        <button id="register">등록</button>
                                    </div>
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
                            <td id="replyContent">
                                <div class="updateReply">
                                    <div id="updateForm">
                                        <textarea id="updateReply" readonly>모아나 정말 보고싶어용! 저희 엄마가 좋아해여!</textarea>
                                    </div>
                                    <div class="btn">
                                        <button id="updateBtn">수정</button>
                                        <button id="deleteBtn">삭제</button>
                                    </div>
                                </div>
                            </td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>

                        <!--댓글작성자인 경우, 수정 삭제 버튼 -->
                        <tr>
                            <td id="replyWriter">us****</td>
                            <td id="replyContent">
                                모아나 정말 보고싶어요! 저희 아빠가 좋아해여!
                                <button id="updateBtn">수정</button>
                                <button id="deleteBtn">삭제</button>
                            </td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>
                        <tr>
                            <td id="replyWriter">us****</td>
                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>
                        <tr>
                            <td id="replyWriter">us****</td>
                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>
                        <tr>
                            <td id="replyWriter">us****</td>
                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>
                        <tr>
                            <td id="replyWriter">us****</td>
                            <td id="replyContent">모아나 정말 보고싶어요! 저희 아빠가 좋아해여!</td>
                            <td id="replyDate">2024-11-21 오후 2:12:00</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

    
    <jsp:include page="../common/footer.jsp"/>
<title>Insert title here</title>
</head>
<body>

</body>
</html>