<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/admin.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
        #admin_right * {
            font-family: "Poppins", sans-serif;
            font-size:25px;
        }

        #admin_title_content {
            display:flex;
            justify-content: space-between;
            color:#493628;
        }
        #goBack:hover {
        	cursor:pointer;
        }

        #admin_page {
            display:flex;            
        }

        #admin_page div {
            display:inline-block;
        }

        #innerAdmin {
            width:90%;
            margin: 5px 5%;
        }
        #innerAdmin>* {
            margin: 0px 20px;
        }

        /* #admin_page * {
            border:1px solid green;
        } */

        /* 가로를 무조건 480px로 맞추고 세로가 726px보다 짧아질 경우 마진으로  */
        #admin_page img {
            /* width:480px; */
            width:100%;
            /* height:640px; */
            height:100%;
            /* object-fit: cover; */
        }

        #newPoster {
            width:480px;
            height:100%;
            background-color: azure;
            /* margin: 44px 0px; */
        }

        #basicInfo {
            height:100%;
            /* border:1px solid red; */
        }

        th {text-align:left;}

        input/*:not(#runtime)*/, textarea {
            width:100%;
            box-sizing:border-box;
            /* background-color: #f3f3f3; */
            /* 배경색은 보류 - 이러면 입력란이 움푹 들어간 느낌이 생김 */
            color:#493628;
        }
        textarea {max-height:300px;}
        
        #basicInfo .filmrate {
        	/* padding:5px; */
            width:60px; height:60px;
        }

        /* input[type=radio]:checked + label>img {
            border: 3px solid black;
            // background-origin: padding-box;
            // background-color: blueviolet;
        } */

        /* 나중에 admin.css 손볼 때 #movie_submit로 변경 예정 */
        #button_sample {
            position:fixed;
            bottom:30px;
            right:30px;
            width:150px;
            font-size:20px;
            margin: 0px 35px;
        }
    </style>
</head>
<body>
    <div id = "admin_content">
        <div id = "navbar">
            
            <div id = "logo">
                <img src="resources/images/icons/Filoom.png">
            </div>
           
            <div id = "nav">
                <ul>
                    <li><a>회원 관리</a></li>
                    <li><a>영화 관리</a></li>
                    <li><a>예약 관리</a></li>
                    <li><a>공지사항 관리</a></li>
                    <li><a>이벤트 관리</a></li>
                </ul>
    
            </div>
        </div>
        <div id = "admin_right">
            <div id ="admin_title">

                <!-- 여기가 관리자 상단 회원번호, 회원아이디 이런거 적는 곳
                    구상은 각자 알아서~ 
                -->
                <div id = "admin_title_content">
                    <p id="fnName" style="padding-left:33px; font-weight:bold;">영화 추가</p>
                    <p id="goBack" style="padding-right:33px;" onclick="location.href='movielist_ad.mo';">
                    	← 목록으로 돌아가기</p>
                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page" align="center">
                    <!-- align = "center" ?-->
                    
                    <div id="innerAdmin">
                        <div id="newPoster">
                            <img id="posterDisplay" src="https://placehold.co/480x716">
                            <input type="file" id="posterInput" style="display:none;" onchange="loadImg(this);">
                        </div>



                        <div id="basicInfo">
                            <table>
                                <tr>
                                    <th>영화 제목</th>
                                    <td colspan="4"><input type="text" id="title" value=""></td>
                                </tr>
                                <tr style="display:none;">
                                    <th>확인용</th>
                                    <td><input type="radio" name="filmrate" value="3" id="rate3"></td>
                                    <td><input type="radio" name="filmrate" value="12" id="rate12"></td>
                                    <td><input type="radio" name="filmrate" value="15" id="rate15"></td>
                                    <td><input type="radio" name="filmrate" value="19" id="rate19"></td>
                                </tr>
                                <tr>
                                    <th>상영 등급</th>
                                    <!-- <td width="160">
                                        <label for="rate3"><img class="filmrate" src="resources/images/posters/3.svg" onclick="rateFilm(3);" alt="ALL"></label>
                                    </td>
                                    <td width="160">
                                        <label for="rate12"><img class="filmrate" src="resources/images/posters/12.svg" onclick="rateFilm(12);" alt="12"></label>
                                    </td>
                                    <td width="160">
                                        <label for="rate15"><img class="filmrate" src="resources/images/posters/15.svg" onclick="rateFilm(15);" alt="15"></label>
                                    </td>
                                    <td width="60">
                                        <label for="rate19"><img class="filmrate" src="resources/images/posters/19.svg" onclick="rateFilm(19);" alt="19"></label>
                                    </td> -->
                                    <td colspan="4" width=540>
                                    	<div style="display:flex; justify-content: space-between;">
	                                    	<label for="rate3"><img class="filmrate" src="resources/images/posters/3.svg" onclick="rateFilm(3);" alt="ALL"></label>
	                                    	<label for="rate12"><img class="filmrate" src="resources/images/posters/12.svg" onclick="rateFilm(12);" alt="12"></label>
	                                    	<label for="rate15"><img class="filmrate" src="resources/images/posters/15.svg" onclick="rateFilm(15);" alt="15"></label>
	                                    	<label for="rate19"><img class="filmrate" src="resources/images/posters/19.svg" onclick="rateFilm(19);" alt="19"></label>
                                    	</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>감독</th>
                                    <td colspan="4"><input type="text" id="director" value=""></td>
                                </tr>
                                <tr>
                                    <th>주요 배우</th>
                                    <td colspan="4"><input type="text" id="cast" value=""></td>
                                </tr>
                                <tr>
                                    <th>장르</th>
                                    <td colspan="4"><input type="text" id="genre" value=""></td>
                                </tr>
                                <!-- ↓ 년월일까지 표기라 'date'가 맞음 -->
                                <tr>
                                    <th>개봉일자</th>
                                    <td colspan="4"><input type="date" id="premiere" value=""></td>
                                </tr>
                                <tr>
                                    <th>상영시간</th>
                                    <td><input type="number" id="runtime" value=""></td>
                                    <td colspan="3">분</td>
                                </tr>
                                <!-- 이 행만 width 구성을 달리할 방법이 없어 일단 보류
                                <tr>
                                    <th colspan="2" width="">추가 상영 방식</th>
                                    <td><img src="resources/images/icons/IMAX_blue_logo.svg" alt="IMAX"></td>
                                    <td><img src="resources/images/icons/4DX_2019_logo.svg" alt="4DX"></td>
                                    <td><img src="resources/images/icons/ScreenX_Logo_(2019).svg" alt="SCREENX"></td>
                                </tr> -->
                                <tr>
                                    <th>트레일러 링크</th>
                                    <td colspan="4"><input type="url" id="trailer_link"></td>
                                </tr>
                                <tr>
                                    <th>시놉시스</th>
                                    <td colspan="4"><textarea name="" 
                                        rows="3" id="synopsis"></textarea></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- <button>1234</button> -->

                    <input type="button" id ="button_sample"
                     name="movie_submit" value="추가 완료" onclick="console.log($(':radio:checked').val());">

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
    
 	// 이미지 첨부시, #posterDisplay 칸이 이미지 미리보기로 바뀜
    $(function() {
        $("#posterDisplay").click(function() {
            $("#posterInput").click();
        });
    });

    function loadImg(inputFile) {

        // if file is selected
        if(inputFile.files.length == 1) {
            console.log("ON");
            let reader = new FileReader();
            reader.readAsDataURL(inputFile.files[0]);

            // 미리보기 띄우기
            reader.onload = function(e) {
                // 'e' : 현재 발생한 event의 정보를 담고 있는 '이벤트 객체'
                // 만들어진 URL 주소가 담기는 곳 = e.target.result

                $("#posterDisplay").attr("src",e.target.result);
                var photo = document.getElementById("posterDisplay").innerHTML;
                console.log(e.target.result);
            };
        }
        // if not
        else {
            console.log("OFF");
            $("#posterDisplay").attr("src","https://placehold.co/480x716");
        }
    }
    
    function rateFilm(num) {
        // console.log(num);
        let target = $("label[for$="+num+"]");
        $("label *").removeAttr("border");
        target.children().first().attr({
            "border":"3px solid red"
        });
        // 현재 border-style과 border-color가 적용되지 않는 이슈 있음
        // 즉, 현재 버튼 선택시 3px만 적용됨
    }
    </script>
    
</body>
</html>