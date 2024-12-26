<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
   
    
   
	<style>
	
		body{
		    width: 100%;
		    height: 100%;
		    background-color: #151515;
		    overflow: hidden;
		    box-sizing: border-box;
		}
		
		#admin_content{
		
		    width: 1850px;
		    height: 900px;
		    margin: auto;
		    margin-top: 30px;
		    background-color: #313131;
		    border-radius: 5px;
		    box-shadow: 4px 4px#151515 ;
		
		}
		
		
		
		    
		#admin_right{
		
		    width: 80%;
		    height: 100%;
		    /*background-color: rgb(100, 76, 47);*/
		    float: left;
		
		}
		
		#admin_title{
		    width: 100%;
		    height: 15%;
		    /*background-color: #4b8492;*/
		    position: relative;
		}
		
		#admin_title_content{
		    position: absolute;
		    left: 50%;
		    right:  50%; 
		    transform: translate(-50%, 40%);
		    width: 98%;
		    height: 60%;
		    background-color: #E4E0E1;
		    border-radius: 5px;
		}
		
		#admin_detail{/*  */
		    width: 100%;
		    height: 85%;
		    /*background-color: aquamarine;*/
		    position: relative;
		}
		
		#admin_page{
		    position: absolute;
		    left: 50%;
		    right:  50%; 
		    transform: translate(-50%, 0%);
		    width: 98%;
		    height: 95%;
		    background-color: #E4E0E1;
		    border-radius: 5px;
		}
		
		
		/*여기 샘플코드*/
		#text_sample{
		    width: 100px;
		    height: 30px;
		    border: none;
		    border-radius: 5px;
		    box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
		    outline: none;
		}
		
		#button_sample {
		    width: 100px;
		    height: 40px;
		    border: none;
		    border-radius: 5px;
		    color: #D2CECF;
		    font-size: 20px;
		    font-weight: bolder;
		    box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
		    background-color: #493628;
		    cursor: pointer;
		}
		
		#button_sample:hover {
		    transform: scale(1.1em);
		}
		
		#button_sample:active {
		    background-color: #AB886D;
		}
		
		
		/*----------------- admin 기본 -------------------*/
		

		/* 페이징 영역 */
		.foot {
        	box-sizing : border-box;
        	display: flex;
        	justify-content: center;
        	align-items : center;
        	flex-direction: column;
        	position: relative;
        
        }
        
		.pagingArea {
		    display: flex;
		    justify-content: center;
		    padding : 20px;
		    font-size: 20px;
		    font-weight: bold;
		
		}
		.pagination {
		    list-style-type : none;
		    display: flex;
		    padding : 0;
		    margin: 0;
		    font-size: 20px;
		    font-weight: bold;
		}
		.pagination>li {
		    margin : 0 10px; /*리스트 항목 간의 간격*/
		    cursor: pointer;
		    transition: color 0.3s ease; /*색상 전환 효과*/
		    font-size: 25px;
		    font-weight: bold;
		    color : #F3F3F3;
		}
		
		.pagination>li>a {
		    margin : 0 10px; /*리스트 항목 간의 간격*/
		    cursor: pointer;
		    transition: color 0.3s ease; /*색상 전환 효과*/
		    font-size: 25px;
		    font-weight: bold;
		    color : #493628;
		    text-decoration : none;
		}
		
		.pagination>li>a:hover {
		    text-decoration-line: none;
		    color : #AB886D;
		}

		.pagination > li>a.active {
			color:gray;
		   
		}
		
		.pagination .active .page-link {
	
		    color: #AB886D;
	
		}
		
		.pagination .page-link {
		    color: #493628; 
		    text-decoration: none;
		}
		
		.pagination .disabled .page-link {
		    color: #ccc;
		    pointer-events: none;
		    cursor: default;
		}
		
				
			
	</style>

</head>
<body>
	
	


    <div id = "admin_content">
        
        <jsp:include page="../../common/adminHeader.jsp" />	
        
        <div id = "admin_right">
            <div id ="admin_title">
                <div id = "admin_title_content">

					<div>예약 관리</div>
					<div>
						
					</div> 

                </div>

            </div>

            <div id = "admin_detail">
                
                <!-- 여기 안이 관리자 컨텐츠 영역이에요~-->
                <div id ="admin_page">
      				
      				<form action="adminBooking.ad" method="get">
	      				<table class="">
							<tr>
								<td>정렬</td>
								<td>
									<select name="sorting">
										<option value="desc">최신순</option>
											<option value="asc"
												<c:if test="${requestScope.sorting=='asc'}">
												 selected		
												</c:if>
																>오래된순</option>
									</select>
								</td>
								<td></td>
							</tr>
							
							<tr>
								<td>예매번호</td>
								<td><input type ="text" id ="text_sample"name="bookNo" value="${requestScope.bookNo}"></td>
								<td>예매번호를 입력하세요</td>
							</tr>
							<tr>
								<td>사용자아이디</td>
								<td><input type ="text" id ="text_sample" name="userId" value="${requestScope.userId}"></td>
								<td>사용자 아이디를 입력하세요.</td>
							</tr>
							<tr>
								<td><input type="submit" id ="button_sample" value="검색"></td>
								<td></td>
								<td></td>
							</tr>
						
						</table>
					</form>
					<br>
					
					
					<table class="table table-hover">
						<thead>
							<tr>
								<th>예약번호</th>
								<th>회원번호</th>
								<th>회원아이디</th>
								<th>회원이름</th>
								<th>결제방식</th>
								<th>총금액</th>
								<th>결제금액</th>
								<th>예매날짜</th>
								<th>상영시간</th>
								<th>취소날짜</th>
								<th>결제취소</th>
								<th>결제상태</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="booking" items="${requestScope.bookingList}">
								<tr>
									<td>${booking.bookNo}</td>
									<td>${booking.userNo}</td>
									<td>${booking.userId }</td>
									<td>${booking.userName}</td>
									<td>${booking.costProcess}</td>
									<td>${booking.bookTotalCost}</td>
									<td>${booking.bookCost}</td>
									<td>${booking.bookDate}</td>
									<td>${booking.playTime}</td>
									<td>${booking.modifyDate}</td>
									<td><button onclick="cancelRequest(${booking.bookNo},${booking.userNo})">결제취소</button></td>
									<td>${booking.status}</td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
					
					
      				
                    <div class="foot" style="box-sizing: border-box;">
                         <!-- 페이징바 -->
					    <div class="pagingArea">
					        <ul class="pagination" id="pagination">
					            <!-- 이전 페이지 버튼 -->
					             
					            <c:choose>
					                <c:when test="${requestScope.pi.currentPage < requestScope.pi.pageLimit}"> 
					                    <li class="page-item disabled">
					                        <a class="page-link" href="adminBooking.ad${requestScope.url}${requestScope.pi.startPage-1}">«</a>
					                    </li>
					                    
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item">
					                        <a class="page-link" href="adminBooking.ad${requestScope.url}${requestScope.pi.currentPage-1}">«</a>
					                        					 
					                    </li>
					                </c:otherwise>
					            </c:choose>
								
					            <!-- 페이지 번호 출력 -->
				           	   <c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}" >
					            	<!-- <li }" >-->
					                <li>
					                    <a class="page-item ${requestScope.pi.currentPage == p ?'active' : '' }" href="adminBooking.ad${requestScope.url}${p}">${p}</a>
					                </li>
					            </c:forEach>
					
					            <!-- 다음 페이지 버튼 -->
					           
					            <c:choose>
					                <c:when test="${requestScope.pi.currentPage < requestScope.pi.maxPage && requestScope.pi.endPage < requestScope.pi.maxPage }">
					                    <li class="page-item">
					                        <a class="page-link" href="adminBooking.ad${requestScope.url}${requestScope.pi.endPage+1}">»</a>
					                    </li>
					                    
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item disabled">
					                        <a class="page-link" href="#">»</a>
					                    </li>
					                    
					                </c:otherwise>
					            </c:choose>
					           
					        </ul>
					    </div>
			
		    		</div>      				
      				
      				
      				
                    
                    <!--  
                    <input type ="text" id ="text_sample">
                    <input type="button" id ="button_sample" value="샘플">
               		-->
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


        function cancelRequest(bookNo,userNo){
    		
    		let cancelConfirm = confirm("예메를 취소 하시겠습니까 ? ");
    		if(cancelConfirm){
    			$.ajax({
    				url:"cancelRequest.pm",
    				type:"post",
    				data:{bookNo:bookNo,
    					  userNo:userNo},
    				success:function(result){
    					console.log("결제취소요청성공-ajax")
    					console.log(result);
    					if(result==="success"){
    						alert("결제가 취소되었습니다. ");
    						location.reload();
    						
    					}else{
    						alert("죄송합니다. 상영시간 이후 취소/환불은 불가합니다.)")
    						
    					}
    					
    				},
    				error:function(){
    					console.log("결제취소요청실패-ajax")
    				}
    			});
    		}
    	}
        
        
   
    </script>
    
</body>
</html>