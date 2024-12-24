<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            /* background-image: url('sauce/news_1732052776_1431040_m_1.jpeg'); */
        }

        #description>* {
            display:inline-block;
        }

        #description *:not(hr) {
            /* border:1px solid rgba(255, 0, 0, 0.4); */
        }

        #thumbnail {
            /* width:300px; */
            height:500px;
            margin-right:4px;
        }

        .filmrate {
            width:60px;
        }
        #movieTitle {
            font-weight:bold;
            font-size:24px;
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
        #reviewTop * {
            /* border:1px solid red; */
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


        .statistic td {
            /* padding: 0; */
        }
        .graph-back {
            width:1000px;
            height:10px;
            border-radius:20px;
            /* margin:4px; */
            background-color: gray;
        }

        #evalOverview .graph {
            /* color:black; */
            /* width:50%; */
            height:10px;
            border-radius:20px;
            margin:2px 0px;
            background-color: green;
        }

        #reviewList {
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
    
    <!-- 예시 : 위키드 -->
    <div class="backStage" align="center">
        <div class="inner">
            <!-- 아직 내부 div를 안 넣어서 이 위치에 끼워넣어야 하는데
            양끝 마진 약 67px(~=100 * (2/3)) 정도 주면 됨
            계산의 편의를 위해 최대 70px 까지는 줄 수 있을 듯
            -->
            <div id="description" align="left">
                <!-- 이미지 넣는 곳 -->
                <div>
                    <img src="sauce/wicked2.jpg" alt="위키드" id="thumbnail">
                </div>

                <!-- 제목과 설명을 넣는 곳 -->
                <div style="flex-grow: 1;">
                    <!-- <div>
                        <img src="sauce/3.svg" class="filmrate">
                        <b>위키드</b>
                    </div> -->
                    <table>
                        <tr>
                            <td><img src="sauce/3.svg" class="filmrate"></td>
                            <td id="movieTitle">위키드</td>
                        </tr>
                    </table>
                    <div>
                        <!-- [여기에 여러모로 입력] -->
                        <table style="width:100%;">
                            <tr>
                                <th>감독</th>
                                <td>존 추</td>
                            </tr>
                            <tr>
                                <th>배우</th>
                                <td>아리아나 그란데, 신시아 에리보, 조나단 베일리, 에단 슬레이터, 양자경, 제프 골드브럼</td>
                            </tr>
                            <tr>
                                <th>장르</th>
                                <td>판타지, 뮤지컬</td>
                            </tr>
                            <tr>
                                <th>상영시간</th>
                                <td>160분</td>
                            </tr>
                            <tr>
                                <th>개봉</th>
                                <td>2024.11.20</td>
                            </tr>
                        </table>

                        <hr>
                        <!-- ↓ 이거 길어지면 내부 스크롤 넣는 게 미관상으로도 좋아보임 -->
                        <pre>                
    자신의 진정한 힘을 미처 발견하지 못한 '엘파바'(신시아 에리보)
    자신의 진정한 본성을 아직 발견하지 못한 ‘글린다'(아리아나 그란데)
    전혀 다른 두 사람은 마법 같은 우정을 쌓아간다.
    그러던 어느 날, '마법사'의 초대를 받아 에메랄드 시티로 가게 되고
    운명은 예상치 못한 위기와 모험으로 두 사람을 이끄는데…
    
    마법 같은 운명의 시작, 누구나 세상을 날아오를 수 있어
                        </pre>
                    </div>
                </div>

            </div>

            <br>
           
            <div class="linkTable" style="float:left; margin-left:10px;">
                <!-- 평점은 소수 셋째 자리에서 반올림 (= 소수 둘째 자리까지 표기) -->

                <!-- display가 inline이 아닌데도 display:inline이라면서 width가 무시되는 현상 있음 -->
                <a href="#reviewList" id="evalTotal">평점 4.55</a>
                <!-- script를 통해 버튼이 왼쪽부터 평점/5 만큼만 밝은 색으로 나오게 할 계획  -->
                <a href="" id="toBook">예매하기</a>
                <a href="" id="like">♡ 1234</a>
                <!-- 로그인 후 클릭시 ♥ 1235 으로 바뀌도록. 비로그인시 로그인하라고 얼럿함 -->
            </div>


            <!-- 순서대로 IMAX, 4DX, screenX이며, 필요한 것만 우측부터 배치 -->
             <!-- 나중에 size = 80x56으로 넣을 예정 -->
            <div class="screenType" style="float:right; margin-right:10px;">
                <!-- float로 별개로 배치 -->
                 <!-- CGV가 이 로고들을 넣는데, 클릭 시 사이트 내 설명 페이지로 이동 -->
                <!-- <div><img src="sauce/IMAX.svg">대충 IMAX 로고</div>
                <div>대충 4DX 로고</div>
                <div>대충 ScreenX 로고</div>-->
                <a href="" id="imax">IMAX</a>
                <a href="" id="4dx">4DX</a>
                <a href="" id="screenx">SCREENX</a>
            </div>

            <br><br>


            <br><br><hr style="display:none;">
            <div id="steelcut" align="left">
                <p class="category"><b>스틸컷</b> <b>01</b> / 35건</p>
                <hr><br>
                <!-- <div align="center">
                    // 왼쪽 끝에 '<' 이미지
                    <img src="sauce/wicked1.jpg">
                    // 오른쪽 끝에 '>' 이미지
                </div> -->

                <!-- swiper_api 넣되, pagination은 빼기 -->
                <div id="container">
                    <div class="swiper">
                        <div class="swiper-wrapper" align="center">
                            <div class="swiper-slide"><img src="sauce/wicked1.jpg"></div>
                            <div class="swiper-slide"><img src="sauce/wicked2.jpg"></div>
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
                <!-- 여기 어그러지는 거 아는데 이 페이지에 시간을 너무 많이 써서 일단 보류 -->
                <div style="height:80px;">
                    <p style="float:left;" class="category"><b>리뷰</b></p>
                    <!-- ↓ 얘도 흰색으로 바꿔야 함 -->
                    <label class="switch" style="float:right;">
                        <input type="checkbox">
                        <span class="slider round"></span>
                    </label>
                    <p style="float:right;">실제 관람평만 보기</p>
                </div>
                <br>

                <div id="evalOverview" style="display:inline-block;">
                    <!-- 특수문자는 꽉찬 별과 빈 별만 있고 반 개짜리 별은 없기 때문에
                    다른 방법으로 구현해야 함
                    일례로 Google Play의 경우 서로 다른 opacity 값을 절반씩 적용했음
                    -->
                    <!-- 점수랑 별 개수 가운데로 올리고 싶은데 안 올라가서 보류 -->
                    <div style="display:inline-block;">
                        <!-- <b style="font-size:20px;">4.55</b><br>
                        ★★★★★ -->
                        <div style="font-size:20px;">
                            4.55
                        </div>
                        <div>★★★★★</div>
                        <div>리뷰 180개</div>
                    </div>
                    <div class="statistic" style="display:inline-block;">
                        <table>
                            <tr>
                                <td>5</td>
                                <td>
                                    <div class="graph-back">
                                        <div class="graph" style="width:65%;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>
                                    <div class="graph-back">
                                        <div class="graph" style="width:17%;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>
                                    <div class="graph-back">
                                        <div class="graph" style="width:10%;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <div class="graph-back">
                                        <div class="graph" style="width:1%;"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <div class="graph-back">
                                        <div class="graph" style="width:7%;"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <br><br>
            <div id="reviewList">
                
                <!-- #review에 의도적으로 가로마진 45px를 줬는데.
                이로 인해 일부 예시가 2줄을 아슬아슬하게 넘어가는 화면크기 67%에
                한하여 해당 div의 테이블이 어그러지는 현상이 있음
                별일 없으면 실전에서 가로마진 뺄 예정 -->

                <!-- SAMPLE (기본형)
                <div id="review">
                    열글자한줄넘김기절함<br>
                    2024-11-29<br>
                    제목 &emsp; 원작을 봤다면 여러 번 볼 수밖에 없는 영화<br>
                    평점 &emsp; ★★★★★<br>
                    내용 &emsp; 동명의 소설을 N번, 동명의 뮤지컬을 1N번 본 사람으로써, 원작 팬으로써의 엄격한 잣대를 가지고 영화를 보러 갔다. 조금이라도 맘에 안 들면 바로 1점 때릴 생각으로.  그런데 이 영화는, 맘에 안 드는 구석을 전혀 찾을 수 없었다...<br>
                </div>
                -->

                <!-- SAMPLE (table) -->
                <div id="review">
                    <div id="reviewerName" style="float:left;">열글자한줄넘김기절함</div>
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
                </div>

                <div id="review">
                    <div id="reviewerName" style="float:left;">상하이의무신</div>
                    <div id="writtenDate" style="float:right;">2024-11-29</div><br>
                    
                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>명작임에도 별점을 반 밖에 줄 수 없는 이유</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>★★★☆☆</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>영화가 너무 늘어진다고 생각했다. 클라이막스는 아직 멀었다고 생각할 때쯤 파트2로 이어진다면서 엔딩 크레딧이 올라오더라. 절반만 보여줬으니까 나도 점수 반절만 주련다</td>
                        </tr>
                    </table>
                </div>

                <div id="review">
                    <div id="reviewerName" style="float:left;">장례식부활맨</div>
                    <div id="writtenDate" style="float:right;">2024-11-29</div><br>

                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>이 영화가 재미없을 정도로 낭만이 없는 당신은 불쌍해요</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>★★★★★</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>현실 속에서 잊고 살았던 낭만을 이 영화로 채울 수 있었다. 어린 시절 마법과 환상으로 가득한 세계를 꿈꿔보지 않은 사람은 적어도 이 리뷰를 보고 있는 사람 중엔 없을 거라고 장담하지만, 설마 있어도 이 영화가 그 대체제가 될 수 있을 것 같다.</td>
                        </tr>
                    </table>
                    
                </div>

                <!-- 닉네임 없이 아이디만 쓰는 경우 - 앞 4글자만 남기고 "****"로 처리 -->
                <!-- full id = 'banryeseeker' -->
                <div id="review">
                    <div id="reviewerName" style="float:left;">banr****</div>
                    <div id="writtenDate" style="float:right;">2024-11-29</div><br>

                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>알고 보는 거지만, 아쉬움이 남는다.</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>★★★★☆</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>영화 보러 갔다가 뮤지컬의 넘버만 듣고 온 것 같다. 워낙 유명한 곡들이라 후회는 없지만 거기까지 가는 과정이 너무 늘어짐.</td>
                        </tr>
                    </table>
                </div>

                <!-- full id = 'tenletterstunman' -->
                <div id="review">
                    <div id="reviewerName" style="float:left;">tenl****</div>
                    <div id="writtenDate" style="float:right;">2024-11-29</div><br>

                    <table>
                        <tr>
                            <td width="50">제목</td>
                            <td>토네이도와도 같은 영화</td>
                        </tr>
                        <tr>
                            <td>평점</td>
                            <td>★★★★★</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>모티브가 된 오즈의 마법사는 캔자스시티의 토네이도가 도로시를 오즈로 휩쓸어가는 것으로 시작한다. 이 영화는 한 마디로 바로 그 토네이도와도 같다. 160분 내내 관객을 황홀하게 만드는 토네이도. 그래서 파트2는 언제 나옴?</td>
                        </tr>
                    </table>
                </div>

                <!-- if user is logged in -->
                <!-- <c:if test="${ne sessionScope.loginUser}"> -->
                    <!-- <button style="float:right;">작성</button> -->
                    <a href="" id="newReview">작성</a>
                    <!-- link to 'give_a_star.html' -->
                <!-- </c:if> -->
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
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>