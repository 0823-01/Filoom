<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 관리 :: Filoom</title>
    <link rel="stylesheet" href="admin.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- fontawesome 연동 - 검색 아이콘 넣을 용도 -->
    <!-- ※ 계정을 파야 embed code를 제공해주던데
     혹시 다른 분들 자리에서도 검색 아이콘 뜨는지 확인바람 -->
     <!-- <script src="https://kit.fontawesome.com/4c4be5559b.js" crossorigin="anonymous"></script> -->

    <style>
        #admin_page {
            font-family: "Poppins", sans-serif;
        }

        #admin_title_content {
            color:#493628;
            display:flex;
            justify-content: space-between;
            align-items: center;
            font-size:25px;
        }

        .middle {
            width:30%;
            /* border:1px solid red; */
        }

        .search-bar {
            width:80%;
            height:100%;
        }
        .search-bar::placeholder {
            font-style:italic;
        }
        .fa-magnifying-glass:hover {
            cursor:pointer;
        }

        /* === Toggle Switch === */
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

        /* === Toggle Switch END === */

        #button_sample {
            position:fixed;
            bottom:30px;
            right:30px;
            width:150px;
            font-size:20px;
            margin: 0px 35px;
        }

        /* === 목록 표시란 === */
        /* movie_select.html(= boxOffice.jsp)와 동일 */
        .movie-pool {
            height:100%;
            overflow:auto;
        }
        
        .movie {
            display:inline-block;
            /* 이걸로 충분함. 굳이 4x4를 고민할 필요 없음 */
            margin:10px 30px;
            /* font-size:24px; */
            text-align:left;
        }
        .movie * {
            font-size:20px;
        }
        .movie:hover {
            cursor: pointer;
        }

        .poster {
            width:240px;
            /* height:480px; */
            /*  */
            border-radius:5px;
            margin-bottom:5px;
        }

        #filmrate {
            width:50px;
        }
        .filmrate {
            width:45px;
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
                    <div class="edge_left" style="padding-left:33px;">
                        <p id="fnName" style="font-weight:bold;">영화 관리</p>    
                    </div>

                    <!-- fontawesome 무료 플랜이 한 달에 페이지뷰 1만 번 제한이 있는데
                     프리뷰 창의 페이지뷰도 세는 것 같아서 임시로 다른 img 태그로 대체했음
                     i 태그는 시연할 때만 활성화할 것! -->
                    <div class="middle">
                        <input type="search" class="search-bar" placeholder="제목으로 검색...">
                        <!-- <i class="fa-solid fa-magnifying-glass" onclick="window.alert('검색 기능은 준비중입니다.')"></i> -->
                        <img class="fa-magnifying-glass" src="../sauce/searchicon_pngtree.png"
                            style="width:25px; height: 26px;" onclick="window.alert('검색 기능은 준비중입니다.');">
                    </div>

                    <!-- when turned on : 조회 쿼리문에 where premiere='y' 추가하여 다시 조회 -->
                    <div class="edge_right" style="padding-right:33px;">
                        <label for="openedOnly">상영중인 영화만 표시</label>    
                        <label class="switch">
                            <input id="openedOnly" type="checkbox"
                                onchange="toggle(this);">
                            <span class="slider round"></span>
                        </label>
                    </div>

                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page">
                    
                    <!--이건 버튼 이랑 text 샘플-->
                    <!-- <input type ="text" id ="text_sample"> -->
                    <input type="button" id ="button_sample" value="영화 추가"
                        onclick="location.href='admin_addmovie.html';">

                    <div class="movie-pool" align="center">
                        <!-- 사용자 측 박스오피스와는 달리 정렬 기준이
                         MOVIE_NO DESC 하나로 고정 -->

                        <!-- 페이징 처리 대신 20개 단위로 '더 보기↓' 처리할 계획
                         현재 16개로 되어 있으나 4열 → 5열로 늘릴 예정
                         
                         ※ 추가로 스크롤 다 내려가면 자동으로 더 보기 하는 기능을 알아보고 있음
                         간단한 기능이라면 이 쪽으로 구현할 예정
                        -->

                        <br>
                        <!-- 실제 jsp 파일에서는 반복문 돌려서 구현할 계획
                            <.filmrate> <b>MovieName</b><br>
                            <open_date> <if_premiere ? '개봉' : '개봉예정'>
                        -->
                        
                        <!-- 나중에 DB에 영화 목록 넣을 때 별일 없으면 이 아래 목록 그대로 넣을 생각임 -->
                
                        <!-- 초안은 width 360px + 4x4에 margin 45px 0px 였는데
                         (피드백 받고 세로 margin 10px로 바꾸긴 했음)
                         이렇게 하면 화면 크기 100% 기준으로 화면이 꽉 차는 문제가 있음
                         당장 한 줄에 영화 4개 들어가면 margin 포함 1800px인데
                         뒷판떼기의 width 초안이 1900px이고 이 마저도 꽉차 보인단 피드백 있었음
                         (2/3 정도로 줄이는 게 적합하다는 의견)
                         전체적으로 2/3으로 width 240px에 marin 30px 10px가 나을 듯 -->
                        
                        <c:forEach var="p" begin="1" end="99">
                        	<div class="movie">
	                            <img src="../sauce/moana.jpg" class="poster">
	                            <table class="movie-info">
	                                <tr>
	                                    <td id="filmrate"><img src="../sauce/3.svg" class="filmrate"></td>
	                                    <td><b>모아나 2</b><br></td>
	                                </tr>
	                                <tr>
	                                    <td colspan="2">2024.11.27 개봉예정</td>
	                                </tr>
	                            </table>
	                        </div>
                        </c:forEach>
                        
                        <div class="movie">
                            <img src="../sauce/moana.jpg" class="poster">
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/3.svg" class="filmrate"></td>
                                    <td><b>모아나 2</b><br></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.27 개봉예정</td>
                                </tr>
                            </table>
                        </div>
                        <!-- 300 x 400, column margin 25px로 5x3으로 조정
                        row margin은 확인해보고 결정
                        참고로 현재 column margin은 45px -->
            
                        <div class="movie">
                            <img src="../sauce/wicked2.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/3.svg" class="filmrate"></td>
                                    <td><b>위키드</b><br></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.20 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie" onclick="location.href='admin_movie_manage.html';">
                            <img src="../sauce/1win.jpg" class="poster"><br>
                            <table class="movie-info">
                                    <tr>
                                        <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                        <td><b>1승</b><br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">2024.12.4 개봉예정</td>
                                    </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/hiddenface.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/19.svg" class="filmrate"></td>
                                    <td><b>히든페이스</b><br></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.20 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        
                        <div class="movie">
                            <img src="../sauce/firefighter.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                    <td><b>소방관</b><br></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.12.4 개봉예정</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/rm.jpg" class="poster"><br>
                            <!-- 알엠 : 라이트 피플, 롱 플레이스 (RM : Right People, Wrong Place) -->
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                    <td><b>알엠 : 라이트...</b><br></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.12.5 개봉예정</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/1jungbilla.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/15.svg" class="filmrate"></td>
                                    <td><b>원정빌라</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.12.4 개봉예정</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/chungsul.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/3.svg" class="filmrate"></td>
                                    <td><b>청설</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.6 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/bigfamily.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                    <td><b>대가족</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.27 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/morningseagull.jpg" class="poster"><br>
                            <!-- 아침바다 갈매기는 -->
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                    <td><b>아침바다 갈매기는</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.27 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/lemongrass.jpg" class="poster"><br>
                            <!-- 여름날의 레몬그라스 -->
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/12.svg" class="filmrate"></td>
                                    <td><b>여름날의 레몬그...</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.11.27 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/gladiator2.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/19.svg" class="filmrate"></td>
                                    <td><b>글레디에이터 II</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.12.13 개봉</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/knivesout.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/15.svg" class="filmrate"></td>
                                    <td><b>나이브스 아웃</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2019.12.4 개봉</td>
                                    <!-- ※ 재개봉일 : 2024-12-04 -->
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/thecrow.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/19.svg" class="filmrate"></td>
                                    <td><b>더 크로우</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2024.12.11 개봉예정</td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/carol.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/19.svg" class="filmrate"></td>
                                    <td><b>캐롤</b></td>
                                </tr>
                                <tr>
                                    <td colspan="2">2016.2.4 개봉</td>
                                    <!-- ※ 재개봉일 = 2024-11-20 -->
                                </tr>
                            </table>
                        </div>
            
                        <div class="movie">
                            <img src="../sauce/joker.jpg" class="poster"><br>
                            <table class="movie-info">
                                <tr>
                                    <td id="filmrate"><img src="../sauce/15.svg" class="filmrate"></td>
                                    <td><b>조커</b>
                                </tr>
                                <tr>
                                    <td colspan="2">2019.10.2 개봉</td>
                                    <!-- ※ 재개봉일 = 2023-11-01 -->
                                </tr>
                            </table>
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

    function toggle(this) {
        /* $.ajax({ })를 통하여
         조회 쿼리에 WHERE PREMIERE = 'Y'를 (ON = 포함 / OFF = 제외)해서
         다시 조회한 것으로 결과 바꾸기
         최초 설정은 OFF
        */
    }
    </script>
    
</body>
</html>