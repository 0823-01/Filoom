<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mainstyle.css" />
</head>
<body>
	
	<a href="/filoom/ad.li" style="font-size:100px; color:red;">관리자 메인페이지 </a>
	<pre>관리자 페이지는 이곳으로 통해 들어갈수 있게 해주세요 ~~</pre>
	
		
	
	<div id = "main_content1">
        <div id = "header">
            <div id = "header_top">
                
                <ul>
   
                    <li><a href="${ pageContext.request.contextPath }/list.no">공지사항</a></li> &nbsp;&nbsp;&nbsp;&nbsp;
                    <li><a href="${ pageContext.request.contextPath }/list.fa">문의</a></li>
     
                </ul>
     


                <a class="logo" href="${ pageContext.request.contextPath }">Filoom</a>
    
	                <c:choose>
						<c:when test="${ empty sessionScope.loginUser }">
			                <!-- 로그인 전 -->
			                <ul>
				                <li><a href="${ pageContext.request.contextPath }/loginForm.me">로그인</a></li> &nbsp;&nbsp;&nbsp;&nbsp;
				                <li><a href="${ pageContext.request.contextPath }/enrollForm.me">회원가입</a></li>
			                </ul>
			            </c:when>
			            <c:otherwise>    
			                <!-- 로그인 후 -->
			                <ul>
		                    	<li><a href="${ pageContext.request.contextPath }/myPage.me">마이페이지</a></li> &nbsp;&nbsp;&nbsp;&nbsp;
		                    	<li><a href="${ pageContext.request.contextPath }/logout.me">로그아웃</a></li>
		                    </ul>
			            </c:otherwise>
	           		</c:choose>
    
            </div>
            <hr >
            <div id = "header_bottom">
                <ul>
                    <li><a href="${ pageContext.request.contextPath }/movies.mo">영화</a></li>
	                <c:choose>
			            <c:when test="${ empty sessionScope.loginUser }">
			                <!-- 로그인 전 -->
			                <li><a href="javascript:void(0);" onclick="requireLoginAlert();">예매</a></li>
			            </c:when>
			            <c:otherwise>
			                <!-- 로그인 후 -->
			                <li><a href="${ pageContext.request.contextPath }/book.do">예매</a></li>
			            </c:otherwise>
			        </c:choose>
	                <li><a href="${ pageContext.request.contextPath }/list.ev">이벤트</a></li>
    
                </ul>
            </div>
        </div>
        
        <div id="content1_real">
            <div id="video">
                <video id="movie-video" width="1900" controls muted autoplay playsinline>
                    <source id="video-source" src="images/joker.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div id="content1_detail">
                <div id="detail_main">
                    <div id="main_blank">
                        <div id="blank_blank"></div>
                        <!-- 여기에 영화 제목 -->
                        <div id="detail_title">
                            <a>조커</a>
                        </div>
                    </div>
                    <div id="main_detail">
                        <div id="detail_sum">
                            <a>영화 상세 설명영화 상세</a>
                            <br><br>
                            <button>상세보기 ></button>
                        </div>
                        <div id="another_movie">
                            <div class="movie-card" id="movie1">조커</div>
                            <div class="movie-card" id="movie2">글래디에이터</div>
                            <div class="movie-card" id="movie3">영화3</div>
                            <div class="movie-card" id="movie4">영화4</div>
                            <div class="movie-card" id="movie5">영화5</div>
                        </div>
                        
                    </div>
                    <div id="main_detail_overlay"></div>
                </div>
            </div>
        </div>  


    </div>

    <div id = "main_content3">
        
        <div id = "main_content3_1">
            <div id = "main_content3_title">
                영화 리뷰
            </div>
            <div id = "content3_real">

                <div id = "content3_thumbnail">
                    <img src="movie2.jpg" alt="영화 2">
                </div>
                <div id = "content3_detail">
                    <div id = "cotent3_summary">

                    </div>
                    <div id = "content3_subimg">
                        <img src="movie2.jpg" alt="영화 2">
                        <img src="movie2.jpg" alt="영화 2">
                        <img src="movie2.jpg" alt="영화 2">
                    </div>
                </div>

            </div>
          
            <div id="content3_booking">
                <button>예약하러 가기</button>
            </div>

        </div>
       
       

    </div>

    

    <div id = "service">
        <div id ="service1">
            <div id = "service1_img">
                <img src ="images/고객센터.png">
            </div>
            <div id = "service1_detail">
                고객센터
            </div>
        </div>
        <div id = "service1">
            <div id = "service1_img">
                <img src ="images/call.png">
            </div>
            <div id = "service1_detail">
                고객센터
            </div>
        </div>
        <div id = "service1">
            <div id = "service1_img">
                <img src ="images/1_1.png">
            </div>
            <div id = "service1_detail">
                고객센터
            </div>
        </div>

    </div>


    <div id="main_content2">
       
        <div id ="content2_real">
            <div id="content2_title">
                최신 상영작
            </div>
        
            <div id="content2_movies">
                

                

                

            </div>
        
            <div id="content2_booking">
                <button>더보기</button>
            </div>
        </div>
    </div>

   

    



    <script>
       document.addEventListener('DOMContentLoaded', function() {
            // 첫 번째 영화 카드 선택
            setSelectedCard('movie1');
            changeVideo('images/joker.mp4', '조커');

            // 각 영화 카드 클릭 이벤트 리스너
            document.getElementById('movie1').addEventListener('click', function() {
                changeVideo('images/joker.mp4', '조커');
                setSelectedCard('movie1');
            });

            document.getElementById('movie2').addEventListener('click', function() {
                changeVideo('images/gladiator.mp4', '글래디에이터');
                setSelectedCard('movie2');
            });

            // 선택된 카드에 'selected' 클래스를 추가하는 함수
            function setSelectedCard(selectedId) {
                // 모든 movie-card에서 'selected' 클래스를 제거
                var allCards = document.querySelectorAll('.movie-card');
                allCards.forEach(function(card) {
                    card.classList.remove('selected');
                });

                // 클릭된 카드에 'selected' 클래스를 추가
                var selectedCard = document.getElementById(selectedId);
                selectedCard.classList.add('selected');
            }
        });

        function changeVideo(videoSrc, videoTitle) {
            var videoElement = document.getElementById('movie-video');
            var sourceElement = document.getElementById('video-source');
            var titleElement = document.getElementById('detail_title').querySelector('a');

            if (sourceElement) {
                // 비디오 소스 변경
                sourceElement.src = videoSrc;
                videoElement.load();  // 비디오 재로드
            }

            // 제목 변경
            if (titleElement) {
                titleElement.textContent = videoTitle;
            }
        }
        
        function requireLoginAlert() {
		    alert("로그인이 필요한 기능입니다!");
		}
        
        
        $(document).ready(function () {
            const moviesData = []; // 영화 데이터를 저장할 배열
            let currentIndex = 0; // 현재 표시된 영화의 마지막 인덱스
            const itemsPerPage = 12; // 처음 표시할 영화 수
            const loadMoreCount = 3; // 더보기 클릭 시 추가로 표시할 영화 수

            // 초기 데이터 로드
            callMainEndpoint();

            // AJAX 요청 함수
            function callMainEndpoint() {
                $.ajax({
                    url: "main.do", // 요청 URL
                    type: "POST",  // HTTP 메서드
                    dataType: "json", // 서버에서 반환하는 데이터 유형 (JSON)
                    success: function (response) {
                        console.log("Response from main.do:", response);
                        moviesData.push(...response.list3); // 영화 데이터를 배열에 추가
                        renderMovies(); // 초기 렌더링
                    },
                    error: function (xhr, status, error) {
                        console.error("AJAX Error:", status, error);
                        alert("데이터를 가져오는 데 실패했습니다.");
                    }
                });
            }

            // 영화 데이터를 동적으로 렌더링
            function renderMovies() {
    			const container = $("#content2_movies");
			    const maxIndex = Math.min(currentIndex + itemsPerPage, moviesData.length);
			
			    for (let i = currentIndex; i < maxIndex; i++) {
			        const movie = moviesData[i];
			        if (!movie) continue; // 유효하지 않은 데이터 건너뛰기
				
			        console.log(movie.moiveTitle);
			        
			        // 영화 카드 HTML 문자열 생성
			       const movieCard = '<div id="content2_card">' +
					    '<div id="content2_img">' +
					    '<img src="${pageContext.request.contextPath}/resources/images/posters/' + movie.fileCodename + '" alt="' + movie.movieTitle + '"' +
				        ' onerror="this.onerror=null; this.src=\'${pageContext.request.contextPath}/resources/images/default.jpg\';">' +
					    '</div>' +
					    '<div class="movie-title">' + movie.movieTitle + '</div>' +
					'</div>';
			
			        container.append(movieCard); // 영화 카드를 컨테이너에 추가
			    }
			
			    currentIndex = maxIndex;
			
			    
			    if (currentIndex >= moviesData.length) {
			        $("#content2_booking button").hide();
			    }
			}

            // "더보기" 버튼 클릭 이벤트
            $("#content2_booking button").click(function () {
                const prevIndex = currentIndex;
                const newMaxIndex = Math.min(currentIndex + loadMoreCount, moviesData.length); // 최대 인덱스 계산

                if (prevIndex === newMaxIndex) {
                    $(this).hide(); // 더 이상 데이터가 없으면 버튼 숨기기
                } else {
                    renderMovies(); // 추가 영화 렌더링
                }
            });
        });
        
    </script>

	
	
	<jsp:include page="common/footer.jsp" />
	<div style="border: 3px solid black; height: 500px">

		<br><br>
		<a href="/filoom/movies.mo"><s>영화 탭 홈으로</s></a> 헤더로 이어놨음<br>
		<a href="/filoom/movielist_ad.mo">관리자 영화 관리 페이지 바로가기</a>
		<br>
		
	</div>
	
	<a href="${ pageContext.request.contextPath }/ad.li">관리자</a>
	
	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/6767f7c649e2fd8dfefbe09c/1ifn1vnud';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
		})();
	</script>
	<!--End of Tawk.to Script-->
</body>
</html>