<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 관리::Filoom</title>
    <link rel="stylesheet" href="admin.css" />

    <style>
        #admin_title_content {
            font-size:25px;
            display:flex;
            justify-content: space-between;
            color:#493628;
        }
        #goBack:hover {
            cursor:pointer;
        }

        #admin_page {
            overflow: auto;
        }

        #reviewList {
            padding: 0px 45px;
        }
        #review {
            background-color: rgba(243,243,243,0.8);
            color:black;
            border-radius:5px;
            border:1px solid black;

            padding: 10px 35px;
            margin-bottom:60px;
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
                    <p id="fnName" style="padding-left:33px; font-weight:bold;">리뷰 관리 | 위키드</p>
                    <p id="goBack" style="padding-right:33px;"
                        onclick="location.href='admin_movie_list.html';">
                        ← 목록으로 돌아가기
                    </p>

                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page">

                    <p style="font-size:20px; padding-left:45px;"><b>1 - 10</b> 번째 리뷰 / 총 <b>180</b> 개</p>
                    <!-- startNum ~ endNum, 총 reviewCount 개 -->

                    <div id="reviewList">
                    	<c:forEach var="p" begin="1" end="10">
                    		<div id="review">
	                            <div style="display:flex; justify-content: space-between;">
	                            	<!-- MEMBER 테이블에 닉네임 개념이 따로 없어 아이디만을 사용함 -->
	                            	<div id="reviewerName" style="float:left;">tenl****</div>
	                                <div id="writtenDate" style="float:right;">2024-11-29</div>
	                                <button id="deleteButton" style="float:right; background-color: red; color:white;">
	                                    <img src="../sauce/dash-lg.svg">
	                                </button>
	                            </div>
	                            
	                            <table>
	                                <tr>
	                                    <td width="50">제목</td>
	                                    <td><b>원작을 봤다면 여러 번 볼 수밖에 없는 영화</b></td>
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
                    	</c:forEach>
                    	
<!--                         <div id="review"> -->
<!--                             <div style="display:flex; justify-content: space-between;"> -->
<!--                                 <div id="reviewerName" style="float:left;">열글자한줄넘김기절함</div> -->
<!--                                 <div id="writtenDate" style="float:right;">2024-11-29</div> -->
<!--                                 <button id="deleteButton" style="float:right; background-color: red; color:white;"> -->
<!--                                     <img src="../sauce/dash-lg.svg"> -->
<!--                                 </button> -->
<!--                             </div> -->
                            
        
<!--                             <table> -->
<!--                                 <tr> -->
<!--                                     <td width="50">제목</td> -->
<!--                                     <td><b>원작을 봤다면 여러 번 볼 수밖에 없는 영화</b></td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>평점</td> -->
<!--                                     <td>★★★★★</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>내용</td> -->
<!--                                     <td>동명의 소설을 N번, 동명의 뮤지컬을 1N번 본 사람으로써, 원작 팬으로써의 엄격한 잣대를 가지고 영화를 보러 갔다. 조금이라도 맘에 안 들면 바로 1점 때릴 생각으로.  그런데 이 영화는, 맘에 안 드는 구석을 전혀 찾을 수 없었다...</td> -->
<!--                                 </tr> -->
<!--                             </table> -->
<!--                         </div> -->
        
<!--                         <div id="review"> -->
<!--                             <div style="display:flex; justify-content: space-between;"> -->
<!--                                 <div id="reviewerName" style="float:left;">상하이의무신</div> -->
<!--                                 <div id="writtenDate" style="float:right;">2024-11-29</div> -->
<!--                                 <button id="deleteButton" style="float:right; background-color: red; color:white;"> -->
<!--                                     <img src="../sauce/dash-lg.svg"> -->
<!--                                 </button> -->
<!--                             </div> -->
                            
<!--                             <table> -->
<!--                                 <tr> -->
<!--                                     <td width="50">제목</td> -->
<!--                                     <td>명작임에도 별점을 반 밖에 줄 수 없는 이유</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>평점</td> -->
<!--                                     <td>★★★☆☆</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>내용</td> -->
<!--                                     <td>영화가 너무 늘어진다고 생각했다. 클라이막스는 아직 멀었다고 생각할 때쯤 파트2로 이어진다면서 엔딩 크레딧이 올라오더라. 절반만 보여줬으니까 나도 점수 반절만 주련다</td> -->
<!--                                 </tr> -->
<!--                             </table> -->
<!--                         </div> -->
        
<!--                         <div id="review"> -->
<!--                             <div style="display:flex; justify-content: space-between;"> -->
<!--                                 <div id="reviewerName" style="float:left;">장례식부활맨</div> -->
<!--                                 <div id="writtenDate" style="float:right;">2024-11-29</div> -->
<!--                                 <button id="deleteButton" style="float:right; background-color: red; color:white;"> -->
<!--                                     <img src="../sauce/dash-lg.svg"> -->
<!--                                 </button> -->
<!--                             </div> -->
        
<!--                             <table> -->
<!--                                 <tr> -->
<!--                                     <td width="50">제목</td> -->
<!--                                     <td>이 영화가 재미없을 정도로 낭만이 없는 당신은 불쌍해요</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>평점</td> -->
<!--                                     <td>★★★★★</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>내용</td> -->
<!--                                     <td>현실 속에서 잊고 살았던 낭만을 이 영화로 채울 수 있었다. 어린 시절 마법과 환상으로 가득한 세계를 꿈꿔보지 않은 사람은 적어도 이 리뷰를 보고 있는 사람 중엔 없을 거라고 장담하지만, 설마 있어도 이 영화가 그 대체제가 될 수 있을 것 같다.</td> -->
<!--                                 </tr> -->
<!--                             </table> -->
                            
<!--                         </div> -->
        
<!--                         닉네임 없이 아이디만 쓰는 경우 - 앞 4글자만 남기고 "****"로 처리 -->
<!--                         full id = 'banryeseeker' -->
<!--                         <div id="review"> -->
<!--                             <div style="display:flex; justify-content: space-between;"> -->
<!--                                 <div id="reviewerName" style="float:left;">banr****</div> -->
<!--                                 <div id="writtenDate" style="float:right;">2024-11-29</div> -->
<!--                                 <button id="deleteButton" style="float:right; background-color: red; color:white;"> -->
<!--                                     <img src="../sauce/dash-lg.svg"> -->
<!--                                 </button> -->
<!--                             </div> -->
        
<!--                             <table> -->
<!--                                 <tr> -->
<!--                                     <td width="50">제목</td> -->
<!--                                     <td>알고 보는 거지만, 아쉬움이 남는다.</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>평점</td> -->
<!--                                     <td>★★★★☆</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>내용</td> -->
<!--                                     <td>영화 보러 갔다가 뮤지컬의 넘버만 듣고 온 것 같다. 워낙 유명한 곡들이라 후회는 없지만 거기까지 가는 과정이 너무 늘어짐.</td> -->
<!--                                 </tr> -->
<!--                             </table> -->
<!--                         </div> -->
        
<!--                         full id = 'tenletterstunman' -->
<!--                         <div id="review"> -->
<!--                             <div style="display:flex; justify-content: space-between;"> -->
<!--                                 <div id="reviewerName" style="float:left;">tenl****</div> -->
<!--                                 <div id="writtenDate" style="float:right;">2024-11-29</div> -->
<!--                                 <button id="deleteButton" style="float:right; background-color: red; color:white;"> -->
<!--                                     <img src="../sauce/dash-lg.svg"> -->
<!--                                 </button> -->
<!--                             </div> -->
        
<!--                             <table> -->
<!--                                 <tr> -->
<!--                                     <td width="50">제목</td> -->
<!--                                     <td>토네이도와도 같은 영화</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>평점</td> -->
<!--                                     <td>★★★★★</td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td>내용</td> -->
<!--                                     <td>모티브가 된 오즈의 마법사는 캔자스시티의 토네이도가 도로시를 오즈로 휩쓸어가는 것으로 시작한다. 이 영화는 한 마디로 바로 그 토네이도와도 같다. 160분 내내 관객을 황홀하게 만드는 토네이도. 그래서 파트2는 언제 나옴?</td> -->
<!--                                 </tr> -->
<!--                             </table> -->
<!--                         </div> -->
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