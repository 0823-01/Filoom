<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응모자 상세조회</title>
    <style>
        /*응모자 상세조회 모달*/
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

        .no, .applicant, .date, .eventTitle {
            display: flex;
            justify-content: left;
            gap : 10px;
            align-items: center;
            box-sizing: border-box;
            padding : 10px;
            text-align: center;
        }

        #no, #applicant, #date, #eventTitle, #status {
            height: 35px;
            border: none;
            border-radius: 5px;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            outline: none;
            background-color: white;
            box-sizing: border-box;
            text-align: left;
            line-height: 35px;
            width : 400px;
            padding-left: 10px;
        }

        #close {
            margin-right: 10px;
            font-size: 20px;
            font-weight: bolder;
        }

        #status {
            width : 100px;
            height : 30px;
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

        <!--응모자 상세조회 모달-->
        <div class="modal">
            <div class="modalTitle">
                <div>응모자 상세조회</div>
                <div id="close">&times;</div>
            </div>

            <div class="modalContent" style="box-sizing: border-box; ">
                <div style="margin-bottom: 20px; ">
                    <div class="no" style="box-sizing: border-box;">
                        <div style="box-sizing: border-box; width : 130px;">번호</div>
                        <div id="no" >8000</div>
                    </div>

                    <div class="eventTitle" style="box-sizing: border-box; ">
                        <div style="box-sizing: border-box; width : 130px;">이벤트 제목</div>
                        <div id="eventTitle">이거 재미없다.</div>
                    </div>

                    <div class="applicant" style="box-sizing: border-box; ">
                        <div style="box-sizing: border-box; width : 130px;">응모자</div>
                        <div id="applicant">user**</div>
                    </div>

                    <div class="date" style="box-sizing: border-box; ">
                        <div style="box-sizing: border-box; width : 130px;">응모날짜</div>
                        <div id="date">2024-12-31 오후 12:40:55</div>
                    </div>

                </div>

                <!--글 삭제여부, 당첨여부, 목록버튼-->
                <div class="winnner-btn">
                    <div class="winner">
                        <div id="winner">당첨여부<b style="color : red;">*</b></div>
                        <!--당첨<input type="radio">
                        미당첨<input type="radio"> -->
                        <select id="status">
                            <option value="Y">당첨</option>
                            <option value="N">미당첨</option>
                        </select>
                    </div>

                    <div class="btn">
                        <button id="couponIssue">쿠폰발급</button>
                        <button id="backList">목록</button>
                        <button id="delete">삭제</button>
                    </div>
                </div>
            </div>

        </div>
        
    </div>
</body>
</html>