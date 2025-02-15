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

        .backStage #title>* {
            display:inline;
        }

        .backStage h1 {
            font-size:45px;
            padding-left:40px;
            margin-top:20px;
        }

        #showMore {
            text-align:right;
            padding-left:20px;
        }

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

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="backStage">
        
        <div class="movie-pool" align="center">
            <div id="title" align="left">
                <h1 align="left">박스 오피스</h1>
                <p id="showMore">
                    더 보기 &gt;&gt;
                </p> 
            </div>
            <hr style="width:95%;">
    
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
             전체적으로 2/3으로 width 240px에 marin 30px 10px가 나을 듯
              -->
            
            <div class="movie">
                <img src="sauce/moana.jpg" class="poster">
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/3.svg" class="filmrate"></td>
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

            <div class="movie" onclick="location.href='movie_specific.html';">
                <img src="sauce/wicked2.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/3.svg" class="filmrate"></td>
                        <td><b>위키드</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.20 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/1win.jpg" class="poster"><br>
                <table class="movie-info">
                        <tr>
                            <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                            <td><b>1승</b><br></td>
                        </tr>
                        <tr>
                            <td colspan="2">2024.12.4 개봉</td>
                        </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/hiddenface.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/19.svg" class="filmrate"></td>
                        <td><b>히든페이스</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.20 개봉</td>
                    </tr>
                </table>
            </div>

        </div>
        <br><br>

        <div class="movie-pool" align="center">
            <div id="title" align="left">
                <h1>개봉 예정작</h1>
                <p id="showMore">
                    더 보기 &gt;&gt;
                </p> 
            </div>
            <hr style="width:95%;">
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
             전체적으로 2/3으로 width 240px에 marin 30px 10px가 나을 듯
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
                        <!-- <td> | 99분</td> ← 만약 넣으면 제목 쪽의 colspan='2'로 조정-->
                    </tr>
                </table>
            </div>
            <!-- 300 x 400, column margin 25px로 5x3으로 조정
            row margin은 확인해보고 결정
            참고로 현재 column margin은 45px -->

			<!-- 극장판 짱구는 못말려: 우리들의 공룡일기 -->
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
                        <td colspan="2">2024.12.31 개봉예정</td>
                    </tr>
                </table>
            </div>

        </div>
        <br><br>
        
    </div>

    <br><br>

    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>