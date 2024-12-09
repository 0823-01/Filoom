<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
    /* 겹칠수도 있으니 나중에 지우기 */
    body{
        color: white;
        background-color: black;
    }
    

    #outer{
        margin: auto;
        margin-top: 30px;
        width:80%;
        background-color: #222222;
        display: flex;
        padding-bottom: 3%;
        /* border:1px solid white; */
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
        border: 2px solid red;
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
<body> 
    
    <form action="" method="">
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
                            <img src="파이널_3/조커.jfif" alt="영화이미지" >
                        </div>
                        <div id="movieInfo">
                            <div>19 조커</div>
                            <div>
                                <div>2024.12.04(수)</div>
                                <div>12:00 - 13:57</div>
                                <div>상영관 3관</div>
                                <div>c-3, c-4</div>
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
                            <input type="radio" name="cupon"id="cupon1"><label for="cupon1">할인쿠폰1</label>
                            <input type="radio" name="cupon"id="cupon2"><label for="cupon2">할인쿠폰2</label>
                        </div>
                    </div>
                </div>
                <div id="payMethodArea">
                    <div class="infoTitle">결제수단</div>
                    <div id="payMethods">
                        <div>
                            <input type="radio" name="cosoProcess" id="pay1" ><label for="pay1">카드결제</label>
                            <input type="radio" name="cosoProcess" id="pay2" ><label for="pay2">계좌이체</label>
                            <input type="radio" name="cosoProcess" id="pay3" ><label for="pay3">휴대폰결제</label>
                            <input type="radio" name="cosoProcess" id="pay4" ><label for="pay4">컬쳐캐쉬</label>
                            <input type="radio" name="cosoProcess" id="pay5" ><label for="pay5">SSG계좌이체</label>
                        </div>
                    </div>
                </div>

            </div> 




            <!-- 오른쪽 -->
            <div id="rightDiv">

                <!-- 약관동의 -->
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

                <!-- 총 결제 금액 -->
                <div id="totalArea">
                    <div class="infoTitle" >결제금액</div>
                    <div id="tableDiv">
                        <table id="totalTable">
                            <tbody>
                                <tr>
                                    <td>결제수단</td>
                                    <td>신용카드</td>
                                </tr>
                                <tr>
                                    <td>금액</td>
                                    <td>30,000</td>
                                </tr>
                                <tr>
                                    <td>할인</td>
                                    <td>-15,000원</td>
                                </tr>
                                <tr>
                                    <td colspan="2" ><h4>최종결제금액</h4></td>
                                </tr>
                                <tr>
                                    <td colspan="2">15,000원</td>
                                </tr>

                            </tbody>
                        </table>
                        
                        
                        <!-- 결제시 필요한 정보들 담고, 안보이게 -->
				                
						<div id="submitData">				            
				             <input type="" name="" value="" hidden>
				             <input type="" name="" value="" hidden>
				             <input type="" name="" value="" hidden>
				        </div>
				       
                        <div id="totalButtonArea">
                            <div>
                                <button type="button" id="backBtn">이전</button>
                            </div>
                            <div>
                                <button  type="submit" id="submitBtn" >결제</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </form>

</body>
</html>
