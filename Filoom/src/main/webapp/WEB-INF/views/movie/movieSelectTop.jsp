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
            color:white;
            text-decoration:none;
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
                <a id="showMore" href="boxoffice.mo">
                    더 보기 &gt;&gt;
                </a> 
            </div>
            <hr style="width:95%;">
    
            <br>
            <!-- 실제 jsp 파일에서는 반복문 돌려서 구현할 계획
                <.filmrate> <b>MovieName</b><br>
                <open_date> <if_premiere ? '개봉' : '개봉예정'>
            -->
            
            <!-- 나중에 DB에 영화 목록 넣을 때 별일 없으면 이 아래 목록 그대로 넣을 생각임 -->
            
            <div class="movie">
                <img src="resources/images/posters/moana.jpg" class="poster">
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
                        <td><b>모아나 2</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.27 개봉</td>
                    </tr>
                </table>
            </div>
            <!-- 300 x 400, column margin 25px로 5x3으로 조정
            row margin은 확인해보고 결정
            참고로 현재 column margin은 45px -->

            <div class="movie" onclick="location.href='movie_specific.html';">
                <img src="resources/images/posters/wicked2.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
                        <td><b>위키드</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.20 개봉</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="resources/images/posters/1win.jpg" class="poster"><br>
                <table class="movie-info">
                        <tr>
                            <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
                            <td><b>1승</b><br></td>
                        </tr>
                        <tr>
                            <td colspan="2">2024.12.4 개봉</td>
                        </tr>
                </table>
            </div>

            <div class="movie">
                <img src="resources/images/posters/hiddenface.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/19.svg" class="filmrate"></td>
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
                <a id="showMore" href="preopen.mo">
                    더 보기 &gt;&gt;
                </a> 
            </div>
            <hr style="width:95%;">
            <br>
            <!-- 실제 jsp 파일에서는 반복문 돌려서 구현할 계획
                <.filmrate> <b>MovieName</b><br>
                <open_date> <if_premiere ? '개봉' : '개봉예정'>
            -->
            
            <!-- 나중에 DB에 영화 목록 넣을 때 별일 없으면 이 아래 목록 그대로 넣을 생각임 -->
            
            <div class="movie">
                <img src="resources/images/posters/harbin.jpg" class="poster">
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/15.svg" class="filmrate"></td>
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

			<!-- 극장판 짱구는 못말려: 우리들의 공룡일기 -->
            <div class="movie" onclick="location.href='movie_specific.html';">
                <img src="resources/images/posters/dinosinzzang.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
                        <td><b>극장판 짱구는 못말..</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.18 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="resources/images/posters/mufasa.jpg" class="poster"><br>
                <table class="movie-info">
                        <tr>
                            <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
                            <td><b>무파사: 라이온 킹</b><br></td>
                        </tr>
                        <tr>
                            <td colspan="2">2024.12.18 개봉예정</td>
                        </tr>
                </table>
            </div>

            <div class="movie">
                <img src="resources/images/posters/civilwar.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="resources/images/posters/15.svg" class="filmrate"></td>
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