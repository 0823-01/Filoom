<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>꿈을 돌리는 영사기, Filoom</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- fontawesome 연동 - 검색 아이콘 넣을 용도 -->
    <!-- ※ 계정을 파야 embed code를 제공해주던데
     혹시 다른 분들 자리에서도 검색 아이콘 뜨는지 확인바람
     참고로 이거 무료는 한 달에 1만 번 로드 횟수 제한 있으니까 테스트할 때는 비활성화 필요함
     Ctrl+Q,S로 여는 프리뷰 창도 카운트 되는 것으로 알고 있음 -->
     <!-- <script src="https://kit.fontawesome.com/4c4be5559b.js" crossorigin="anonymous"></script> -->
    
    <style>
        /* === Overall Font === */
        * {
            font-family: "Poppins", sans-serif;
        }

        body {
            background-color: #151515;
        }
        
        /* === 내부 div === */
        .backStage {
            background-color: #313131;
            color:white;
            width:1324px;
            margin:auto;
            border-radius:5px;
        }

        .backStage>#title {
            display:inline-block;
        }

        .backStage h1 {
            font-size:45px;
            padding-left:40px;
            margin-top:20px;
        }

        /* #showMore {
            text-align:right;
            padding-right:120px;
            font-size:30px;
        } */

        /* === 영화 목록 바로 위 설정란 === */
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
            background-color: #AB886D;
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

        .middle>a {
            text-decoration: none;
            color:white;
        }
        .middle>a:hover {
            color:black;
        }

        .search-bar {
            font-style:italic;
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

        /**/

        .movie {
            display:inline-block;
            /* 이걸로 충분함. 굳이 4x4를 고민할 필요 없음 */
            margin:10px 30px;
            /* font-size:24px; */
            text-align:left;
        }

        .movie-info {
            font-size:20px;
            
        }
        
        .test {
            display:block;
        }

        /* 페이징바 */
        .pagingbar {
            margin-bottom:10px;
        }

        .pagingbar button {
            border:0;
            background-color: transparent;
            color:white;
            font-size:32px;
            font-weight:lighter;
        }

        .pagingbar button:hover/*, .currentPage */ {
            transform: scale(1.1);
            font-weight: normal;
        }

    </style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <div class="backStage">
        
        <div class="movie-pool" align="center">
            <div id="title" align="left">
                <h1>개봉 예정작</h1>
            </div>
            <hr style="width:95%;">

            <div style="display:flex; justify-content:space-between;">
                <!-- ※ 상세 정렬 기준
                 default : MOVIE_NO 역순 (관리자 측 영화 목록과 동일)
                 개봉순 : 개봉 예정일이 빠른 순.
                 이름순 = 한글 제목을 기준으로 ㄱ-ㅎ, 0-9 순
                  -->
                <div class="middle" style="padding-left:30px;">
                    <!-- <p>정렬 기준 |</p> -->
                    정렬 기준 |
                    <a href="#">개봉순</a>
                    <a href="#">이름순</a>
                </div>
                <div class="right" style="padding-right:30px;">
                    <input type="search" class="search-bar" placeholder="제목으로 검색...">
                    <!-- <i class="fa-solid fa-magnifying-glass" onclick="window.alert('검색 기능은 준비중입니다.')"></i> -->
                </div>
            </div>
    
    
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
             전체적으로 2/3으로 width 240px에 margin 30px 10px가 나을 듯
              -->
            
            <div class="movie">
                <img src="sauce/harbin.jpg" class="poster">
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>하얼빈</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.24 개봉예정</td>
                    </tr>
                </table>
            </div>
            <!-- 300 x 400, column margin 25px로 5x3으로 조정
            row margin은 확인해보고 결정
            참고로 현재 column margin은 45px -->

            <!-- 극장판 짱구는 못말려 : 우리들의 공룡일기 -->
            <div class="movie" onclick="location.href='movie_specific.html';">
                <img src="sauce/dinosinzzang.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/3.svg" class="filmrate"></td>
                        <td><b>극장판 짱구는 못말..</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.18 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/mufasa.jpg" class="poster"><br>
                <table class="movie-info">
                        <tr>
                            <td id="filmrate"><img src="sauce/3.svg" class="filmrate"></td>
                            <td><b>무파사: 라이온 킹</b><br></td>
                        </tr>
                        <tr>
                            <td colspan="2">2024.12.18 개봉예정</td>
                        </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/civilwar.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>시빌 워: 분열의 시대</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.31 개봉</td>
                    </tr>
                </table>
            </div>

            
            <div class="movie">
                <img src="sauce/houria.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>호리아</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.26 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/sonic3.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/3.svg" class="filmrate"></td>
                        <td><b>수퍼 소닉3</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2025.1.1 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/him.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>힘을 낼 시간</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.18 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/bogota.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>보고타</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.31 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/bigfamily.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>대가족</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.27 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/morningseagull.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>아침바다 갈매기는</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.27 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/lemongrass.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>여름날의 레몬그...</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.27 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/gladiator2.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/19.svg" class="filmrate"></td>
                        <td><b>글레디에이터 II</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.13 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/knivesout.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>나이브스 아웃</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2019.12.4 개봉</td>
                        <!-- ※ 재개봉일 : 2024-12-04 -->
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/thecrow.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/19.svg" class="filmrate"></td>
                        <td><b>더 크로우</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.11 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/carol.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/19.svg" class="filmrate"></td>
                        <td><b>캐롤</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2016.2.4 개봉</td>
                        <!-- ※ 재개봉일 = 2024-11-20 -->
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/joker.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>조커</b>
                    </tr>
                    <tr>
                        <td colspan="2">2019.10.2 개봉</td>
                        <!-- ※ 재개봉일 = 2023-11-01 -->
                    </tr>
                </table>
            </div>

        </div>
        <br><br>

        <!-- Paging Bar -->
        <div class="pagingbar" align="center">
            <!-- 나중에 currentPage에 대해서만 볼드 & btn disabled 적용할 예정 -->
            <!-- if i > 1 -->
            <c:if test="${ requestScope.pi.currentPage gt 1 }">
                <button onclick="location.href = 'boxoffice.mo?page=1';">&lt;&lt;</button> <!-- to Page1 -->
                <button onclick="location.href = 'boxoffice.mo?page=${p-1}';">&lt;</button> <!-- prev -->
            </c:if>
            
            <!-- if 3 ≤ i ≤ maxPage-2, for i in range (currentPage -2 ~ +2) -->
            <c:forEach var="p" begin="${requestScope.pi.startPage }" end="${requestScope.pi.endPage }" step="1">
            	<c:choose>
            		<c:when test=""> <!-- button refers to currentPage -->
            			<button class="currentPage" disabled>${p}</button>
            		</c:when>
            		<c:otherwise>
            			<button onclick="location.href = 'boxoffice.mo?page=${p}';">${p}</button>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>

            <!--  if i < maxPage -->
            <c:if test="${ requestScope.pi.currentPage lt requestScope.pi.maxPage }">
                <button onclick="location.href = 'boxoffice.mo?page=${p+1}';">&gt;</button> <!-- next -->    
                <button onclick="location.href = 'boxoffice.mo?page=${requestScope.pi.maxPage}';">&gt;&gt;</button> <!-- to LastPage -->
			</c:if>
        </div>

        
    </div>

    <br><br>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>