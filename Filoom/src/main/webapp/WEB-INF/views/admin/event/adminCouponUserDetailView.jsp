<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 보유자 상세조회</title>
    <style>
        /*쿠폰 보유자 상세조회 모달*/
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

        .no, .couponUser, .status {
            display: flex;
            justify-content: left;
            gap : 10px;
            align-items: center;
            box-sizing: border-box;
            padding : 10px;
            text-align: center;
        }

        #no, #couponUser, #status {
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

        .modalContent {
            padding : 10px;
            border-radius: 4px;
            background-color: #E4E0E1;
            box-sizing: border-box;
            font-size: 20px;
            font-weight: bold;
            color : #493628;
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

        <!--쿠폰 보유자 상세조회 모달-->
        <div class="modal">
            <div class="modalTitle">
                <div>쿠폰 보유자 상세조회</div>
                <div id="close">&times;</div>
            </div>

            <div class="modalContent" style="box-sizing: border-box; ">
                <div style="margin-bottom: 20px; ">
                    <div class="no" style="box-sizing: border-box;">
                        <div style="box-sizing: border-box; width : 130px;">번호</div>
                        <div id="no" >8000</div>
                    </div>

                    <div class="couponUser" style="box-sizing: border-box; ">
                        <div style="box-sizing: border-box; width : 130px;">보유자</div>
                        <div id="couponUser">user**</div>
                    </div>

                    <div class="status" style="box-sizing: border-box; ">
                        <div style="box-sizing: border-box; width : 130px;">사용여부</div>
                        <div id="status">N</div>
                    </div>


                </div>

                <!--목록버튼-->
                <div class="btn">
                    <button id="backList">목록</button>
                </div>
            </div>

        </div>
        
    </div>
</body>
</html>