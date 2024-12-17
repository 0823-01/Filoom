<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- 나이스페이 연동 스크립트 구문 -->
<script src="https://pg-web.nicepay.co.kr/v3/common/js/nicepay-pgweb.js" type="text/javascript"></script>
<script type="text/javascript">
//결제창 최초 요청시 실행됩니다.
function nicepayStart(){
	goPay(document.payForm);
}

//[PC 결제창 전용]결제 최종 요청시 실행됩니다. <<'nicepaySubmit()' 이름 수정 불가능>>
function nicepaySubmit(){
	document.payForm.submit();
}

//[PC 결제창 전용]결제창 종료 함수 <<'nicepayClose()' 이름 수정 불가능>>
function nicepayClose(){
	alert("결제가 취소 되었습니다");
}

</script>



<style>
    /* 겹칠수도 있으니 나중에 지우기 */
     body{
        color: white;
        background-color: black;
    } 
    

    #outer{
        margin: auto;
        margin-top: 40px;
        margin-bottom: 40px;
        
        width:60%;
        background-color: #222222;
        display: flex;
        padding-bottom: 3%;
        border:1px solid white; 
        border-radius: 1%;
        
        
        
    }

    /* 결제하기 메인 타이틀 글씨 */
    #mainTitle{
        font-weight: bolder;
        font-size:50px;
        padding-top: 2%;
        padding-bottom:2%;
    }
    /* 타이틀 글씨 크기 */
    .infoTitle{
        font-weight: bolder;
        font-size: 30px;
        padding-top:2%;
        padding-bottom:1%;
    }
    

    /* 왼쪽영역 */

    /* 왼쪽 결제하기 영역 */
    #leftDiv{
        width: 60%;
        padding-left:3%;
        /* padding-right:3%; */
    }

    /* 왼쪽 영역에 padding left 주기 */
    #leftDiv>div>div{
        padding-left:2%;
        /* border: 1px solid red; */
    }
    #leftDiv>div>div>div{
        padding-left:2%;
        padding-bottom: 2%;
        padding-top:1%;
        /* border: 1px solid red; */
    }




    #leftDiv{
        width : 100%;
    }

    /* 예매정보영역 */
    #bookInfoArea{
        width: 100%;
        border-top: 3px solid white;
        
        
    }

    /* 이미지, 얘메정보 */
    #bookInfo{
        display:flex;    
        /* border:1px solid green; */
    }

    /* 영화이미지 */
    #imgDiv{
        /* border:1px solid yellow; */
        width:40%;
        padding-right: 3%;
        
    }
    /* 예매정보 */
    #movieInfo{
        /* border:1px solid yellow; */
        width:100%;
        /* margin:3%; */
    }
    
    /* 영화제목 */
    #movieInfo>div:nth-child(1){
        font-weight: bolder;
        font-size: 30px;
        border-bottom: 2px solid white;
        margin-right: 3%;
        padding-bottom: 2%;
    }

    /* 예매정보 */
    #movieInfo>div>div{
        font-size: 20px;
        margin-top: 2%;
        margin-bottom: 2%;
        padding-left: 3%;
    }    



   

    /*쿠폰 영역*/
    #cuponArea{

        border-top: 3px solid white;

    }

    /* 결제수단 영역 */
    #payMethodArea{
        width:100%;
        border-top: 3px solid white;
    }

    #payMethods input{
        /* display:none; */
    }
    #payMethods label{
        text-align: center;
        border: 2px solid white;
        border-radius: 2%;
        display: inline-block;
        width:30%;
        height: 40px;
        vertical-align: 40px;
    }

    #payMethods label:hover{
        border: 2px solid gray;
    }
    
    .selectedPayMethod{
    	background-color:gray;
    }
    

    /* 오른쪽영역//////////////////////////////////////////////////// */


    /* 오른쪽 약관동의, 결제금액 영역 */
    #rightDiv{
        width:40%;
        padding:3%;
        
    }
    #rightDiv>div{
        width:100%;
    }

    /* 체크박스 영역 */
    #CheckBoxArea{

        border:1px #d9d9d9 solid;
        border-radius: 5%;
        color:#d9d9d9;
    }
    #CheckBoxArea>div{
        border-bottom: 1px #d9d9d9 solid;
        padding: 6%;
    } 
    #checkBoxArea2{
        display:flex;
    }

 


    /* 총 결제금액 영역 */

    #totalArea{
        padding-top: 30px;      
    }

    #tableDiv{
        border:2px solid white;
        border-radius: 5%;
        text-align: center;
    }

    #totalTable{
        
        width:100%;
        height:400px;
        
    }

    
    #totalTable>tbody>td{
        border-top: 1px solid white;
        padding: 5%;
    }

    #totalButtonArea{
        
        display: flex;
        
    }

    #totalButtonArea>div{
        width:100%;
    }
    #totalButtonArea button{
        width : 100%;
        height : 60px;
        background-color: #ab886d;;
        margin-bottom: 20px;
    }
    
    #submitData{
    	display:none;
    }

    /* 이전 버튼 */
    #backBtn{
        
        
    }
    /* 결제 버튼 */
    #submitBtn{
        
    }
    
    
        




</style>
</head>
<body> 
	<jsp:include page="../common/header.jsp" />	
	
    
    <form name="payForm" method="post" action="/filoom/ResultTest.pm">
        <div id="outer"> <!-- 바깥테두리-->
			





            <!-- 왼쪽 -->
            <div id="leftDiv" >
                <div id="mainTitle">
                    결제하기
                </div>
                <div id="bookInfoArea">
                    <div class="infoTitle">예매정보</div>
                    <div id="bookInfo">
                        <div id="imgDiv">
                            <img src="${requestScope.movie.imagePath }" alt="영화이미지" width="100%" />
                            
                        </div>
                        <div id="movieInfo">
                            <div>
                            	<span>
                            		${requestScope.movie.filmRate}
                            	</span>
                            	-
                            	<span>
                            		${requestScope.movie.movieTitle}
                            	</span>
                            </div>
                            <div>
                                <div id="movieDate"></div>
                                <div id="moviePlayTime">12:00 - 13:57 [더미]</div>
                                <div>${requestScope.movie.screenName }</div>
                                <div>
                                	<c:forEach items="${requestScope.bookingSeatList}" var="bookingSeat">
                                		"${bookingSeat.seatNo}"
                                		
                                	</c:forEach>
                               	</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="cuponArea">
                    <div class="infoTitle">할인쿠폰</div>
                    <div>
                        <div>
                            <!-- 동적으로 생성할 영역 -->
                            <!-- 쿠폰이 있는경우 / 없는경우 -->
                            <input type="radio" name="cupon"id="cupon1"><label for="cupon1">할인쿠폰1[더미]</label>
                            <input type="radio" name="cupon"id="cupon2"><label for="cupon2">할인쿠폰2[더미]</label>
                        </div>
                    </div>
                </div>
                <div id="payMethodArea">
                    <div class="infoTitle">결제수단</div>
                    <div id="payMethods">
                        <div>
                            <input type="radio" name="PayMethod" id="pay1" value="CARD"  hidden required><label for="pay1">카드결제</label>
                            <input type="radio" name="PayMethod" id="pay2" value="BANK" hidden required><label for="pay2">계좌이체</label>
                            <input type="radio" name="PayMethod" id="pay3" value="CELLPHONE" hidden required><label for="pay3">휴대폰결제</label>
                            
                        </div>
                    </div>
                </div>

            </div> 
			<script>
				/* 선택된 결제수단 띄어주기 */
				$("#payMethods input").change(function(){

					let selectedPayMethod = $(this).val();
					
					if(selectedPayMethod==="BANK"){
						selectedPayMethod="계좌이체";
					}else if(selectedPayMethod==="CELLPHONE"){
						selectedPayMethod="휴대폰결제";
					}else{
						selectedPayMethod="신용카드";
					}					
					let payMethodsLabel = $(this).next();
					$("#payMethod").text(selectedPayMethod);
				});
				
				
				/* 선택된 결제수단 스타일  .selectedPayMethod  */
				let labelTags = $("#payMethods label"); //라벨테그들
				
				labelTags.click(function(){ // 라벨테그가 클릭된경우
					
					labelTags.removeClass("selectedPayMethod"); //라벨태그 리무브 삭제
					
					$(this).addClass("selectedPayMethod"); //선택된 라벨에 클래스 추가
					
					console.log($(this));
				});
				
				
				
				
			</script>



            <!-- 오른쪽 -->
            <div id="rightDiv">

                <!-- 약관동의 -->
                <!--  
                <div id="checkArea">
                    <div  class="infoTitle">약관동의</div>
                    <div id="CheckBoxArea">
                        <div>
                            <input type="checkbox"><label for="">결제대행 서비스 약관에 모두 동의</label>
                        </div>
                        <div id="checkBoxArea2">
                            <div>
                                <div><input type="checkbox"><label for="">전자 금융거래 이용 약관</label></div>
                                <div><input type="checkbox"><label for="">개인정보 수집 이용 약관</label></div>
                                <div><input type="checkbox"><label for="">개인정보 제공 및 위탈 안내 약관</label></div>
                            </div>
                            <div>
                                <div>약관보기</div>
                                <div>약관보기</div>
                                <div>약관보기</div>
                            </div>
                        </div>
                    </div>
                </div>
				-->
				
				
                <!-- 총 결제 금액 -->
                <div id="totalArea">
                    <div class="infoTitle" >결제금액</div>
                    <div id="tableDiv">
                        <table id="totalTable">
                            <tbody>
                                <tr>
                                    <td>결제수단</td>
                                    <td id="payMethod"></td>
                                </tr>
                                <tr>
                                    <td>금액</td>
                                    <td  id="totalPriceTd">
                                    	<!-- 총결제금액 15000원 x  -->
                                    	
                                    </td>
                                </tr>
                                <tr>
                                    <td>할인</td>
                                    <td>-15,000원[더미]</td>
                                </tr>
                                <tr>
                                    <td colspan="2" ><h4>최종결제금액</h4></td>
                                </tr>
                                <tr>
                                    <td colspan="2">15,000원[더미]</td>
                                </tr>

                            </tbody>
                        </table>
                        
                        
                        <!-- 결제시 필요한 정보들 담고, 안보이게 -->
				                
						<div id="submitData">			

				             <input type="text" name="GoodsName" value="${requestScope.movie.movieTitle} + " " +${requestScope.booking.bookNo} }>결제 상품명
				             <input type="text" name="Amt" value="15000">결제 상품금액
				             
				             <input type="text" name="MID" value="nictest00m">상점 아이디
				             <input type="text" name="Moid" value="0">상품 주문번호
				             <input type="text" name="BuyerName" value="김형문">구매자명
				             <input type="text" name="BuyerEmail" value="hyeongmoon5429@naver.com">구매자명 이메일
				             <input type="text" name="BuyerTel" value="01097735429">구매자 연락처
				             
				             <!-- <input type="text" name="VbankExpDate" value="">가상계좌입금만료일(YYYYMMDD) -->
				             <!-- 옵션 --> 
							<!-- <input type="hidden" name="GoodsCl" value="0"/> -->						<!-- 상품구분(실물(1),컨텐츠(0)) -->
							<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
							<input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
							<!-- <input type="hidden" name="ReqReserved" value=""/> -->					<!-- 상점 예약필드 -->
										
							<!-- 변경 불가능 -->
							<input type="hidden" name="EdiDate" value="<%-- <%=ediDate%> --%>"/>			<!-- 전문 생성일시 -->
							<input type="hidden" name="SignData" value="<%-- <%=hashString%> --%>"/>	<!-- 해쉬값 -->
							
							
							
				        </div>
				       
                        <div id="totalButtonArea">
                            <div>
                                <button type="button" id="backBtn">이전</button>
                            </div>
                            <div>
                                <button  href="#" type="button" id="submitBtn" onclick="nicepayStart();">결제</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </form>
    
    
    <script>
    	
    	//영화금액
    	const price = 99900;
    	
    	//쿠폰금액 (100%)
    	const couponPrice = price;
    	
    	//선택된 좌석 수
		const seatCounts = "${requestScope.bookingSeatList.size()}"; 
	
		//영화상영시간(문자열)
		const playTime = "${requestScope.movie.playTime}";
	
		//영화상영시간(date타입)
		const playTimeObj = new Date(playTime);
		
   
		//처음 로드될때
    	$(function(){
    		showPlayDate(); 	
    		showPlayTime();		
    		showTotalPrice();	
    		
    	});
    	
		//상영날짜
    	function showPlayDate(){
    		
    		let yyyy = playTimeObj.getFullYear();
    		
            let mm = String(playTimeObj.getMonth()+1).padStart(2,'0');
            let dd = String(playTimeObj.getDate()).padStart(2,'0');
            
            const daysOfWeek = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
            let dayOfWeek = daysOfWeek[playTimeObj.getDay()];
            
            let date =yyyy + "년 " + mm + "월 "+dd+"일 "+ dayOfWeek;
    		
			$("#movieDate").text(date);
    	};
    	
    	
    	//시작시간~종료시간
    	function showPlayTime(){
    		let startTime = playTime.substring(11,16);
    		let [hours, minutes] = startTime.split(":").map(Number);
			
    		minutes += ${requestScope.movie.runtime};
    		
    		hours += Math.floor(minutes/60);
    		
    		minutes %=60;
    		
    		hours %= 24
    		
    		let endTime = String(hours).padStart(2,"0")+":"+String(minutes).padStart(2,"0");
    		
    		let moviePlayTime = startTime + " ~ " + endTime;
    		
    		$("#moviePlayTime").text(moviePlayTime);
				
    		
    	}
    		
    	
        
        
    	//할인전 금액
    	//선택된 좌석수 * 영화가격
    	function showTotalPrice(){
			
    		let totalPrice = price*seatCounts;
    		let inputTag ="<input type='hidden' name='bookTotalCost' value='"+totalPrice+"' readonly>";
     		$("#totalPriceTd").html(totalPrice+inputTag);
    	}
    		
    	
    
    

   
    </script>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>
