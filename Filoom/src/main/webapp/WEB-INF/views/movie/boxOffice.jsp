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
    <script src="https://kit.fontawesome.com/4c4be5559b.js" crossorigin="anonymous"></script>

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

        #showMore {
            text-align:right;
            padding-right:120px;
            font-size:30px;
        }
        
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
            border-radius:5px;
            margin-bottom:5px;
        }
        .poster:hover {
        	cursor:pointer;
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

    <jsp:include page="../common/header.jsp" />

    <div class="backStage">
        
        <div class="movie-pool" align="center">
            <div id="title" align="left">
                <h1>박스 오피스</h1>
            </div>
            
            <hr style="width:95%;">

            <div style="display:flex; justify-content:space-between;">
                <div class="left" style="padding-left:30px;">
                    <label for="openedOnly">상영중인 영화만 표시</label>    
                        <label class="switch">
                            <input id="openedOnly" type="checkbox" onchange="toggleSwitch();">
                            <span class="slider round"></span>
                        </label>
                </div>

                <!-- ※ 상세 정렬 기준
                 default : MOVIE_NO 역순 (관리자 측 영화 목록과 동일)
                 개봉순 : "현재 상영작" 중 개봉이 빠른 순.
                 평점순 : "현재 상영작" 중 리뷰 평점 높은 순, 같을 경우 개봉이 빠른 순
                    ※ 재개봉작의 개봉일자는 마지막 재개봉 날짜로 간주
                 ※ 위 두 정렬 기준 사용 중에는 switch#openedOnly가 ON으로 고정
                 이름순 = 한글 제목을 기준으로 ㄱ-ㅎ, 0-9 순
                  -->
                <div class="middle">
                    <!-- <p>정렬 기준 |</p> -->
                    정렬 기준 |
                    <a href="javascript:listbyOpenedOrder();">개봉순</a>
                    <a href="javascript:listbyCritics();">평점순</a>
                    <a href="javascript:listbyName();">이름순</a>
                </div>
                <div class="right" style="padding-right:30px;">
                    <input type="search" class="search-bar" placeholder="제목으로 검색...">
                    <!-- <i class="fa-solid fa-magnifying-glass" onclick="window.alert('검색 기능은 준비중입니다.')"></i> -->
                    <!-- ↑ 이게 검색 아이콘인데 횟수 절약을 위해 잠시 비활성화 처리하였음 -->
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
             전체적으로 2/3으로 width 240px에 margin 30px 10px가 나을 듯  -->
             
             
<%--             <c:forEach var="" items=""> --%>
<!--             	<div class="movie"> -->
<!-- 	                <img src="resources/images/posters/moana.jpg" class="poster"> -->
<!-- 	                <table class="movie-info"> -->
<!-- 	                    <tr> -->
<!-- 	                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td> -->
<!-- 	                        <td><b>${movieTitle}</b><br></td> -->
<!-- 	                    </tr> -->
<!-- 	                    <tr> -->
<!-- 	                        <td colspan="2">${openDate} ${premiere}</td> -->
								<!--${premiere}: Y면 '개봉', N이면 '개봉예정' -->
<!-- 	                    </tr> -->
<!-- 	                </table> -->
<!--             	</div> -->
<%--             </c:forEach> --%>

			<!-- 300 x 400, column margin 25px로 5x3으로 조정
	            row margin은 확인해보고 결정
	            참고로 현재 column margin은 45px -->
            <div class="movie-list">
            
	            <div class="movie">
	                <img src="resources/images/posters/moana.jpg" class="poster">
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
	                        <td><b>모아나 2</b><br></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.11.27 개봉예정</td>
	                    </tr>
	                </table>
	            </div>
	            	
	            <div class="movie" onclick="location.href='detail.mo';">
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
	                            <td colspan="2">2024.12.4 개봉예정</td>
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
	
	            
	            <div class="movie">
	                <img src="resources/images/posters/firefighter.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
	                        <td><b>소방관</b><br></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.12.4 개봉예정</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/rm.jpg" class="poster"><br>
	                <!-- 알엠 : 라이트 피플, 롱 플레이스 (RM : Right People, Wrong Place) -->
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
	                        <td><b>알엠 : 라이트...</b><br></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.12.5 개봉예정</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/1jungbilla.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/15.svg" class="filmrate"></td>
	                        <td><b>원정빌라</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.12.4 개봉예정</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/chungsul.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/all.svg" class="filmrate"></td>
	                        <td><b>청설</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.11.6 개봉</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/bigfamily.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
	                        <td><b>대가족</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.11.27 개봉</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/morningseagull.jpg" class="poster"><br>
	                <!-- 아침바다 갈매기는 -->
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
	                        <td><b>아침바다 갈매기는</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.11.27 개봉</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/lemongrass.jpg" class="poster"><br>
	                <!-- 여름날의 레몬그라스 -->
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/12.svg" class="filmrate"></td>
	                        <td><b>여름날의 레몬그...</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.11.27 개봉</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/gladiator2.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/19.svg" class="filmrate"></td>
	                        <td><b>글레디에이터 II</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.12.13 개봉</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/knivesout.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/15.svg" class="filmrate"></td>
	                        <td><b>나이브스 아웃</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2019.12.4 개봉</td>
	                        <!-- ※ 재개봉일 : 2024-12-04 -->
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/thecrow.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/19.svg" class="filmrate"></td>
	                        <td><b>더 크로우</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2024.12.11 개봉예정</td>
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/carol.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/19.svg" class="filmrate"></td>
	                        <td><b>캐롤</b></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">2016.2.4 개봉</td>
	                        <!-- ※ 재개봉일 = 2024-11-20 -->
	                    </tr>
	                </table>
	            </div>
	
	            <div class="movie">
	                <img src="resources/images/posters/joker.jpg" class="poster"><br>
	                <table class="movie-info">
	                    <tr>
	                        <td id="filmrate"><img src="resources/images/posters/15.svg" class="filmrate"></td>
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
        
        <script>
        	$(function() {
        		// openedOnly();
        	});
        	
        	function toggleSwitch() {
        		alert($("#openedOnly").prop("checked"));
        		if(!$("#openedOnly").prop("checked")) {
        			viewAll();
        		} else {
        			openedOnly();
        		}
        	}
        	
        	// 별도의 jsp에 JSTL을 적용한 것을 AJAX로 띄우는 방식
        	// 출처: https://velog.io/@hana78786/Ajax를-활용하여-jstl-적용하기
        	// 긴 제목이 들어갈 경우 자르는 로직이 아직 안 들어가서 어그러지는 게 정상임
        	function viewAll() {
        		$.ajax({
    				url: "viewall.mo",
    				type: "get",
    				dataType:"html",
    				
    				success: function(result) {
    					$(".movie-list").empty();
    					$(".movie-list").append(result);
    					
    				},
    				error: function() {
    					alert("Mission Failure");
    				}
    			});	
        	}
        	

        	
        	function openedOnly() {
        		$.ajax({
    				url: "viewopened.mo",
    				type: "get",
    				dataType:"html",
    				
    				success: function(result) {    					
    					$(".movie-list").empty();
    					$(".movie-list").append(result);
    					
    				},
    				error: function() {
    					alert("Mission Failure");
    				}
    			});
        	}
        	
        	// mapper 때문에 공사 중입니다.
        	// 상영작 한정 스위치 체크 여부에 따라 함수 나누고 싶은데 고민 중
        	function listbyOpenedOrder() {
        		$.ajax({
    				url: "openorder.mo",
    				type: "get",
    				dataType:"html",
    				
    				success: function(result) {    					
    					$(".movie-list").empty();
    					$(".movie-list").append(result);
    					
    				},
    				error: function() {
    					alert("Mission Failure");
    				}
    			});
        	}
        	
        	function listbyCritics() {
        		alert("공사중입니다.");
        	}
        	
        	function listbyName() {
        		alert("공사중입니다.");
        	}
        </script>
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