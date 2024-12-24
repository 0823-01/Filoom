<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 상세:: Filoom</title>
    <link rel="stylesheet" href="resources/css/admin.css" />
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    
    <!-- jQuery 연동 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <style>
        #admin_right * {
            font-family: "Poppins", sans-serif;
            font-size:25px;
        }
        
        #admin_title_content {
            font-size:25px;
            display:flex;
            justify-content: space-between;
            color:#493628;
        }
        
        #goBack:hover {
            cursor: pointer;
        }

        #admin_page * {
            font-size:24px;
        }

        #admin_page div {
            display:inline-block;
        }

        #innerAdmin {
            width:90%;
            padding: 5px 5%;
        }
        #innerAdmin>* {
        	margin:0px 20px;
        	display:inline-block;
        	/*border:1px solid red;*/
        }

        /* === 영화 포스터 (좌) === */
        #moviePoster {
            width:480px;
            height:100%;
        }

        #moviePoster>img {
            width:100%;
            /* height:100%; */
        }
        
        /* #moviePoster,#moviePoster>img {
            height:100%;
        } */

        /* === 영화 정보 (우) === */
        #tobeManaged {
            width:725px;
            height:100%;
            max-height:684px;
            vertical-align: top;
            text-align:left;
            overflow:auto;
        }
        #tobeManaged * {
            /* border: 1px solid green; */
        }

        #button_sample {
            font-size:15px;
        }
        #button_sample:not(.unready) {
            background-color: #d6c0b3;
            color:black;
        }


        .filmrate {
            width:60px;
            margin-right:10px;
        }
        #movie-title, #movie-info {
            font-size:24px;
        }

        /* === 토글 스위치 === */
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

        /* === 토글 스위치 끝 === */

        #only_when_playing>#tabletitle {
            display:flex;
            justify-content: space-between;
        }

        #only_when_playing table th {
            text-align:center;
        }
    </style>
</head>
<body>
    <div id = "admin_content">
        <div id = "navbar">
            
            <div id = "logo">
                <img src="resources/images/icons/Filoom.png">
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
                    <p id="fnName" style="padding-left:33px; font-weight:bold;">영화 상세</p>
                    <p id="goBack" style="padding-right:33px;"
                        onclick="location.href='movielist_ad.mo';">
                        ← 목록으로 돌아가기
                    </p>

                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page">

                    <div id="innerAdmin">
                        <div id="moviePoster">
                            <!-- <img src="https://placehold.co/600x400"> -->
                            <!-- <img src="resources/images/posters/1win.jpg"> -->
                            <img src="${pageContext.request.contextPath}/resources/images/posters/${requestScope.target.fileCodename}">
                            <input type="hidden" id="prevpath" value="${requestScope.target.imagePath}">
                            <input type="hidden" id="mno" value="${requestScope.target.movieNo}">
                        </div>
                        <div id="tobeManaged">
                            <!-- 내부 스크롤은 여기만 지원함 -->
                            
                            <!-- 영화 제목 & 상영 등급 표기란
                            ※ 상세 페이지에서는 제목이 한 줄을 넘겨도 전부 보여주는 것을 원칙으로 함 -->
                            
                            <!-- 스틸컷을 관리할 수 있는 '이미지 보기' 버튼을 추가했음
                             → 해당 페이지를 하나 더 제작해야 함
                             (불필요하거나 시간 부족할 경우 삭제) -->
                            <div id="manageBar" align="right" style="width:100%;">
                                <button id="button_sample">이미지 관리</button>
                                <button id="button_sample" onclick="location.href='managereview.mo?movieNo=${requestScope.target.movieNo}';">리뷰 관리</button>
                                <button id="button_sample" onclick="location.href='modifymovie.mo?movieNo=${requestScope.target.movieNo}';">수정</button>
                                <button id="button_sample" class="unready" style="background-color:red;">삭제</button>
                                	<!-- location.href='admin.deletemovie.mo?movieNo=${requestScope.target.movieNo}' -->
                            </div>
                            
                            <div id="movie-title">
                                <table>
                                    <tr>
                                        <td><img class="filmrate" src="resources/images/posters/${requestScope.target.filmRate}.svg"></td>
                                        <td><b>${requestScope.target.movieTitle}</b></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div id="movie-info">
                                <!-- 대충 영화 정보 -->
                                <!-- 주요 배우는 네 명까지만 -->
                                <table>
                                    <tr>
                                        <th width="110">감독</th>
                                        <td>${requestScope.target.director}</td>
                                    </tr>
                                    <tr>
                                        <th>주요 배우</th>
                                        <td>${requestScope.target.starring}</td>
                                    </tr>
                                    <tr>
                                        <th>장르</th>
                                        <td>${requestScope.target.genre}</td>
                                    </tr>
                                    <tr>
                                        <th>상영시간</th>
                                        <td>${requestScope.target.runtime}분</td>
                                    </tr>
                                    <tr>
                                        <th>개봉일자</th>
                                        <td>${requestScope.target.openDate}</td>
                                    </tr>
                                </table>
                            </div>

                            <br><hr>
                            <div id="if_premiere" style="font-size:36px;">
                                <tr>
                                    <th>개봉 여부</th>
                                    <td>
                                        <label class="switch">
                                            <input type="checkbox" name="if_premiere" onclick="togglePremiere(this.checked);">
                                            <!-- onclick='console.log(this.checked);' 찍어보면 누른 후의 결과로 나옴
                                            	그러니까 개봉 안한 영화(false로 조회됨)에 스위치 누르면 true로 바뀐 후 true가 찍힘 -->
                                            <!-- onchange 보다 onclick으로 해야 제대로 반영될 듯 -->
                                            <span class="slider round"></span>
                                        </label>
                                    </td>
                                </tr>
                            </div>

                            <br><hr>
                            <!-- 상영 중일 경우, 아래 div안으로 상영 정보가 들어감 -->
                            <div id="only_when_playing" align="center" style="width:100%;">
                                <div id="tabletitle">
                                    <b>상영 정보</b>
                                    <hr>
                                    <!-- 밑으로 내려가는 게 나을 것 같아서 대책 필요함 -->
                                    <button onclick="$('#addPlaying').toggle(800);"><img src="resources/images/icons/plus.svg"></button>
                                    <!-- onclick → 상영 정보 추가 탭 toggle(0.5s~1s 사이) -->
                                </div>

                                <div id="addPlaying" style="background-color: #8b8b8b; width:100%; display:none;">
                                    <table>
                                        <tr>
                                            <th>날짜</th>
                                            <th colspan="3">시간</th>
                                            <th>상영관</th>
                                        </tr>
                                        
                                        <!-- 이 밑으로는 ajax로 추가/삭제 구현 -->
                                        <!-- 추가할 때 맨 오른쪽 버튼은 'OK', 추가 후 '-'로 변경
                                            ajax 추가할 때는 아래 tr을 table에 "append"하면 됨 
                                        -->
                                        <tr>
                                            <td>
                                                <input type="date" class="movie-date">
                                            </td>
                                            <td>
                                                <input type="time" class="movie-start">
                                            </td>
                                            <td>~</td>
                                            <td>
                                                <input type="time" class="movie-end">
                                            </td>
                                            <td>
                                                <select class="screen-no">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                </select>
                                                <button style="background-color: red;"><img src="resources/images/icons/dash-lg.svg"></button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
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
    
    $(function() {
    	let isOpen = ("${target.premiere}" == 'Y');
    	if(isOpen) {
    		$("input[name=if_premiere]").attr("checked", "true");
    	}/*  else
    		$("#only_when_playing").hide(); */
    	console.log(isOpen);
    	
    	/* isOpen.change(function() {
    		$("#only_when_playing").toggle();
    	}); */

		$(".unready").click(function() {
			removeMovie(isOpen);
		});
		
    });
    
    function togglePremiere(isOpen) {
    	let mno = $("#mno").val();
    	let premiere = isOpen ? 1 : 0;
    	// premiere는 스위치를 눌러서 바뀐 값으로 들어감.
    	// 즉, 미개봉(false)일 때 눌러서 true로 만들면 isOpen = true, premiere = 1
    	
    	$.ajax({
    		url:"admin.premiere.mo?movieNo="+mno,
    		type:"post",
    		data: {"movieNo" : mno, "premiere" : premiere},
    		
    		success:function(result) {
    			if(result === "success") {
   					console.log("CHANGED to "+ isOpen);
   					isOpen = $("input[name=if_premiere]").prop("checked");
   					$("#only_when_playing").toggle(500);
    			} else {
    				// result === "failure"
    				console.log(isOpen);
    				alert("개봉 여부 변경에 실패하였습니다.");
    				
    				// 스위치 원상 복구하기
					$("input[name=if_premiere]").prop("checked",!isOpen);
					isOpen = !isOpen;
    				console.log(isOpen);
    			}
    		},
    		error:function() {
    			alert("An error has occurred..");
    		}
    	});
    }
    
    function removeMovie(isOpen) {
    	    	
    	if(isOpen) {
    		alert("현재 상영중인 영화는 삭제할 수 없습니다.");
    		return false;
    	} else if(!confirm("삭제하면 되돌릴 수 없습니다. 정말 삭제하시겠습니까?")) {
    		return false;
    	} else {
    		// 현재 개봉중이 아닌 영화에서, 확인창에서 '확인'을 눌렀을 경우
    		
    		let mno = $("#mno").val();
    		$.ajax({
    			url:"admin.deletemovie.mo?movieNo="+mno,
    			type:"post",
    			data: {"movieNo" : mno},
    			
    			success: function(result) {
    				if(result === "success") {
	    				alert("삭제가 완료되었습니다.");
    				} else {
    					// if result === "failure"
    					alert("영화가 삭제되지 않았습니다.");
    				}
    				
    				// 성공 여부와 상관없이 리다이렉트 - 뚫렸을 때 시간 벌 목적
    				location.href = 'movielist_ad.mo';
    			},
    			error: function(result) {
    				alert("An error has occurred..");
    			}
    		});
    		
    	}
    }
    </script>
    
</body>
</html>