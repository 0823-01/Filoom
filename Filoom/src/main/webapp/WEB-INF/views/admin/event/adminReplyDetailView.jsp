<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 상세조회</title>
    <style>
        /*댓글 상세조회 모달*/
        #detailModal {
            text-align: right;
            margin : 0 13px 5px 0;
        }

        .modal {
            /*display: none;*/
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
            align-items: center;
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
        }

        .no {
            margin-left: 15px;
        }

        .no, .writer, .date, #close {
            display: flex;
            justify-content: space-between;
            gap : 10px;
            align-items: center;
            box-sizing: border-box;
        }

        #rno, #rwriter, #rdate, #content {
            height: 35px;
            border: none;
            border-radius: 5px;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            outline: none;
            background-color: white;
            
            box-sizing: border-box;
            text-align: center;
            line-height: 35px;
        }

        #rno {
            width : 80px;
        }

        #rwriter {
            width : 150px
        }

        #rdate {
            width : 275px;
        }

        #close {
            margin-right: 10px;
            font-size: 20px;
            font-weight: bolder;
        }

        .modalContent {
            padding : 10px;
            border-radius: 4px;
            background-color: #E4E0E1;
            box-sizing: border-box;
            font-size: 20px;
            font-weight: bold;
            color : #493628;
        }

        .content1 {
            color : #493628;
            padding : 15px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .replyContent {
            border-top : 4px solid #493628;
            padding : 15px;
            display: flex;
            justify-content: left;
            gap : 10px;
            align-items :first baseline;
            margin-bottom : 10px;

        }
        #content {
            width : 850px;
            height : 250px;
            padding: 10px;
            text-align: left;
        }

        /*당첨여부, 버튼 */
        .winnner-btn {
            border-top : 4px solid #493628;
            padding: 10px;
            display: flex;
            justify-content: right;
            align-content: center;
            gap : 10px;
        }

        .winner {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap : 10px;
            font-size: 17px;
        }

        #winner {
            font-size: 20px;
        }

        .winner>input {
            width: 10px;
            height : 10px;
        }

        /*버튼*/
        .btn {
            text-align: right;
            box-sizing: border-box;
            padding : 5px;

        }

        button {
            width: 100px;
            height: 40px;
            border: none;
            border-radius: 5px;
            color: #D2CECF;
            font-size: 20px;
            font-weight: bolder;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            background-color: #493628;
            cursor: pointer;
        }

        button:hover {
            transform: scale(1.1em);
        }

        button:active {
            background-color: #AB886D;
        }

    </style>
</head>
<body>
    <div id="detailMoal">

        <!--댓글 상세조회 모달-->
        <div class="modal">
            <div class="modalTitle">
                <div>댓글 상세조회</div>
                <div id="close">&times;</div>
            </div>

            <div class="modalContent" style="box-sizing: border-box;">
                <div class="content1">
                    <div class="no">
                        <div>번호</div>
                        <div id="rno" style="text-align: center;">8000</div>
                    </div>
                    <div class="writer">
                        <div>작성자</div>
                        <div id="rwriter">user**</div>
                    </div>
                    <div class="date">
                        <div>작성일</div>
                        <div id="rdate">2024-12-31 오후 12:40:55</div>
                    </div>
                </div>

                <div class="replyContent">
                    <div style="width : 60px; margin-left : 10px; margin-top : 0px; box-sizing: border-box; text-align: center;">내용</div>
                    <div id="content">asdfasdfasdf</div>
                </div>

                <!--글 삭제여부, 당첨여부, 목록버튼-->
                <div class="winnner-btn">
                    <div class="winner">
                        <div id="winner">당첨여부<b style="color : red;">*</b></div>
                        당첨<input type="radio">
                        미당첨<input type="radio">
                    </div>

                    <div class="btn">
                        <button id="backList">목록</button>
                        <button id="delete">삭제</button>
                    </div>
                </div>
            </div>

        </div>
        
    </div>
</body>
</html>