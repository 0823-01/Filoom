<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 등록 모달</title>
    <style>
        /*쿠폰 등록 모달*/
        #enrollFormModal {
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
            padding : 10px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: bold;
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
            font-size: 17px;
            font-weight: bold;
            color : #493628;
        }

        .content1 {
            color : #493628;
            padding : 15px;
            box-sizing: border-box;
            display: flex;
            justify-content: left;
            gap : 20px;
            align-items: center;
            margin-bottom: 15px;
            font-size: 17px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .date-status {
            border-top : 4px solid #493628;
            padding : 15px;
            display: flex;
            justify-content: left;
            gap : 20px;
            align-items :first baseline;
            margin-bottom : 10px;

        }

        .no, .title, .type, .date, .endDate, .status {
            display: flex;
            justify-content: space-between;
            gap : 20px;
            align-items: center;
            box-sizing: border-box;
        }

        #no, #title, #type, #date, #endDate, #status {
            height: 35px;
            border: none;
            border-radius: 5px;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            outline: none;
            background-color: white;
            text-align: center;
            
            box-sizing: border-box;
            text-align: center;
            line-height: 35px;
        }

        #no {
            width : 80px;
        }
        #title {
            width : 280px;
        }
        #type, #date, #endDate {
            width: 150px;
        }
        #status {
            width : 80px;
        }

        /*버튼*/
        .btn {
            text-align: right;
            box-sizing: border-box;
            padding : 5px;

        }

        button {
            width: 80px;
            height: 30px;
            border: none;
            border-radius: 5px;
            color: #D2CECF;
            font-size: 17px;
            font-weight: bolder;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            background-color: #493628;
            cursor: pointer;
        }

        #couponUser {
            width : 150px;   
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
    <div id="enrollFormMoal">

        <!--쿠폰 등록 모달-->
        <div class="modal">
            <div class="modalTitle">
                <div>쿠폰 등록</div>
                <div id="close">&times;</div>
            </div>


            <form id="coupon" action="" metho="post">
                <div class="modalContent" style="box-sizing: border-box;">
                    <div class="content1">
                        <div class="no">
                            <div>번호</div>
                            <div id="no">8000</div>
                        </div>
                        <div class="title">
                            <div>이벤트명</div>
                            <input type="text" id="title">
                        </div>
                        <div class="type">
                            <div>타입</div>
                            
                            <select id="type">
                                <option value="1">무대/시사회</option>
                                <option value="2">관람권</option>
                                <option value="1">기타</option>
                            </select>
                            
                        </div>
                    </div>

                    <div class="date-status">
                        <div class="date">
                            <div>발급일</div>
                            <input type="text" id="date">
                        </div>
                        <div class="endDate">
                            <div>만료일</div>
                            <input type="text" id="endDate">
                        </div>
                        <div class="status">
                            <div>유효여부</div>
                            <select id="status">
                                <option value="만료">N</option>
                                <option value="유효">Y</option>
                            </select>
                            
                        </div>
                    </div>

                    <!--목록, 수정, 삭제 버튼-->
                    <div class="back-update-delete">
                        <div class="btn">
                            <button id="backList">목록</button>
                            <button type="submit" id="submit">등록</button>
                        </div>
                    </div>
                </div>
            </form>

        </div>
        
    </div>
</body>
</html>