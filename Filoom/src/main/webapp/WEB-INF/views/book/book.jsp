<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <img src ="./조커2.jpg">
                </div>
                
                <div id = "selectMovie">
                    <div id = "selectMovie_detail">
                        <div id ="selectMovie_a">
                            <div id = "selectMovie_title">
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

                <div id="date-area"> 

                    <!-- 월 선택 --> 
                    <div id="month-area">
                        <div onclick="previous()"> < </div>
                        <div id="yearAndMonth"></div>
                        <div onclick="next()">  > </div>
                    </div>


                    <!-- 달력 -->

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

                            <tbody id="calendar-body">
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
                   
                    <div id ="movie_selection">
                        <div id = "selection_img">
                            <img src="">
                        </div>
                        <div id = "selection_detail">

                        </div>
                    </div>
                    

                </div>

            </div>

            
            <div id = "buttonArea_1">

                <button id = "booking_1">영화 선택</button> <br>
                
            </div>
        
            <div id = "detail_2">
                
              
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
          
            
            <div id = "detail_3" >
                
                <div id = "detail_content_3">
                
                    <input type ="text" id ="movieTitle"><br>
                    <input type ="text" id ="movieDate"><br>
                    <input type ="text" id ="movieSeat">

                </div>

            </div>

            
            <div id = "buttonArea_3">

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
	
	// 좌석 클릭 이벤트 처리 함수
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
	
	// 좌석 생성 실행
	generateSeats("left_table", 5, 2, "L", reservedSeats.left);
	generateSeats("middle_table", 5, 8, "M", reservedSeats.middle);
	generateSeats("right_table", 5, 2, "R", reservedSeats.right);
	

    
    

    </script>
</body>
</html>