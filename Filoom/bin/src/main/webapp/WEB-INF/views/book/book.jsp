<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel = "stylesheet" href="resources/css/aaa.css"/>
    <link rel = "stylesheet" href="resources/css/cinema_list.css"/>
    <link rel = "stylesheet" href="resources/css/caa.css"/>
    <style>

        #detail_1, #detail_2, #detail_3,
        #seat_1, #date, #seat_2,
        #buttonArea_1, #buttonArea_2, #buttonArea_3 {
            display: none;
        }

        /* 활성화된 요소만 보이도록 설정 */
        .active {
            display: block;
        }

        /* 초기 화면 보이기 (첫 단계) */
        #detail_1, #seat_1, #buttonArea_1 {
            display: block;
        }

        .step {
            display: flex; /* Flexbox 활성화 */
            align-items: center; /* 수직 정렬 */
            justify-content: center; /* 수평 정렬 */
            width: 120px; /* 단계 박스 너비 */
            height: 60px; /* 단계 박스 높이 */
            border-radius: 5px; /* 모서리 둥글게 */
            background-color: #f0f0f0; /* 기본 배경색 */
            font-size: 16px; /* 텍스트 크기 */
            text-align: center; /* 텍스트 중앙 정렬 */
            transition: all 0.3s ease; /* 부드러운 전환 */
        }

        .step.active {
            background-color: #493628; /* 활성화된 단계 배경 */
            color: white; /* 활성화된 단계 텍스트 색 */
        }

        .step.completed {
            background-color: #D6C0B3; /* 완료된 단계 배경 */
            color: #AB886D; /* 완료된 단계 텍스트 색 */
        }

        .step a {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 부모 색상 따라감 */
            display: block; /* 중앙 정렬을 위해 block으로 설정 */
        }

        .transition {
            opacity: 0; /* 투명 상태 */
            transform: translateX(100%); /* 오른쪽으로 이동 */
            position: absolute; /* 위치 고정 */
            width: 100%; /* 화면 너비 */
            transition: opacity 0.5s ease, transform 0.5s ease; /* 전환 효과 */
        }

        /* 활성화 상태 (표시 상태) */
        .transition.active {
            opacity: 1; /* 투명하지 않음 */
            transform: translateX(0); /* 제자리 */
        }
    </style>
</head>
<body>
    <div id = "third_page">
        <!-- 좌석 배치도 들어갈 영역 -->
        <div id = "contents">
            
            
            <div id = "flow">
                <div id = "movieSelect" class="step">
                    <a>영화 선택</a>
                </div>

                <div id = "dateSelect" class="step">
                    <a>날짜 선택</a>
                </div>
                   
                <div id = "seatSelect" class="step">
                    <a>좌석 선택</a>
                </div>
            </div>

            <div style ="height: 10px;"></div>

            <div id = "seat_1">
                
                <div id = "thumbnail_img">
                    <img src ="${movie.imagePath}/${movie.fileCodename}">
                    <img src ="./조커2.jpg">
                </div>
                
                <div id = "selectMovie">
                    <div id = "selectMovie_detail">
                        <div id ="selectMovie_a">
                            <div id = "selectMovie_title">
<<<<<<< Updated upstream
                                <a>${ movie.movieTitle }</a>
                            </div>
                            <div id = "selectMovie_summary">
                                <a>${ movie.description }</a>
                            </div>
                            <input type="hidden" name="movieDetailNo" value="${ movie.movieNo}">
                        </div>
                    </div>
                    
                                <a>조커</a>
                            </div>
                            <div id = "selectMovie_summary">
                                <a>아아</a>
                            </div>
                        </div>
                    </div>
                    <div id = "selectMovie_subImg">

                        <div id = "subImg">

                        </div>
                        <div id = "subImg">

                        </div>
                        <div id = "subImg">

                        </div>

                    </div>
                </div>
                
            </div>
   
            <div id = "seat_2">
    
                <div id ="seat1">
                    <div id = "screen">

                    </div>

                    <div id = "real_seat">
                        <div id="left_seat">
                            <table id="left_table"></table>
                        </div>
                        <div id="middle_seat">
                            <table id="middle_table"></table>
                        </div>
                        <div id="right_seat">
                            <table id="right_table" ></table>
                        </div>

                    </div>

                    <div id ="seat1_blank">

                    </div>

                </div>

            </div>

            <div id = "date" style="display: none;"> 

                <div id="date_area"> 

                    <!-- 월 선택 --> 
                    <div id="month_area">
                <div id="date-area"> 

                    <!-- 월 선택 --> 
                    <div id="month-area">
                        <div onclick="previous()"> < </div>
                        <div id="yearAndMonth"></div>
                        <div onclick="next()">  > </div>
                    </div>


                    <!-- 달력 -->

                    <div id="calendar_area">
                        <table id="date_table"> 
                    <div id="calendar-area">
                        <table id="date-table"> 
                            <thead>
                                <tr>
                                    <th>Sun</th>
                                    <th>Mon</th>
                                    <th>Tue</th>
                                    <th>Wed</th>
                                    <th>Thr</th>
                                    <th>Fri</th>
                                    <th>Sat</th>
                                </tr>
                            </thead>

                            <tbody id="calendar_body">
                            </tbody>

                        </table>

                    </div>
                </div>     



            </div>

        </div>

     
        <!-- 예매 정보 확인 영역 -->
        <div id = "contents2">

          
            <div id = "detail_1">
                
                <div id = "detail_content">
                
                <c:forEach var="b" items="${ requestScope.list }">
				    <div id="movie_selection_${b.movieNo}" class="movie_selection" data-movie-no="${b.movieNo}">
				            <input type="hidden" name="movieNo" value="${b.movieNo}">
				            <div id="selection_img">
				                <img src="" alt="">
				            </div>
				            <div id="selection_detail">
				                <h2>${b.movieTitle}</h2>
				                <a>${b.filmRate}</a>
				                <a>${b.openDate} 개봉</a><br>
				                <a>${b.runtime} 분</a>
				            </div>
				   </div>
				</c:forEach>
                   
				<script>
					
					$(document).ready(function () {
					    $(".movie_selection").on("click", function () {
					        const movieNo = $(this).data("movie-no"); // data-movie-no 값 가져오기
					        if (movieNo) {
					            fetchMovieDetails(movieNo);
					        } else {
					            console.error("에러");
					        }
					    });
					});
	
					function fetchMovieDetails(movieNo) {
					    $.ajax({
					        url: "movie.de", // 요청할 URL
					        type: "GET",           // HTTP 메서드
					        data: { movieNo: movieNo }, // 요청 파라미터
					        success: function (data) {
					            
					        	//console.log(data);

					            // 이미지 업데이트
					            $("#thumbnail_img img").attr("src", `${data.imagePath}/${data.fileCodename}`);

					            // 영화 제목과 설명 업데이트
					            $("#selectMovie_title a").text(data.movieTitle);
					            $("#selectMovie_summary a").text(data.description);
	
					   
					            
					            // 숨겨진 영화 번호 값 업데이트
					            $("input[name='movieDetailNo']").val(data.movieNo);

					            // 서브 이미지 업데이트
					            const subImgContainer = $("#selectMovie_subImg #subImg");
					            subImgContainer.empty(); // 기존 이미지 제거

					            if (data.subImages && data.subImages.length > 0) {
					                data.subImages.forEach(function (imgUrl) {
					                    subImgContainer.append(`<img src="${imgUrl}" alt="sub image">`);
					                });
					            } else {
					                subImgContainer.append("<p>서브 이미지가 없습니다.</p>");
					            }
					        }
					    });
					}
						
				</script>
                   
                    <div id ="movie_selection">
                        <div id = "selection_img">
                            <img src="">
                        </div>
                        <div id = "selection_detail">

                        </div>
                    </div>
                    

                </div>

            </div>
            
            <script>
	            function loadMovieDetail(movieNo) {
	               
	                fetch(`/getMovieDetail?movieNo=${movieNo}`)
	                    .then(response => response.json())
	                    .then(data => {
	                        
	                        document.querySelector('#thumbnail_img img').src = data.moviePoster;
	                        document.querySelector('#selectMovie_title a').textContent = data.movieTitle;
	                        document.querySelector('#selectMovie_summary a').textContent = data.summary;
	
	                        
	                        const subImgContainer = document.querySelectorAll('#subImg');
	                        subImgContainer.forEach((element, index) => {
	                            if (data.subImages[index]) {
	                                element.innerHTML = `<img src="${data.subImages[index]}" alt="sub image">`;
	                            } else {
	                                element.innerHTML = '';
	                            }
	                        });
	                    })
	                    .catch(error => console.error('Error fetching movie detail:', error));
	            }
            
            </script>

            
            <div id = "buttonArea_1">

                <button id = "booking_1" class="booking-btn" data-movie-no="${b.movieNo}">영화 선택</button> <br>
               
            </div>
            
            <script>
	            function renderCalendar() {
	                showCalendar(currentYear, currentMonth);
	            }

            
	            let movieData = [ //샘플데이터
	               
	                
	            ];


	         // 각 movie_selection 클릭 이벤트 처리
	         $(document).on("click", ".movie_selection", function () {
	             selectedMovieNo = $(this).data("movie-no"); // 클릭된 div의 movie-no 값 저장
	             // console.log("Selected Movie Number:", selectedMovieNo);

	             // 선택된 영화 스타일 업데이트 (선택된 상태 표시)
	             $(".movie_selection").removeClass("selected"); // 이전 선택 제거
	             $(this).addClass("selected"); // 현재 선택 추가
	         });

	         // 버튼 클릭 이벤트 처리
	         $(document).on("click", ".booking-btn", function () {
	             if (!selectedMovieNo) {
	                 alert("영화를 먼저 선택해주세요!"); // 선택되지 않았을 경우 경고
	                 return;
	             }

	             console.log("Button clicked with selected movieNo:", selectedMovieNo);

	             // AJAX 요청
	             $.ajax({
	                 url: "book.ca",
	                 type: "GET",
	                 data: { movieNum: selectedMovieNo }, // 저장된 selectedMovieNo 사용
	                 success: function (result) {
	                     console.log("AJAX Success:", result);

	                     movieData.length = 0;	
	                     
	                     // 서버에서 받은 데이터를 가공
	                     let newMovies = result.map(item => ({
	                         playingNo: item.playingNo,
	                         playTime: item.playTime,
	                         movieNo: item.movieNo,
	                         screenNo: item.screenNo,
	                         status: item.status,
	                         runTime: item.runtime,
	                         seatCount: item.occupiedSeats,
	                         totalCount: item.screenCapacity
	                     }));

	                     // 기존 movieData 배열에 새 데이터 추가
	                     movieData.push(...newMovies);

	                     // 캘린더 렌더링
	                     renderCalendar();
	                 },
	                 error: function () {
	                     console.error("AJAX Error");
	                 },
	                 complete: function () {
	                     console.log("AJAX 연결 완료");
	                 }
	             });
	         });

	            
	            $(function(){
	            	//화면이 로드된후 캘린더 보여주기
	            	showCalendar(currentYear,currentMonth);
	            });
	            //현재날짜
	            
	            
	                const today = new Date();
	                //console.log(today);
	                //현재년월
	                let currentYear = today.getFullYear();
	                let currentMonth = today.getMonth(); // -1
	                //월 배열
	                const months = ["01", "02", "03", "04", "05", "06",
	                                "07", "08", "09", "10", "11", "12"]; // months[현재월인덱스] =>
	                //년-월을 나타낼 div요소
	                let yearAndMonthDiv = $("#yearAndMonth");
	                //영화를 선택한경우, 현재 달의 상영정보를 변수에 저장
	                //상영정보 클래스에  (RUNTIME + 예약된 좌석수 + 전체좌석수) 추가하면 좋을듯
	            
	                //영화를 선택했을때 해당하는 달의 영화정보를 json객체 형식으로 변수에 담기
	                //달력만들어주기
	                function showCalendar(year,month){
	                    let firstDay = new Date(year, month, 1).getDay(); //요일 일:0~토:6
	                    let tbody = $("#calendar_body");
	                    tbody.html("");
	                    //상단에 년,월
	        			yearAndMonthDiv.text(year+" - "+month);
	                    let date = 1;
	                    let totalDays = daysInMonth(year,month);
	                    for(let i=0;i<6; i++){
	                        // let row = document.createElement("tr");
	                        let row = $("<tr></tr>");
	                        //console.log(row);
	                        for(let j=0;j<7;j++){
	                            //let cell = document.createElement("td");
	                            let cell = $("<td></td>");
	                            if(( (i==0) && (j<firstDay) )|| (date>totalDays)) {
	                                row.append(cell);
	                            }else{
	                                cell.text(date);
	                                if( date==today.getDate() && year == today.getFullYear() && month === today.getMonth()){
	                                    cell.css("color","red");  //오늘날짜인경우
	                                }
	                                let fullDate = formatDate(new Date(year, month, date));
	                                if(movieData.some(movie=>movie.playTime.includes(fullDate))){   //선택한 날짜에 상영하는 영화가 있는지
	                                    cell.addClass('has_movie');  //클래스속성추가 (달력에 영화가 있는날 표시)
	                                }else{
	                                    cell.addClass('no_movie');  //클래스속성추가 (달력에 영화가 있는날 표시)
	                                }
	                                let currentDate = date;
	                                let cellYear = year;
	                                let cellMonth = month;
	                                cell.on('click',function(){
	                                    let selectDate = new Date(cellYear,cellMonth,currentDate);
	                                    showMovieInfo(selectDate);
	                                });
	                                row.append(cell);
	                                date++;
	                            }
	                        }
	                        $("#calendar_body").append(row);
	                        if(date>totalDays){
	                            break;
	                        }
	                    }
	                }
	                // 선택한 월이 총 몇일인지 구하는 메소드
	                function daysInMonth(year,month){
	                    return new Date(year,month+1,0).getDate(); // 0-> 전월의 마지막 일
	                }
	                // Date 를 yyyy-mm-dd 형식으로 변환
	                function formatDate(date){
	                    let yyyy = date.getFullYear();
	                    let mm = String(date.getMonth()+1).padStart(2,'0');
	                    let dd = String(date.getDate()).padStart(2,'0');
	                    return yyyy+"-"+mm+"-"+dd;
	                }
	                //날짜를 클릭했을경우 상영정보 띄어주는 메소드
	                function showMovieInfo(date){
	                    $("#time").html("");
	                    const selectDate = formatDate(date);
	                    let movieInfo ="";
	        			for(let i=0;i<movieData.length;i++){
	        				if(movieData[i].playTime.includes(selectDate)){ //해당날짜에 상영되는 영화가 있다면
	        			    	   
	        			        let startEndTime = calculationTime(movieData[i].playTime, movieData[i].runTime);
	        			   
	        			        //상영 시작시간 , 상영 끝나는 시간 구하기
	        			       
	        			
	        			        //상영목록에 정보 뿌려주기
	        			        //선택시 영화상영번호
	        			       
	        			      
	        			        let playingNo = movieData[i].playingNo;
	        			  
	        			       
	        			        //  <label>12:30 ~ 14:40 1관 40/60</label>
	        			        //  <input type="radio" id="input11" name="playingNo" value="영화상영번호" hidden">
	        			        movieInfo += "<div onclick='movieInfoClick()'>"+
	        			        					"<label for='input"+i+"'>"+startEndTime[0]+" ~ "+startEndTime[1]+" "+movieData[i].screenNo+"관 "+ String(movieData[i].seatCount).padStart(2,'0') +"/"+ movieData[i].totalCount +"</label>"+
	        			        					"<input type='radio' id='input" + i + "' name='playingNo' value='"+playingNo+"'hidden>"+
	        			        			"</div>";
	        			        						       
	        			    }
	        			}
	        			//console.log(movieInfo);
	        			$("#time").append(movieInfo);
	        			$("#movie_date").text(selectDate);
	        			
	                }
	                //상영시간 + 러닝타임 계산해주는 메소드 (24시간형식)
	                function calculationTime (playTime,runTime){
	                    let startTime = playTime.substring(11,16);
	                    let [hours, minutes] = startTime.split(":").map(Number);
	                    minutes += runTime;
	                    hours += Math.floor(minutes/60);
	                    minutes %= 60;
	                    hours %= 24;
	        			let endTime = String(hours).padStart(2,'0')+":"+String(minutes).padStart(2,'0');
	                    return [startTime,endTime];
	                }
	                //상영시간을 클릭했을때 실행할 메소드 : 영화상영번호 넘기기~
	                function clickTime(playingNo){
	                    alert("클릭됨! 영화상영번호"+playingNo);
	                    //$(this) 로 div 요소 선택해서 #selectTime 아이디값 부여하고 싶은데 안되네 (선택된 상영정보만 선택,나머지는 해제)
	                }
	                //다음달
	                function next(){
	                    currentYear=currentMonth===11?currentYear + 1:currentYear;
	                    currentMonth=(currentMonth+1)%12;
	                    showCalendar(currentYear,currentMonth);
	                }
	                //이전달
	                function previous(){
	                    ///////////////////////////////////////////////////////////////////////////
	                    //현재달보다 이전달은 넘어갈수 없게 하기
	                    currentYear=currentMonth===0?currentYear -1:currentYear;
	                    currentMonth=currentMonth===0? 11 : currentMonth-1;
	                    showCalendar(currentYear,currentMonth);
	                }
	                function movieInfoClick(){
	                    let input = $("#time>div>input");
	                    input.each(function(){
	                        if($(this).prop("checked")){
	                            $(this).parent().attr("id","selectTime");
	                        }else{
	                            $(this).parent().attr("id","");
	                        }
	                    });
	                }
	            
	            
            </script>
                <button id = "booking_1">영화 선택</button> <br>
                
            </div>
        
            <div id = "detail_2">
                
              
                <div id="movie_time">
                    <div id="title_date">
                        <span>19 조커</span> 
                        <span id="movie_date" style="font-size:30px"></span>
                <div id="movie-time">
                    <div id="title-date">
                        <span>19 조커</span> -
                        <span id="movie-date"></span>
                    </div>
                    <div id="time">
                       
                    </div>
                </div>

            </div>

           
            <div id = "buttonArea_2">

                <button id = "booking_2">시간 선택</button> <br>
                <button id = "past">이전</button>
                
            </div>
          
          
          
          	<script>
          	
          	 // 임시 예약 상태: 예약된 좌석
    		const reservedSeats = {
    		    left: ["L1-1", "L2-2"],
    		    middle: ["M3-3", "M4-5"],
    		    right: ["R5-1"]
    		};
    		
    		// 좌석 생성 함수
    		function generateSeats(tableId, rows, cols, prefix, reserved) {
    		    const table = document.getElementById(tableId);
    		    for (let i = 1; i <= rows; i++) {
    		        const row = document.createElement("tr");
    		        for (let j = 1; j <= cols; j++) {
    		            const seatId = prefix + i + '-' + j;
    		            const cell = document.createElement("td");
    		            const button = document.createElement("button");
    		            button.textContent = seatId;
    		            button.dataset.id = seatId;
    		
    		            // 예약 상태 적용
    		            if (reserved.includes(seatId)) {
    		                button.classList.add("reserved");
    		                button.disabled = true;
    		            }
    		
    		            // 클릭 이벤트 추가
    		            button.onclick = function() {
    		                handleSeatClick(button);
    		            };
    		            cell.appendChild(button);
    		            row.appendChild(cell);
    		        }
    		        table.appendChild(row);
    		    }
    		}
    		
    		function updateReservedSeats(seatData) {
    		    seatData.forEach(function (seat) {
    		        const seatNo = seat.seatNo;

    		        // 좌석 번호에 따라 해당 영역에 추가
    		        if (seatNo.startsWith("L")) {
    		            if (!reservedSeats.left.includes(seatNo)) {
    		                reservedSeats.left.push(seatNo);
    		            }
    		        } else if (seatNo.startsWith("M")) {
    		            if (!reservedSeats.middle.includes(seatNo)) {
    		                reservedSeats.middle.push(seatNo);
    		            }
    		        } else if (seatNo.startsWith("R")) {
    		            if (!reservedSeats.right.includes(seatNo)) {
    		                reservedSeats.right.push(seatNo);
    		            }
    		        }
    		    });

    		    console.log("Updated reservedSeats:", reservedSeats);
    		}
    		
    		// 좌석 클릭 이벤트 처리 함수
    		/*
    		function handleSeatClick(button) {
    		    const inputField = document.getElementById("movieSeat");
    		    const seatId = button.dataset.id;
    		
    		    if (button.classList.contains("selected")) {
    		        // 선택 해제
    		        button.classList.remove("selected");
    		        inputField.value = inputField.value
    		            .split(", ")
    		            .filter(function(id) {
    		                return id !== seatId;
    		            })
    		            .join(", ");
    		    } else {
    		        // 선택
    		        button.classList.add("selected");
    		        inputField.value = inputField.value
    		            ? inputField.value + ", " + seatId
    		            : seatId;
    		    }
    		}
    		*/
    		
    		function handleSeatClick(button) {
    		    const inputField = document.getElementById("movieSeat");
    		    const seatId = button.dataset.id;
    		    
    		    let selectedValue = $("#time input[name='playingNo']:checked").val();
    		    
    		    if (button.classList.contains("selected")) {
    		        // 선택 해제
    		        button.classList.remove("selected");
    		        inputField.value = inputField.value
    		            .split(", ")
    		            .filter(function (id) {
    		                return id !== seatId; // 선택 해제된 좌석 제거
    		            })
    		            .join(", ");
    		        $.ajax({
      	                url: "book.fb",         
      	                type: "GET",            
      	                data: { seatId: seatId,
      	                	playingNo: selectedValue
      	                }, 
      	                success: function (response) {
      	                	
      	                },error:{
      	                	
      	                },complete:{
      	                	
      	                }
      	                
    		        });
      	                
      	                
    		        
    		    } else {
    		        // 선택
    		        button.classList.add("selected");
    		        inputField.value = inputField.value
    		            ? inputField.value + ", " + seatId
    		            : seatId; // 선택된 좌석 추가
    		        $.ajax({
      	                url: "book.fd",         
      	                type: "GET",            
      	                data: { seatId: seatId,
      	                	playingNo: selectedValue
      	                }, 
      	                success: function (response) {
      	                	
      	                	
      	                },error:{
      	                	
      	                	
      	                },complete:{
      	                	
      	                	
      	                }
      	            });
    		    }

    		    // inputField의 value 업데이트
    		    inputField.setAttribute("value", inputField.value);
    		}
    		
    		function refreshSeats(a) {
    		    // 좌석 테이블 초기화
    		    document.getElementById("left_table").innerHTML = "";
    		    document.getElementById("middle_table").innerHTML = "";
    		    document.getElementById("right_table").innerHTML = "";

				if(a == 1){	    		    
	    		    // 좌석 다시 생성
	    		    generateSeats("left_table", 5, 2, "L", reservedSeats.left);
	    		    generateSeats("middle_table", 5, 8, "M", reservedSeats.middle);
	    		    generateSeats("right_table", 5, 2, "R", reservedSeats.right);
				}
				if(a==2){
				
	    		    // 좌석 다시 생성
	    		    generateSeats("left_table", 4, 2, "L", reservedSeats.left);
	    		    generateSeats("middle_table", 4, 8, "M", reservedSeats.middle);
	    		    generateSeats("right_table", 4, 2, "R", reservedSeats.right);
				}
				
			}
    		
          	
          	
          	$(document).ready(function () {
          		
          		 
          		
          	    $("#booking_2").click(function () {
          	        // 선택된 라디오 버튼 값 가져오기
          	        let selectedValue = $("#time input[name='playingNo']:checked").val();
          	     	
          	        const inputField2 = document.getElementById("movieTitle");
          	   		const inputField3 = document.getElementById("movieDate");
          	   		
          	   		inputField2.setAttribute("value", inputField2.value); 
          	        
          	   		if (selectedValue) {
          	            // AJAX 요청
          	            $.ajax({
          	                url: "book.se",         
          	                type: "GET",            
          	                data: { playingNo: selectedValue }, 
          	                success: function (response) {
          	                   
          	                	console.log("Response received:", response);
								
          	                	const movieTitle = response[0] && response[0].movieTitle ? response[0].movieTitle : "제목 없음";
          	                    inputField2.value = movieTitle; // input value 설정
          	                    inputField2.setAttribute("value", movieTitle);
          	                    
          	                    
          	                    console.log(movieTitle);
	          	                    
          	                    const playTime = response[0] && response[0].playTime ? response[0].playTime : "00:00:00.0";
                                const runtime = response[0] && response[0].runtime ? response[0].runtime : 0;

                                // playTime에서 시작 시간 추출 (HH:mm 형식)
                                const startTime = playTime.substring(11, 16); // "HH:mm"
                                const startHours = parseInt(startTime.split(":")[0], 10);
                                const startMinutes = parseInt(startTime.split(":")[1], 10);
                              
	                            console.log(startTime);
	                            
	                            let endHours = startHours;
	                            let endMinutes = startMinutes + runtime;

	                            if (endMinutes >= 60) {
	                                endHours += Math.floor(endMinutes / 60);
	                                endMinutes = endMinutes % 60;
	                            }
	                            
	                            console.log(endHours);
	                            console.log(endMinutes);
	                            
	                            const endTime = (endHours < 10 ? "0" + endHours : endHours) + ":" + (endMinutes < 10 ? "0" + endMinutes : endMinutes);

	                            // movieDate 설정 (20xx-xx-xx HH:mm~HH:mm 형식)
	                            const movieDate = playTime.substring(0, 10) + " " + startTime + "~" + endTime;
	                            inputField3.value = movieDate; // input value 설정
	                            
	                            console.log(movieDate);
	                            
	                            inputField3.setAttribute("value", movieDate);
          	                	
          	                    // 기존 reservedSeats 배열 초기화
          	                	reservedSeats.left = [];
          	                    reservedSeats.middle = [];
          	                    reservedSeats.right = [];

          	                    if (Array.isArray(response)) {
          	                        response.forEach(function (seat) {
          	                          	const seatNo = seat.seatNo;

          	                            if (seatNo) {
          	                                if (seatNo.startsWith("L")) {
          	                                    if (!reservedSeats.left.includes(seatNo)) {
          	                                        reservedSeats.left.push(seatNo);
          	                                    }
          	                                } else if (seatNo.startsWith("M")) {
          	                                    if (!reservedSeats.middle.includes(seatNo)) {
          	                                        reservedSeats.middle.push(seatNo);
          	                                    }
          	                                } else if (seatNo.startsWith("R")) {
          	                                    if (!reservedSeats.right.includes(seatNo)) {
          	                                        reservedSeats.right.push(seatNo);
          	                                    }
          	                                }
          	                            }
          	                        });
          	                    }

          	                    // 좌석 상태를 새로 렌더링
          	                    const screenNo = response[0]?.screenNo;
          	                     if (screenNo === 1) {
			                        refreshSeats(1);
			                  
          	                     } else if (screenNo === 2) {
			                     
          	                    	refreshSeats(2);
		                     	 } else {
		                    
		                    	 	console.error("Unknown screenNo:", screenNo);
		                    
		                     	 }  
          	                     
          	                   $("#movieSeat").val(""); // movieSeat 초기화
          	                     
          	               
          	                },
          	                error: function (xhr, status, error) {
          	                   
          	                    alert("예약 요청 실패: " + error);
          	                
          	                }
          	            });
          	        } else {
          	            alert("시간을 선택해주세요!");
          	        }
          	    });
          	});	
          	
          	</script>
            
            <div id = "detail_3" >
                
                <div id = "detail_content_3">
                
                    <input type ="text" id ="movieTitle"><br>
                    <input type ="text" id ="movieDate"><br>
                    <input type ="text" id ="movieSeat" >
                    <input type ="text" id ="movieSeat">

                </div>

            </div>

            
            <div id = "buttonArea_3">

                <button id = "booking_3" >결제 진행</button> <br>
                <button id = "past" class="past-button">이전</button>
                
            </div>

			

			<script>
			
					
			</script>            
                <button id = "booking_3">결제 진행</button> <br>
                <button id = "past">이전</button>
                
            </div>
            

        </div>

    </div>

    <script>
    let currentStep = 0;

	// 단계별 매핑
	const steps = [
	    { detailId: "detail_1", seatId: "seat_1", buttonAreaId: "buttonArea_1", nextButtonId: "booking_1" },
	    { detailId: "detail_2", seatId: "date", buttonAreaId: "buttonArea_2", nextButtonId: "booking_2" },
	    { detailId: "detail_3", seatId: "seat_2", buttonAreaId: "buttonArea_3", nextButtonId: "booking_3" },
	];
	function updateStepIndicator() {
	    const steps = ["movieSelect", "dateSelect", "seatSelect"];
	    steps.forEach((stepId, index) => {
	        const stepElement = document.getElementById(stepId);
	        if (index === currentStep) {
	            stepElement.classList.add("active"); // 현재 단계
	            stepElement.classList.remove("completed");
	        } else if (index < currentStep) {
	            stepElement.classList.add("completed"); // 완료된 단계
	            stepElement.classList.remove("active");
	        } else {
	            stepElement.classList.remove("active", "completed"); // 나머지 단계
	        }
	    });
	}
	
	// 단계 초기화 시 호출
	function initializeSteps() {
	    steps.forEach((step, index) => {
	        document.getElementById(step.detailId).style.display = index === currentStep ? "block" : "none";
	        document.getElementById(step.seatId).style.display = index === currentStep ? "block" : "none";
	        document.getElementById(step.buttonAreaId).style.display = index === currentStep ? "block" : "none";
	    });
	    updateStepIndicator();
	}
	
	// 이전/다음 버튼 클릭 시 호출
	steps.forEach((step, index) => {
	    document.getElementById(step.nextButtonId).addEventListener("click", function () {
	        if (currentStep < steps.length - 1) {
	            document.getElementById(steps[currentStep].detailId).style.display = "none";
	            document.getElementById(steps[currentStep].seatId).style.display = "none";
	            document.getElementById(steps[currentStep].buttonAreaId).style.display = "none";
	
	            currentStep++;
	            document.getElementById(steps[currentStep].detailId).style.display = "block";
	            document.getElementById(steps[currentStep].seatId).style.display = "block";
	            document.getElementById(steps[currentStep].buttonAreaId).style.display = "block";
	            
	            updateStepIndicator(); // 단계 업데이트
	        }
	    });
	});
	
	document.querySelectorAll("#past").forEach((btn) => {
	    btn.addEventListener("click", function () {
	        if (currentStep > 0) {
	            document.getElementById(steps[currentStep].detailId).style.display = "none";
	            document.getElementById(steps[currentStep].seatId).style.display = "none";
	            document.getElementById(steps[currentStep].buttonAreaId).style.display = "none";
	
	            currentStep--;
	            document.getElementById(steps[currentStep].detailId).style.display = "block";
	            document.getElementById(steps[currentStep].seatId).style.display = "block";
	            document.getElementById(steps[currentStep].buttonAreaId).style.display = "block";
	            
	            updateStepIndicator(); // 단계 업데이트
	        }
	    });
	});
	/////////////////
	
        document.addEventListener("DOMContentLoaded", function () {
        
        	const movieSelections = document.querySelectorAll("#movie_selection");
	
	        movieSelections.forEach((selection) => {
	            selection.addEventListener("click", () => {
	               
	                movieSelections.forEach((s) => s.classList.remove("selected"));
	               
	                selection.classList.add("selected");
	                
	            });
	        });
	    });


	
	
	
	
	
	   


	


    
// 단계별 매핑
const steps = [
    { detailId: "detail_1", seatId: "seat_1", buttonAreaId: "buttonArea_1", nextButtonId: "booking_1" },
    { detailId: "detail_2", seatId: "date", buttonAreaId: "buttonArea_2", nextButtonId: "booking_2" },
    { detailId: "detail_3", seatId: "seat_2", buttonAreaId: "buttonArea_3", nextButtonId: "booking_3" },
];
function updateStepIndicator() {
    const steps = ["movieSelect", "dateSelect", "seatSelect"];
    steps.forEach((stepId, index) => {
        const stepElement = document.getElementById(stepId);
        if (index === currentStep) {
            stepElement.classList.add("active"); // 현재 단계
            stepElement.classList.remove("completed");
        } else if (index < currentStep) {
            stepElement.classList.add("completed"); // 완료된 단계
            stepElement.classList.remove("active");
        } else {
            stepElement.classList.remove("active", "completed"); // 나머지 단계
        }
    });
}

// 단계 초기화 시 호출
function initializeSteps() {
    steps.forEach((step, index) => {
        document.getElementById(step.detailId).style.display = index === currentStep ? "block" : "none";
        document.getElementById(step.seatId).style.display = index === currentStep ? "block" : "none";
        document.getElementById(step.buttonAreaId).style.display = index === currentStep ? "block" : "none";
    });
    updateStepIndicator();
}

// 이전/다음 버튼 클릭 시 호출
steps.forEach((step, index) => {
    document.getElementById(step.nextButtonId).addEventListener("click", function () {
        if (currentStep < steps.length - 1) {
            document.getElementById(steps[currentStep].detailId).style.display = "none";
            document.getElementById(steps[currentStep].seatId).style.display = "none";
            document.getElementById(steps[currentStep].buttonAreaId).style.display = "none";

            currentStep++;
            document.getElementById(steps[currentStep].detailId).style.display = "block";
            document.getElementById(steps[currentStep].seatId).style.display = "block";
            document.getElementById(steps[currentStep].buttonAreaId).style.display = "block";
            
            updateStepIndicator(); // 단계 업데이트
        }
    });
});

document.querySelectorAll("#past").forEach((btn) => {
    btn.addEventListener("click", function () {
        if (currentStep > 0) {
            document.getElementById(steps[currentStep].detailId).style.display = "none";
            document.getElementById(steps[currentStep].seatId).style.display = "none";
            document.getElementById(steps[currentStep].buttonAreaId).style.display = "none";

            currentStep--;
            document.getElementById(steps[currentStep].detailId).style.display = "block";
            document.getElementById(steps[currentStep].seatId).style.display = "block";
            document.getElementById(steps[currentStep].buttonAreaId).style.display = "block";
            
            updateStepIndicator(); // 단계 업데이트
        }
    });
});
/////////////////

        document.addEventListener("DOMContentLoaded", function () {
        const movieSelections = document.querySelectorAll("#movie_selection");

        movieSelections.forEach((selection) => {
            selection.addEventListener("click", () => {
                // 선택된 div 초기화
                movieSelections.forEach((s) => s.classList.remove("selected"));
                // 선택된 div만 selected 클래스 추가
                selection.classList.add("selected");
            });
        });
    });







    // 임시 예약 상태: 예약된 좌석
    const reservedSeats = {
        left: ["L1-1", "L2-2"],
        middle: ["M3-3", "M4-5"],
        right: ["R5-1"]
    };

    // 좌석 생성 함수
    function generateSeats(tableId, rows, cols, prefix, reserved) {
    const table = document.getElementById(tableId);
    for (let i = 1; i <= rows; i++) {
        const row = document.createElement("tr");
        for (let j = 1; j <= cols; j++) {
            const seatId = `${prefix}${i}-${j}`;
            const cell = document.createElement("td");
            const button = document.createElement("button");
            button.textContent = seatId;
            button.dataset.id = seatId;

            // 예약 상태 적용
            if (reserved.includes(seatId)) {
                button.classList.add("reserved");
                button.disabled = true;
            }

            // 클릭 이벤트 추가
            button.onclick = () => handleSeatClick(button);
            cell.appendChild(button);
            row.appendChild(cell);
        }
        table.appendChild(row);
    }
}

    // 좌석 클릭 이벤트 처리 함수
    function handleSeatClick(button) {
        const inputField = document.getElementById("movieSeat");
        const seatId = button.dataset.id;

        if (button.classList.contains("selected")) {
            // 선택 해제
            button.classList.remove("selected");
            inputField.value = inputField.value
                .split(", ")
                .filter(id => id !== seatId)
                .join(", ");
        } else {
            // 선택
            button.classList.add("selected");
            inputField.value = inputField.value
                ? `${inputField.value}, ${seatId}`
                : seatId;
        }
    }

    // 좌석 생성 실행
    generateSeats("left_table", 5, 2, "L", reservedSeats.left);
    generateSeats("middle_table", 5, 8, "M", reservedSeats.middle);
    generateSeats("right_table", 5, 2, "R", reservedSeats.right);


    $(function(){
            //화면이 로드된후 캘린더 보여주기
            showCalendar(currentYear,currentMonth);

        });

        //현재날짜
        const today = new Date(); 

        console.log(today);
        
        //현재년월
        let currentYear = today.getFullYear();
        let currentMonth = today.getMonth(); // -1
        
        //월 배열
        const months = ["01", "02", "03", "04", "05", "06",
                        "07", "08", "09", "10", "11", "12"]; // months[현재월인덱스] => 


        //년-월을 나타낼 div요소                      
        let yearAndMonthDiv = $("#yearAndMonth");


        //영화를 선택한경우, 현재 달의 상영정보를 변수에 저장
        //상영정보 클래스에  (RUNTIME + 예약된 좌석수 + 전체좌석수) 추가하면 좋을듯

        let movieData = [ //샘플데이터
            {playingNo:1,playTime:"2024-12-07 14:30:00", movieNo:1, screenNo:1,status:"Y",  runTime:130, seatCount:40, totalCount:60},
            {playingNo:2,playTime:"2024-12-07 17:30:00", movieNo:1, screenNo:2,status:"Y",  runTime:130, seatCount:50, totalCount:50},
            {playingNo:3,playTime:"2024-12-07 19:30:00", movieNo:1, screenNo:3,status:"Y",  runTime:130, seatCount:2, totalCount:40},
            {playingNo:4,playTime:"2024-12-08 14:30:00", movieNo:1, screenNo:1,status:"Y",  runTime:130, seatCount:60, totalCount:60},
            {playingNo:5,playTime:"2024-12-08 17:30:00", movieNo:1, screenNo:2,status:"Y",  runTime:130, seatCount:0, totalCount:50},
            {playingNo:6,playTime:"2024-12-09 19:30:00", movieNo:1, screenNo:1,status:"Y",  runTime:130, seatCount:40, totalCount:60},
            {playingNo:7,playTime:"2024-12-10 23:30:00", movieNo:1, screenNo:1,status:"Y",  runTime:130, seatCount:51, totalCount:60},
            {playingNo:8,playTime:"2024-12-11 17:30:00", movieNo:1, screenNo:2,status:"Y",  runTime:130, seatCount:51, totalCount:50},
            {playingNo:9,playTime:"2024-12-11 23:30:00", movieNo:1, screenNo:3,status:"Y",  runTime:130, seatCount:51, totalCount:40},
            {playingNo:10,playTime:"2024-12-12 11:30:00", movieNo:1, screenNo:1,status:"Y",  runTime:130, seatCount:51, totalCount:60},
            {playingNo:11,playTime:"2024-12-12 15:30:00", movieNo:1, screenNo:2,status:"Y",  runTime:130, seatCount:51, totalCount:50},
            {playingNo:12,playTime:"2024-12-13 12:30:00", movieNo:1, screenNo:2,status:"Y",  runTime:130, seatCount:51, totalCount:50},
            {playingNo:13,playTime:"2024-12-13 16:30:00", movieNo:1, screenNo:3,status:"Y",  runTime:130, seatCount:51, totalCount:40},


        ];
        //영화를 선택했을때 해당하는 달의 영화정보를 json객체 형식으로 변수에 담기



        //달력만들어주기
        function showCalendar(year,month){
            let firstDay = new Date(year, month, 1).getDay(); //요일 일:0~토:6
            let tbody = $("#calendar-body");
            tbody.html("");

            //상단에 년,월
            yearAndMonthDiv.text(`${year}-${months[month]}`);

            let date = 1;
            let totalDays = daysInMonth(year,month);

            for(let i=0;i<6; i++){

                // let row = document.createElement("tr");
                let row = $("<tr></tr>");
                for(let j=0;j<7;j++){
                    //let cell = document.createElement("td");
                    let cell = $("<td></td>"); 
                    if(( (i==0) && (j<firstDay) )|| (date>totalDays)) {
                        row.append(cell);
                    }else{
                        cell.text(date);
                        if( date==today.getDate() && year == today.getFullYear() && month === today.getMonth()){
                            cell.css("color","red");  //오늘날짜인경우 
                        }

                        let fullDate = formatDate(new Date(year, month, date));
                        
                        if(movieData.some(movie=>movie.playTime.includes(fullDate))){   //선택한 날짜에 상영하는 영화가 있는지
                            cell.addClass('has-movie');  //클래스속성추가 (달력에 영화가 있는날 표시)
                        }else{
                            cell.addClass('no-movie');  //클래스속성추가 (달력에 영화가 있는날 표시)
                        }
                        let currentDate = date;
                        let cellYear = year;
                        let cellMonth = month;
                        cell.on('click',function(){
                            let selectDate = new Date(cellYear,cellMonth,currentDate);
                            showMovieInfo(selectDate);
                        });

                        row.append(cell);
                        date++;
                    }
                }
                $("#calendar-body").append(row);
                if(date>totalDays){
                    break;
                }
                
                
            }


        }
        

        // 선택한 월이 총 몇일인지 구하는 메소드
        function daysInMonth(year,month){
            return new Date(year,month+1,0).getDate(); // 0-> 전월의 마지막 일
        }

        // Date 를 yyyy-mm-dd 형식으로 변환
        function formatDate(date){
            let yyyy = date.getFullYear();
            let mm = String(date.getMonth()+1).padStart(2,'0');
            let dd = String(date.getDate()).padStart(2,'0');
            return `${yyyy}-${mm}-${dd}`;
        }


        //날짜를 클릭했을경우 상영정보 띄어주는 메소드
        function showMovieInfo(date){
            $("#time").html("");
            const selectDate = formatDate(date);
            for(let i=0;i<movieData.length;i++){ 
                if(movieData[i].playTime.includes(selectDate)){ //해당날짜에 상영되는 영화가 있다면
                    
                    let startEndTime = calculationTime(movieData[i].playTime, movieData[i].runTime);
                    //상영 시작시간 , 상영 끝나는 시간 구하기
                    

                    //상영목록에 정보 뿌려주기
                    //선택시 영화상영번호 

                    let playingNo = movieData[i].playingNo;
                    let movieInfo = `<div onclick="movieInfoClick()">
                                        <label for="input${i}"> ${startEndTime[0]} ~ ${startEndTime[1]} ${movieData[i].screenNo}관 (${String(movieData[i].seatCount).padStart(2,"0")}/${movieData[i].totalCount}) </label>
                                        <input type="radio" id="input${i}" name="playingNo" value="${playingNo}" >    
                                    </div>`;

                    $("#time").append(movieInfo);
                }

            }

            $("#movie-date").text(selectDate);

        }

        //상영시간 + 러닝타임 계산해주는 메소드 (24시간형식)
        function calculationTime (playTime,runTime){

            let startTime = playTime.substring(11,16); 

            let [hours, minutes] = startTime.split(":").map(Number);
            minutes += runTime;
            hours += Math.floor(minutes/60);
            minutes %= 60;
            hours %= 24;

            let endTime = `${String(hours).padStart(2,"0")}:${String(minutes).padStart(2,"0")}`;

            return [startTime,endTime];
        }


        //상영시간을 클릭했을때 실행할 메소드 : 영화상영번호 넘기기~
        function clickTime(playingNo){
            alert("클릭됨! 영화상영번호"+playingNo);
            //$(this) 로 div 요소 선택해서 #selectTime 아이디값 부여하고 싶은데 안되네 (선택된 상영정보만 선택,나머지는 해제)
            
            
        }
        

        //다음달
        function next(){
            currentYear=currentMonth===11?currentYear + 1:currentYear; 
            currentMonth=(currentMonth+1)%12;
            showCalendar(currentYear,currentMonth);
        }

        //이전달
        function previous(){
            ///////////////////////////////////////////////////////////////////////////
            //현재달보다 이전달은 넘어갈수 없게 하기
            currentYear=currentMonth===0?currentYear -1:currentYear; 
            currentMonth=currentMonth===0? 11 : currentMonth-1;
            showCalendar(currentYear,currentMonth);
        }

        
        function movieInfoClick(){
            let input = $("#time>div>input");
            input.each(function(){
                if($(this).prop("checked")){
                    $(this).parent().attr("id","selectTime");
                }else{
                    $(this).parent().attr("id","");
                }
            });

        }


    </script>
</body>
</html>