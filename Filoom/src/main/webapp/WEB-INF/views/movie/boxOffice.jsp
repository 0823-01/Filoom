<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        /* === 내부 div === */
        .backStage {
            background-color: #313131;
            color:white;
            width:1324px;
            margin:auto;
            border-radius:5px;
            
            /* center 정렬은 보류 - BootStrap 쓸 경우 안 해도 됨 */
        }

        .backStage>#title {
            display:inline-block;
        }

        .backStage h1 {
            font-size:50px;
            padding-left:40px;
            margin-top:20px;
        }

        #showMore {
            text-align:right;
            padding-right:120px;
            font-size:30px;
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

        .pagingbar button:hover {
            transform: scale(1.1);
            font-weight: normal;
        }

    </style>
</head>
<body>

    <%@ jsp:include file="../common/header.jsp" %>

    <div class="backStage">
        
        <div class="movie-pool" align="center">
            <div id="title" align="left">
                <h1>박스 오피스</h1>
            <!-- <p id="showMore">
                더 보기 &gt;&gt;
            </p> 
            ※ 여기 들어갈 건 아니었고 박스오피스랑 개봉예정작 4개씩 보여주는 곳에 넣으려 했는데..
            -->
            
                <!-- <a>개봉순</a>    
                <a>평점순</a>
                <a>가나다순</a> -->

                <!-- align=right로
                 검색창을 넣음 -->
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
             전체적으로 2/3으로 width 240px에 marin 30px 10px가 나을 듯
             영화  -->
            
            <div class="movie">
                <img src="sauce/moana.jpg" class="poster">
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/all.svg" class="filmrate"></td>
                        <td><b>모아나 2</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.27 개봉예정</td>
                        <!-- <td> | 99분</td> ← 만약 넣으면 제목 쪽의 colspan='2'로 조정-->
                    </tr>
                </table>
            </div>
            <!-- 300 x 400, column margin 25px로 5x3으로 조정
            row margin은 확인해보고 결정
            참고로 현재 column margin은 45px -->

            <div class="movie">
                <img src="sauce/wicked2.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/all.svg" class="filmrate"></td>
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
                            <td colspan="2">2024.12.4 개봉예정</td>
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

            
            <div class="movie">
                <img src="sauce/firefighter.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>소방관</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.4 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/rm.jpg" class="poster"><br>
                <!-- 알엠 : 라이트 피플, 롱 플레이스 (RM : Right People, Wrong Place) -->
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/12.svg" class="filmrate"></td>
                        <td><b>알엠 : 라이트...</b><br></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.5 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/1jungbilla.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/15.svg" class="filmrate"></td>
                        <td><b>원정빌라</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.12.4 개봉예정</td>
                    </tr>
                </table>
            </div>

            <div class="movie">
                <img src="sauce/chungsul.jpg" class="poster"><br>
                <table class="movie-info">
                    <tr>
                        <td id="filmrate"><img src="sauce/all.svg" class="filmrate"></td>
                        <td><b>청설</b></td>
                    </tr>
                    <tr>
                        <td colspan="2">2024.11.6 개봉</td>
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
                <!-- 아침바다 갈매기는 -->
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
                <!-- 여름날의 레몬그라스 -->
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
                <button>&lt;&lt;</button> <!-- to Page1 -->
                <button>&lt;</button> <!-- prev -->
            <!-- if 3 ≤ i ≤ maxPage-2, for i in range (currentPage -2 ~ +2) -->
            <button onclick="location.href = '#';">1</button>
            <button onclick="location.href = '#';">2</button>
            <button onclick="location.href = '#';">3</button>
            <button onclick="location.href = '#';">4</button>
            <button onclick="location.href = '#';">5</button>
            <button onclick="location.href = '#';">6</button>
            <button onclick="location.href = '#';">7</button>
            <button onclick="location.href = '#';">8</button>
            <button onclick="location.href = '#';">9</button>
            <button onclick="location.href = '#';">10</button>

            <!--  if i < maxPage -->
                <button>&gt;</button> <!-- next -->    
                <button>&gt;&gt;</button> <!-- to LastPage -->
        </div>

        
    </div>

    <br><br>

    <%@ jsp:include file="../common/footer.jsp" %>

</body>
</html>