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
    #mainTitle>span{
    	font-size:10px;
    	color:gray;
    }
    
    
    /* 타이틀 글씨 크기, 상하패딩 */
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
    #couponArea{
        border-top: 3px solid white;
    }
    
    #couponArea > :first-child{
    	display:inline-block;
    }
    /* 
    	동적으로쿠폰리스트가 생성될 요소

		<div id="couponList">"
			<div>
				<input type='checkBox' name='couponNos' id='coupon"+index+"'value='"+item.couponNo+"' >"
				<label for='coupon"+index+"'>"+item.couponName+"</label><br> "
				<span>"+dateTimeToDate(item.couponExpDate)+"까지</span>"
			</div>
		</div>";
   	*/
   	
   	#couponList>div{
   		display:inline-block;
   	}
   	
   	#couponList>div{
   		border:1px solid white;
   		margin:3%;
   		width:25%;
   		height:60px;
   		text-align : center;
   	}
   	
   	/*  */
    #couponList input{
   		display:none; 
   	} 
   	
   	/* 인풋태그와 연결되 label */
   	#couponList label{
   		display:block;
   		width:100%;
   		height:100%;
   		
   		
   	}
   	
   	/* 쿠폰 사용기한 span  */
   	#couponList span{
   		color:white;
   		font-size:10px;
   	}
   	
   	
   	/* 선택된 쿠폰 div영역 */
    .selectedCoupon{
    	background-color: gray;
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
    

    /* 이전 버튼 */
    #backBtn{
        
        
    }
    /* 결제 버튼 */
    #submitBtn{
        
    }
    
    
        
	/* 결제시 필요한 인풋태그들 */

	#couponList input{
		/* display:none; */
	}
	
	
	#payMethods input{
		/* display:none; */
	}	


    #submitData{
    	/* display:none; */

    }


</style>
</head>
<body> 
	<jsp:include page="../common/header.jsp" />	
	
    
    <form id="payForm" name="payForm" method="post" action="/filoom/payResult.pm">
        <div id="outer"> <!-- 바깥테두리-->
			





            <!-- 왼쪽 -->
            <div id="leftDiv" >
                <div id="mainTitle">
                    결제하기 
                    <span>제한시간</span>
                    <span id="payiTmeLimit">30</span>
                </div>
                <div id="bookInfoArea">
                    <div class="infoTitle">예매정보</div>
                    <div id="bookInfo">
                        <div id="imgDiv">
                            <img src="${requestScope.movie.imagePath}/${requestScope.movie.fileCodename}" alt="영화이미지" width="100%" />
                            
                        </div>
                        <div id="movieInfo">
                            <div>
                            	<span>
                            		<img src="resources/images/posters/${requestScope.movie.filmRate}.svg" height="25px">
                            		
                            	</span>
                            	
                            	<span>
                            		${requestScope.movie.movieTitle}
                            	</span>
                            </div>
                            <div>

                                <div id="movieDate"></div>
                                <div id="moviePlayTime"></div>

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
                <div id="couponArea">
                    <div class="infoTitle">할인쿠폰</div>
                    <button type="button" onclick="selectCoupon()">조회</button>
                    
                    <div>
                        <div id="couponList"></div>

                    </div>
                </div>
                <div id="payMethodArea">
                    <div class="infoTitle">결제수단</div>
                    <div id="payMethods">
                        <div>

                            <input type="radio" name="payMethod" id="pay1" value="CARD" required><label for="pay1">카드결제</label>
                            <input type="radio" name="payMethod" id="pay2" value="BANK" ><label for="pay2">계좌이체</label>
                            <input type="radio" name="payMethod" id="pay3" value="CELLPHONE"><label for="pay3">휴대폰결제</label>

                            
                        </div>
                    </div>
                </div>

            </div> 
			



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
                                    <td colspan="2" id="payMethod">선택</td>
                                </tr>
                                <tr>
                                    <td>금액</td>
                                    <td  id="totalPriceTd"></td>
                                    <td>원</td>
                                </tr>
                                <tr>
                                    <td>할인</td>
                                    <td id="couponPrice">0</td>
                                    <td>원</td>
                                </tr>
                                <tr>
                                    <td colspan="3" ><h4>최종결제금액</h4></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" id="finalPrice">0</td>
                                    <td>원</td>
                                </tr>

                            </tbody>
                        </table>
                        
                       
							
							
							
				        </div>
				       
                        <div id="totalButtonArea">
                            <div>
                                <button type="button" id="backBtn">이전</button>
                            </div>
                            <div>
                            	<button type="button" onclick="beforePay();">결제전 ajax 실행</button>
                                <button id="noPayBtn" type="submit" onclick=";">0원결제</button>
                                <button  href="#" type="button" id="submitBtn" onclick="nicepayStart();">나이스페이결제</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
        
         
                        <!-- 결제시 필요한 정보들 담고, 안보이게 -->
				                
						<div id="submitData">			
							


				             <input type="text" name="GoodsName" value="${requestScope.movie.movieTitle}">결제 상품명(o)
				             <br>
				             <input type="text" name= "totalCost" value=""> 토탈 코스트(o)
				             <br>
				             <input type="text" name="Amt" value="">결제 상품금액(o)
				             <br>
				             
				             <br>
				             <input type="text" name="MID" value="nictest00m">상점 아이디(o)
				             <br>
				             <input type="text" name="Moid" value="${requestScope.booking.bookNo }">상품 주문번호 (o)
				             <br>
				             <input type="text" name="BuyerName" value="${sessionScope.loginUser.userName }">구매자명 (o)
				             <br>
				             <input type="text" name="BuyerEmail" value=${sessionScope.loginUser.email }>구매자명 이메일 (o)
				             <br>
				             <!-- <input type="text" name="BuyerTel" value="">구매자 연락처 -->
				             
										
							<!-- 변경 불가능 -->
							<br>
				            <input type="hidden" name="EdiDate" value="<%-- <%=ediDate%> --%>"/>전문 생성일시 (o)
							<br>
				            <input type="hidden" name="SignData" value="<%-- <%=hashString%> --%>"/>해쉬값(o) 


							
							
							
							
							
							
							<!--  필요없을것같은것들 -->
				             <!-- <input type="text" name="VbankExpDate" value="">가상계좌입금만료일(YYYYMMDD) -->
				             <!-- 옵션 --> 
							<!-- <input type="hidden" name="GoodsCl" value="0"/> -->						<!-- 상품구분(실물(1),컨텐츠(0)) -->
							<input type="hidden" name="TransType" value="0"/>					<!-- 일반(0)/에스크로(1) --> 
							<br>
				            <input type="hidden" name="CharSet" value="utf-8"/>					<!-- 응답 파라미터 인코딩 방식 -->
							<!-- <input type="hidden" name="ReqReserved" value=""/> -->					<!-- 상점 예약필드 -->
    </form>
    
    
    <script>
    	
    
    </script>
    
    
    <script>
   		
    	//영화금액
    	const price = 15000;

    	//쿠폰금액 (100%)
    	const couponPrice = price;
    	
    	//선택된 좌석 수
		const seatCount = "${requestScope.bookingSeatList.size()}"; 
	
		//영화상영시간(문자열)
		const playTime = "${requestScope.movie.playTime}";
		
		//러닝타임
		const runTime = "${requestScope.movie.runtime}";
 
		let timeLimit = "${requestScope.bookingSeatList[0].timeLimit}"
		
		let Amt = ""; //결제할 금액
		
		
		//전체 로드 다 된후 실행
    	$(function(){
			
			setInterval(countDown,1000);
    		showMovieDate(playTime); 	
    		showPlayTime(playTime,runTime);		
    		showTotalPrice(); 					//총금액	
    		showCost();							//최종결재금액
    		
    		
    	});
		
		//카운트다운
		let i = 0;
		function countDown(){
			
			/*  <span id="payiTmeLimit">30</span> */
			let nowTime = new Date;
			
			let hours = nowTime.getHours();
			let minutes = nowTime.getMinutes();
			let seconds = nowTime.getSeconds();

			//console.log("nowTime);
			//console.log(timeLimit);
			
			 i++;
			$("#payiTmeLimit").text(i);
		}
		
    	
		// 영화상영날짜 뿌려주기 
		function showMovieDate(playTime){
			
			let date = dateTimeToDate(playTime);
		
			$("#movieDate").text(date);
		}
		
		
		//날짜시간(문자열) -> 년,월,일, 요일 
    	function dateTimeToDate(dateString){
    		
    		let playTimeObj = new Date(dateString);
    		let yyyy = playTimeObj.getFullYear();
    		
            let mm = String(playTimeObj.getMonth()+1).padStart(2,'0');
            let dd = String(playTimeObj.getDate()).padStart(2,'0');
            
            const daysOfWeek = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
            let dayOfWeek = daysOfWeek[playTimeObj.getDay()];
            
            let date =yyyy + "년 " + mm + "월 "+dd+"일 "+ dayOfWeek;
    		
            return date;
			
    	};
    	
    	
    	//날짜시간+러닝타임 -> 시작시간~종료시간
    	function showPlayTime(playTime, runTime){
    		
    		let startTime = playTime.substring(11,16);
    		
    		let [hours, minutes] = startTime.split(":").map(Number);

    		minutes += +runTime; //숫자로써 계산 문자열앞에+			
		
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
			
    		let totalPrice = price*seatCount;
     		$("#totalPriceTd").text(totalPrice);
     		$("#finalPrice").text(totalPrice);
     		$("#submitData>input[name=totalCost]").val(totalPrice);
    	}
    		
    	
    	/* 결제수단 */
    
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

		/* 
			선택된 결제수단 스타일 주기  .selectedPayMethod 
			클릭할때마다, 전체 클래스 제거, 클릭된 요소에만 클래스속성추가
			
		*/
		let labelTags = $("#payMethods label"); 
		
		labelTags.click(function(){ 
			
			labelTags.removeClass("selectedPayMethod"); 
			
			$(this).addClass("selectedPayMethod"); 

		});

    		
    	
		
		/* 쿠폰 */
		
    	//조회 클릭시 : 쿠폰리스트
    	function selectCoupon(){
    		
    		
    		
    		$.ajax({
    			url:"couponList.co",
    			type:"post",
    			data:{
    				userNo:${sessionScope.loginUser.userNo} /* 세션의 userNo로 수정 */
    			},
    			success:function(result) {
					
    				let couponList ="";
    				if(result.length===0){ //객체배열의 값이 없는값.. 비었는지로 조건걸기
    					couponList += "<span>사용 가능한 쿠폰이 없습니다</span> ";				
    				}else{	    				
	    				result.forEach((item,index) => {
	    					couponList += "<div>"
    									+ 	"<input type='checkBox' name='couponNos' id='coupon"+index+"'value='"+item.couponNo+"' >"
    									+ 	"<label for='coupon"+index+"'>"+item.couponName+"<br> "
    									+ 		"<span>"+dateTimeToDate(item.couponExpDate)+"까지</span>"
    									+ 	"</label>"
    									+ "</div>";
	    				});
	    				
    				}
    				$("#couponList").html(couponList);

    			},
    			error:function(){
    				console.log("ajax 통신 실패");
    			},
    			
    		})

    	}


		// 좌석수 만큼만 쿠폰수 사용 가능하게
		/* 
			쿠폰리스트가 체크/해제 할때마다 체크된 갯수 구하기
			
		*/
		$("#couponList").on('change','input',function(){

			let checkedCount = $("#couponList input:checked").length; 
			
			if(seatCount<checkedCount){
				$(this).prop('checked',false);
				alert("선택한 좌석수만큼 쿠폰 사용이 가능합니다.");
				return;
			}
			
			if($(this).prop('checked')){
				$(this).parent().addClass("selectedCoupon");
				
			}else{
				$(this).parent().removeClass("selectedCoupon");
			}
			
			let totalCouponPrice = couponPrice*checkedCount;
			
			$("#couponPrice").text(totalCouponPrice);
			
		});
		

 		// 최종 결제 금액 구하기 
		$("#couponList").on('change','input',showCost);
		
		function showCost(){
			//console.log("체인지이벤트발생");
			
			let totalPrice = $("#totalPriceTd").text();
			let totalCouponPrice = $("#couponList input:checked").length*couponPrice;
			
			//console.log(totalPrice);
			//console.log(totalCouponPrice);
			
			let finalPrice = totalPrice - totalCouponPrice;
			$("#finalPrice").text(finalPrice)
			$("#submitData>input[name=Amt]").val(finalPrice);
			
			Amt = finalPrice;
			//console.log("최종 결제금액 = " +Amt );
			
		}  
		//$("#submitData>input[name=totalCost]").val(totalPrice);
		
		
		
		//nicepaystart  전
		function beforePay(){
			//쿠폰
			
			let couponNos=getCouponNos();
			
			//console.log(couponNos);
			//console.log(Amt);
			
			
			$.ajax({
				url:"beforePay.pm",
				type:"post",
				contentType:"application/json",
				data: JSON.stringify({ couponNos: couponNos,
										price:Amt }),
				success:function(payInfo){
					let bookNo=payInfo.bookNo; //
					let merchantKey=payInfo.merchantKey; 
					let merchantId=payInfo.merchantId; //
					let ediDate = payInfo.ediDate;//
					let hashString = payInfo.hashString;
					
					$("#submitData>input[name=Moid]").val(bookNo);
					$("#submitData>input[name=MID]").val(merchantId);
					$("#submitData>input[name=EdiDate]").val(ediDate);
					$("#submitData>input[name=SignData]").val(hashString);
				
					$()
					
					
					
					if(Amt===0){ //결제할 금액이 0원인경우
						 /* <form name="payForm" method="post" action="/payResult.pm"> */
						
						$("#payForm").submit();
						

						
					}else{
					
						nicepayStart();
					}
				},
				error:function(){
					console.log("ajax통신실패:결제전")
				}
				
				
				
			})
		}
		

		//선택된 쿠폰 넘버 배열로 가져오기
		function getCouponNos(){
			let checkedCoupons = $("#couponList input:checked");
			
			let couponNos = [];
			checkedCoupons.each(function(){
				
				couponNos.push($(this).val());
				
			});

			return couponNos;
		}
		
    </script>



	<jsp:include page="../common/footer.jsp" />
</body>
</html>
