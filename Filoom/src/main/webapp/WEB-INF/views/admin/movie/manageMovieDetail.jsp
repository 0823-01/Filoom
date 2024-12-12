<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 상세::Filoom</title>
    <link rel="stylesheet" href="admin.css" />
    <style>
        /* *{overflow:auto;} */
        #admin_title_content {
            font-size:25px;
            display:flex;
            justify-content: space-between;
            color:#493628;
        }
        
        #goBack:hover {
            cursor: pointer;
        }

        #admin_page * {
            font-size:24px;
        }

        #admin_page div {
            display:inline-block;
        }

        #innerAdmin {
            width:90%;
            padding: 5px 5%;
        }
        /* #innerAdmin * { border: 1px solid red;} */

        /* === 영화 포스터 (좌) === */
        #moviePoster {
            width:480px;
            height:100%;
        }

        #moviePoster>img {
            width:100%;
            /* height:100%; */
        }
        
        /* #moviePoster,#moviePoster>img {
            height:100%;
        } */

        /* === 영화 정보 (우) === */
        #tobeManaged {
            /* width:100%; */
            height:100%;
            vertical-align: top;
            text-align:left;
            overflow:auto;
        }
        #tobeManaged * {
            /* border: 1px solid green; */
        }

        #button_sample {
            font-size:15px;
        }
        #button_sample:not(.unready) {
            background-color: #d6c0b3;
            color:black;
        }


        .filmrate {
            width:60px;
            margin-right:10px;
        }
        #movie-title, #movie-info {
            font-size:24px;
        }

        /* === 토글 스위치 === */
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 22px;
            vertical-align:middle;
        }

        /* Hide default HTML checkbox */
        .switch input {display:none;}

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #939393;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 2px;
            bottom: 2px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #67503F;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #67503F;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(18px);
            -ms-transform: translateX(18px);
            transform: translateX(18px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        /* === 토글 스위치 끝 === */

        #only_when_playing>#tabletitle {
            display:flex;
            justify-content: space-between;
        }

        #only_when_playing table th {
            text-align:center;
        }
    </style>
</head>
<body>
    <div id = "admin_content">
        <div id = "navbar">
            
            <div id = "logo">
                <img src="./Filoom.png">
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
                    <p id="fnName" style="padding-left:33px; font-weight:bold;">영화 상세</p>
                    <p id="goBack" style="padding-right:33px;"
                        onclick="location.href='admin_movie_list.html';">
                        ← 목록으로 돌아가기
                    </p>

                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page">

                    <div id="innerAdmin">
                        <div id="moviePoster" style="margin-right:20px;">
                            <!-- <img src="https://placehold.co/600x400"> -->
                            <img src="../sauce/1win.jpg">
                        </div>
                        <div id="tobeManaged">
                            <!-- 내부 스크롤은 여기만 지원함 -->
                            
                            <!-- 영화 제목 & 상영 등급 표기란
                            ※ 상세 페이지에서는 제목이 한 줄을 넘겨도 전부 보여주는 것을 원칙으로 함 -->
                            
                            <!-- 스틸컷을 관리할 수 있는 '이미지 보기' 버튼을 추가했음
                             → 해당 페이지를 하나 더 제작해야 함
                             (불필요하거나 시간 부족할 경우 삭제) -->
                            <div align="right" style="width:100%;">
                                <button id="button_sample">이미지 관리</button>
                                <button id="button_sample" onclick="location.href='admin_review_patrol.html';">리뷰 관리</button>
                                <button id="button_sample" onclick="location.href='admin_modifymovie.html';">수정</button>
                                <button id="button_sample" class="unready" style="background-color:red;">삭제</button>
                            </div>
                            
                            <div id="movie-title">
                                <table>
                                    <tr>
                                        <td><img class="filmrate" src="../sauce/12.svg"></td>
                                        <td><b>1승</b></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div id="movie-info">
                                <!-- 대충 영화 정보 -->
                                <!-- 주요 배우는 세 명까지만 -->
                                <table>
                                    <tr>
                                        <th>감독</th>
                                        <td>신연식</td>
                                    </tr>
                                    <tr>
                                        <th>주요 배우</th>
                                        <td>송강호, 박정민, 장윤주</td>
                                    </tr>
                                    <tr>
                                        <th>장르</th>
                                        <td>드라마</td>
                                    </tr>
                                    <tr>
                                        <th>상영시간</th>
                                        <td>107분</td>
                                    </tr>
                                    
                                </table>
                            </div>

                            <br><br><hr>
                            <div id="if_premiere" style="font-size:36px;">
                                <tr>
                                    <th>개봉 여부</th>
                                    <td>
                                        <label class="switch">
                                            <input type="checkbox" name="if_premiere">
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                </tr>
                            </div>

                            <br><hr>
                            <!-- 상영 중일 경우, 아래 div안으로 상영 정보가 들어감 -->
                            <div id="only_when_playing">
                                <div id="tabletitle">
                                    <b>상영 정보</b>
                                    <hr>
                                    <button><img src="../sauce/plus.svg"></button>
                                </div>

                                <br><br>
                                <div style="background-color: #8b8b8b;">
                                    <table>
                                        <tr>
                                            <th>날짜</th>
                                            <th colspan="3">시간</th>
                                            <th>상영관</th>
                                        </tr>
                                        
                                        <!-- 이 밑으로는 ajax로 추가/삭제 구현 -->
                                        <!-- 추가할 때 맨 오른쪽 버튼은 'OK', 추가 후 '-'로 변경
                                            ajax 추가할 때는 아래 tr을 table에 "append"하면 됨 
                                        -->
                                        <tr>
                                            <td>
                                                <input type="date" class="movie-date">
                                            </td>
                                            <td>
                                                <input type="time" class="movie-start">
                                            </td>
                                            <td>~</td>
                                            <td>
                                                <input type="time" class="movie-end">
                                            </td>
                                            <td>
                                                <select class="screen-no">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                                <button style="background-color: red;"><img src="../sauce/dash-lg.svg"></button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>    
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