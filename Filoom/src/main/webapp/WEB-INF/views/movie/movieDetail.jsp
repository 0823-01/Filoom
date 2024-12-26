<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>꿈을 돌리는 영사기, Filoom</title>

    <!-- 'Poppins' 폰트 추가용 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <!-- swiper.js 라이브러리추가 (cdn) -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
        /* === Overall Font === */
        * {
            font-family: "Poppins", sans-serif;
        }
        
        

        body {
            background-color: #151515;
        }
        /* 뒷판떼기 */
        .backStage {
            background-color: #313131;
            color:white;
            width:1324px;
            margin:auto;
            border-radius:5px;
        }

        /* 앞판떼기 */
        .inner {
            width:1184px;
            /* border:1px solid rgba(255, 0, 0, 0.4); */
        }

        .category {
            font-size:20px;
        }

        /* 상단 영화 정보란 */
        #description {
            display:flex;
            padding-top:10px;
            /* background-image: 컴퓨터 내부에서 가져오더라도 url() 써야 함 */
            /* background-size: cover; */
            /* background-image: url('resources/images/posters/news_1732052776_1431040_m_1.jpeg'); */
        }

        #description>* {
            display:inline-block;
        }
        
/*         #description * { border : 1px solid red;} */

        #description *:not(hr) {
            /* border:1px solid rgba(255, 0, 0, 0.4); */
        }

        #thumbnail {
            /* width:300px; */
            height:500px;
            margin-right:6px;
        }

        .filmrate {
            width:60px;
        }
        #movieTitle {
            font-weight:bold;
            font-size:24px;
        }
        #specific * {
/*         	text-align:left; */
        }


        /* .linkTable>* {
            font-size:40px;
            display:inline-block;
            margin: 0px 40px;
            background-color: #151515;
            padding:20px;
        } */
        .linkTable a, .screenType>* {
            font-size:21px;
            background-color: rgba(217,217,217,0.3);
            color:white;
            text-decoration: none;
            border-radius:3px;
            padding:5px 12px;
        }

        #evalTotal {width:20%;}
        #toBook, #like {width:15%;}

        a:hover {
            filter:invert(100%);
        }

        /* .screenType>* {
            width:80px;
            height:56px;
            border:1px solid gray;
            float:right;
            margin-right:10px;
        } */

        /* 원전이 되는 CGV에서 개발자도구로 screenType 이미지를 긁어온 경우
            background position은 다음과 같음
            IMAX : 0
            4DX : 0 -112px
            SCREENX : 0 -940px
        */

        /* === 스틸컷 - float 무시 */
        #steelcut {
            clear:both;
        }

        /* 이미지 영역 사이즈 조절 */
        .swiper {
            width:100%;
            height:427px;
        }

        .swiper-slide>img {
            height:100%;    
        }

        /* === 리뷰 === */
        #part-header * {
            /* border:1px solid red; */
        }

        #part-header {
            height:50px;
            display:flex;
            justify-content: space-between;
        }
        #part-header>div>* {
            display:inline-block;
            vertical-align: middle;
        }

        /* === 실제 관람평 여부 체크용 스위치 === */
                /* 토글스위치 */
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

        /* === 토글 스위치 END === */


        /* 평점 개요 */
        #evalOverview {
            display:flex;
            /*border: 1px solid red;*/
        }

        .evalSummary {
            width:130px;
            display:flex;
            flex-direction: column;
            justify-content: center;
            /* border: 1px solid orange; */
        }
        .statistic {
            width:1030px;
            display:inline-block;
        }
        
        .graph-back {
            width:1000px;
            height:10px;
            border-radius:20px;
            /* margin:4px; */
            background-color: gray;
        }

        #evalOverview .graph {
            /* width:50%; */
            height:10px;
            border-radius:20px;
            margin:2px 0px;
            background-color: green;
        }
        
        /* 상세 리뷰 */

        #review-pool {
            padding: 0px 45px;
        }
        #review {
            background-color: rgba(228,224,225,0.8);
            color:black;
            border-radius:5px;

            padding: 10px 35px;
            margin-bottom:60px;
            font-size:20px;
        }

        #newReview {
            float:right;
            font-size:21px;
            background-color: rgba(217,217,217,0.3);
            color:white;
            text-decoration: none;
            border-radius:3px;
            padding:5px 12px;
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
    
    <div class="backStage" align="center">
        <div class="inner">
            <!-- 아직 내부 div를 안 넣어서 이 위치에 끼워넣어야 하는데
            양끝 마진 약 67px(~=100 * (2/3)) 정도 주면 됨
            계산의 편의를 위해 최대 70px 까지는 줄 수 있을 듯
            -->
            
            <!--  예시 : <위키드> -->
            <div id="description" align="left">
            	<input type="hidden" id="mno" value="${requestScope.list.movieNo }">
                <!-- 이미지 넣는 곳 -->
                <div>
                	<img src="${pageContext.request.contextPath}/resources/images/posters/${requestScope.list.fileCodename}" alt="${requestScope.list.movieTitle}" id="thumbnail">
                    <!-- <img src="resources/images/posters/wicked2.jpg" alt="위키드" id="thumbnail"> -->
                </div>

                <!-- 제목과 설명을 넣는 곳 -->
                <div id="specific" style="flex-grow: 1;">
                    <table>
                        <tr>
                            <td style="padding-right:5px;"><img src="resources/images/posters/${requestScope.list.filmRate}.svg" class="filmrate"></td>
                            <td id="movieTitle">${requestScope.list.movieTitle}</td>
                        </tr>
                    </table>
                    <div>
                        <!-- [여기에 여러모로 입력] -->
                        <table style="width:100%;">
                            <tr>
                                <th width=150>감독</th>
                                <td>${ requestScope.list.director }</td>
                            </tr>
                            <tr>
                                <th>배우</th>
                                <td>${ requestScope.list.starring }</td>
                            </tr>
                            <tr>
                                <th>장르</th>
                                <td>${ requestScope.list.genre }</td>
                            </tr>
                            <tr>
                                <th>상영시간</th>
                                <td>${requestScope.list.runtime}분</td>
                            </tr>
                            <tr>
                                <th>개봉</th>
                                <td>${requestScope.list.openDate}</td>
                            </tr>
                        </table>

                        <hr>
                        <!-- ↓ 이거 길어지면 내부 스크롤 넣는 게 미관상으로도 좋아보임 -->
                        <pre style="padding-left:10px;">                
    ${requestScope.list.description}
                        </pre>
                    </div>
                </div>

            </div>

            <br>
           
            <div class="linkTable" style="float:left; margin-left:10px;">
                <!-- 평점은 소수 셋째 자리에서 반올림 (= 소수 둘째 자리까지 표기) -->

                <!-- display가 inline이 아닌데도 display:inline이라면서 width가 무시되는 현상 있음 -->
                <a href="#reviewList" id="evalTotal">평점 로딩 중</a>
                <!-- script를 통해 버튼이 왼쪽부터 평점/5 만큼만 밝은 색으로 나오게 할 계획  -->
                <input type="hidden" id="uid" value="${not empty sessionScope.loginUser ? sessionScope.loginUser.userNo : 0}"> 
                <c:if test="${requestScope.list.premiere eq 'Y' }">
                	<a href="book.do" id="toBook">예매하기</a>
                </c:if>
                <c:if test="${not empty sessionScope.loginUser}">
                	<a href="javascript:favCheck(uid);" id="like" value="${requestScope.favCount}"></a>
               	</c:if>
               	<otherwise>
                		<a href="javascript:alert('영화를 찜하려면 로그인해야 합니다.');" id="like">♡ ${requestScope.favCount}</a>
               	</otherwise>
               	
<!--                 <a href="" id="like">♡ 1234</a> -->
                <!-- 로그인 후 클릭시 ♥ 1235 으로 바뀌도록. 비로그인시 로그인하라고 얼럿함 -->
                <!-- 좋아요 켜면 FAVORITE 테이블에 넣는 거니까 확인하고 넣을 것 -->
            </div>


            <!-- 순서대로 IMAX, 4DX, screenX이며, 필요한 것만 우측부터 배치 -->
            <div class="screenType" style="float:right; margin-right:10px;">
                <!-- float로 별개로 배치 -->
                 <!-- 클릭 시 각각의 소개 영상(외부 링크)로 이동 -->
                <c:if test="${fn:contains(requestScope.list.screenType,'IMAX')}">
                	<a href="https://www.youtube.com/watch?v=n5HbQ7vCvDY" id="imax">IMAX</a>
                </c:if>
                <c:if test="${fn:contains(requestScope.list.screenType,'4DX')}">
	                <a href="https://www.youtube.com/watch?v=-Wm2y5028ds" id="4dx">4DX</a>
                </c:if>
                <c:if test="${fn:contains(requestScope.list.screenType,'SCREENX')}">
	                <a href="https://www.youtube.com/watch?v=lkqm7quc-ME" id="screenx">SCREENX</a>
                </c:if>
            </div>

            <br><br>


            <br><br><hr style="display:none;">
            <div id="steelcut" align="left">
                <p class="category"><b>스틸컷</b> <!-- <b>01</b> / 35건--></p>
                <hr><br>
                <!-- <div align="center">
                    // 왼쪽 끝에 '<' 이미지
                    <img src="resources/images/posters/wicked1.jpg">
                    // 오른쪽 끝에 '>' 이미지
                </div> -->

                <!-- swiper_api 넣되, pagination은 빼기 -->
                <div id="container">
                    <div class="swiper">
                        <div class="swiper-wrapper" align="center">
                        	<c:forEach var="pic" items="${album}">
                        		<div class="swiper-slide"><img src="resources/images/posters/${pic.fileCodename}"></div>                            
                            </c:forEach>
                        </div>

                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>

            <!-- swiper의 동작에 대한 스크립트 -->
            <script>
                const swiper = new Swiper('.swiper', {
                    loop : true,
                    slidesPerView : 1, // 확인용
                    navigation: {
                        // 스틸컷 번호도 같이 바꾸고 싶은데 안될라나
                        prevEl: '.swiper-button-prev',
                        nextEl: '.swiper-button-next'
                    }
                });
            </script>

            <br><br><hr>

            <div id="reviewTop">
                <div id="part-header">
                    <p class="category"><b>리뷰</b></p>
                    <div>
	                    <p>실제 관람평만 보기</p>
	                    <!-- ↓ 얘도 흰색으로 바꿔야 함 -->
	                    <label class="switch">
	                        <input type="checkbox">
	                        <span class="slider round"></span>
	                    </label>
                    </div>
                </div>
                <br>

                <div id="evalOverview">
                    <!-- 특수문자는 꽉찬 별과 빈 별만 있고 반 개짜리 별은 없기 때문에
                    다른 방법으로 구현해야 함
                    일례로 Google Play의 경우 서로 다른 opacity 값을 절반씩 적용했음
                    -->
                    <!-- 이렇게 하니까 border 없으면 허전해보이는데 -->
                    <div class="evalSummary">
                        <!-- <b style="font-size:20px;">4.55</b><br>
                        ★★★★★ -->
                        <div id="moviescore" style="font-size:30px;">
                            3.97
                        </div>
                        <!-- 아래 별 부분은 별 이미지 x5를 평점에 맞게 채우는 걸로 대체 예정 -->
                        <div>★★★★★</div>
                        <div id="listcount">리뷰 ${requestScope.reviewNo}개</div>
                    </div>
                    <div class="statistic">
                        <table>
                        	<c:forEach var="s" begin="1" end="5" step="1">
                        		<tr>
	                                <td>${6-s}</td>
	                                <td>
	                                    <div class="graph-back">
	                                        <div class="graph" value="${6-s}" style="width:0%;"></div>
	                                    </div>
	                                </td>
	                            </tr>
                        	</c:forEach>
                        	<!-- dummy percentage : 5점부터 순서대로 65% 17% 10% 1% 7% -->
                        </table>
                    </div>
                </div>
            </div>

            <br><br>
            <div id="review-pool">
                
                <div id="reviewList">
                
                <!-- 그리고 여기도 AJAX로 넣어야 함 -->

                <!-- SAMPLE (table) -->
                <!-- <div id="review">
                	닉네임 개념이 없는 관계로 아이디로 받아야 함
                	full id = 'tenletterstunman'
                    <div id="reviewerName" style="float:left;">tenl****</div>
                    <div id="writtenDate" style="float:right;">2024-11-29</div><br>

                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>원작을 봤다면 여러 번 볼 수밖에 없는 영화</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>★★★★★</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>동명의 소설을 N번, 동명의 뮤지컬을 1N번 본 사람으로써, 원작 팬으로써의 엄격한 잣대를 가지고 영화를 보러 갔다. 조금이라도 맘에 안 들면 바로 1점 때릴 생각으로.  그런데 이 영화는, 맘에 안 드는 구석을 전혀 찾을 수 없었다...</td>
                        </tr>
                    </table>
                </div> -->

                </div>

                <!-- if user is logged in -->
                <c:if test="${not empty sessionScope.loginUser}">
                    <a href="" id="newReview">작성</a>
                    <!-- link to 'give_a_star.html' -->
                </c:if>
                <br><br>
                
                <script>
                const mno = $("#mno").val();
                let uid = $("#uid").val();
                let count = $("#listcount");
                $(function() {
                	if(uid > 0)
                		favCheck(uid);
                	selectReviewList(mno,1);
                	getAverage(mno);
                });
                
                function refreshPagingBar(cpage) {
            		$(".pagingbar").empty();
            		let link = 'detail.mo?movieNo=';
            		let pgbar = '';

            		// EL 태그를 function 안에 쓸 수 없어서 다른 방법을 연구하는 중
            		let start = $("#first").val();
            		let end = $("#last").val();
            		let max = $("#MX").val();
            		
        			// '<<', '<' 처리
            		if(cpage > 1) {
            			// add &lt;&lt;
            			// add &lt;
            			pgbar += "<button onclick= '" + link + "1);'>&lt;&lt;</button> <!-- to Page1 -->"
            				+ "<button onclick= '" + link + (cpage-1) + ");'>&lt;</button> <!-- Prev -->";
            		}

            		for(let i = start; i <= Math.min(end,max); i++) {

            			if(i == cpage) {
            				// font-weight:normal 넣는 이유 : 나머지는 lighter로 해놨음
            				pgbar += "<button disabled style='font-weight: normal;' onclick= '" + link + i + ");'>"
            					+ i + "</button>";
            			}
            			else {
            				pgbar += "<button onclick= '" + link + i + ");'>" + i + "</button>";
            			}
            		}

            		if (cpage < max) {
            			// add &gt;
            			// add &gt;&gt;
            			pgbar += "<button onclick= '" + link
            					+ (cpage+1) + ");'>&gt;</button> <!-- Next -->"
            				+ "<button onclick= '" + link + max + ")';>&gt;&gt;</button> <!-- to LastPage -->";
            		}

            		$(".pagingbar").html(pgbar);
            		
            	}
                
                function selectReviewList(mno, cpage) {
                	$.ajax({
                		url:'reviewlist.mo?mno='+mno +'&cpage='+cpage,
                		type:'get',
                		data:{
                			'mno' : mno,
                			'cpage' : cpage
                		},
                		
                		success: function(result) {
                			$("#reviewList").empty();
                			$("#reviewList").append(result);
                			
                			// 페이징바 갱신
                			refreshPagingBar(cpage);
                			
                			// 평점 갱신
                			getAverage(mno);

                		},
        	    		error: function() {
        	    			alert('DAMN!');
        	    		}	
        	    	});
                }
                
                function getAverage(mno) {
                	$.ajax({
                		url:'review_ovr.mo?mno='+mno,
                		type:'post',
                		data:{
                			'mno' : mno,
                		},
                		
                		success: function(result) {
                			// 리뷰 수 갱신
                			let rvno = result.listcount;
                			$("#listcount").text("리뷰 "+result.listcount+"개");
                			
                			if(rvno <= 0) {
                				$("#evalTotal").text("평점 없음");
                				$("#moviescore").html("N/A");
                			} else {
                				// 평점 갱신
	                			// 혹시 몰라서 .empty() 넣었는데 사실 빼도 되서 비활성화함
	                			// $("#evalTotal").empty();
	                			$("#evalTotal").text("평점 " + result.ave);
	                			// $("#moviescore").empty();
	                			$("#moviescore").html(result.ave);
								
	    						//그래프 갱신
	    						$(".graph[value=1]").css("width", result.one+"%");
	    						$(".graph[value=2]").css("width", result.two+"%");
	    						$(".graph[value=3]").css("width", result.three+"%");
	    						$(".graph[value=4]").css("width", result.four+"%");
	    						$(".graph[value=5]").css("width", result.five+"%");
                			}
                			
                		},
        	    		error: function() {
        	    			alert('DAMN!');
        	    		}
                	});
                }
                
                function favCheck(uid) {
                	let sw = '';
                	$.ajax({
                			url:"favcheck.mo?userNo="+uid+"&movieNo="+mno,
                			type:"post",
                			data:{"userNo" : uid, "movieNo" : mno},
                			
                			success:function(result) {
                				if(result == 1) {
                					sw = '♥';
                				} else {
                					sw = '♡';
                				}
                				sw += $("#like").val();
                				$("#like").text(sw);
                			},
                			error:function() {
                				sw = '♨ERROR';
                				$("#favSw").text(sw);
                			}
                		});
                }
                
                function favToggle(uid) {
                	
                	// 비로그인일 땐 애초에 가지도 않지만 혹시 몰라서..
                	if(uid == 0) {
                		alert('영화를 찜하려면 로그인해야 합니다.');
                		return false;
                	} else {
                		$.ajax({
                			url:"likethis.mo?userNo="+uid+"&movieNo="+mno,
                			type:"post",
                			data:{"userNo" : uid, "movieNo" : mno},
                			
                			success:function(result) {
                				if(result == "success") {
                					favCheck(uid);
                				} else {
                					alert("좋아요가 반영되지 않았습니다.");
                				}
                			},
                			error:function() {
                				alert("오류가 발생했습니다.");
                			}
                		});	
                	}
                }

                </script>

                <!-- Paging Bar -->
				<div class="pagingbar" align="center">
					<!--  -->
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>