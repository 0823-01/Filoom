<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록조회</title>
<style>
    body{
        background-color: #313131;
    }
	/*전체를 감싸는 영역*/
	.container {
	    background-color: #313131;
	    box-sizing: border-box;
	    margin : auto;
	    width : 1900px;
	    max-width: 1900px;
	    /*padding : 20px;*/
	}
	
	/*목록조회 메뉴 영역*/
	.menu {
	    display: flex;
	    justify-items: left;
	    gap : 25px;
	    background-color: #E4E0E1;
	    height : 40px;
	    font-size: 25px;
	    font-weight: bold;
	    color : #493628;
	    padding : 10px;
	    border-radius: 4px;
	    margin-bottom: 10px;
	}
	
	#no, #title, #createDate, #count {
	    padding: 3px;
	}
	
	#no {
	    margin-left: 55px;
	}
	
	#title {
	    margin-left: 40px;
	}
	
	#createDate {
	    margin-left: 1180px;
	}
	
	#count {
	    margin-left: 175px;
	}
	
	/*목록 테이블을 감싸는 div*/
	.list-area {
	    border-radius : 4px;
	    overflow: hidden;
	}
	
	/*목록 테이블*/
	.nTable {
	    width : 100%;
	    border-collapse : collapse;
	    overflow: hidden;
	}
	
	#nNo, #nCount {
	    width : 10%;
	}
	
	#nTitle {
	    width : 60%;
	}
	
	#nCreateDate {
	    width : 20%;
	}
	
	/*목록영역*/
	.list {
	    background-color: #F3F3F3;
	    border-bottom : 2px solid #493628;
	    text-align : center;
	    font-weight: bold;
	    height : 60px;
	    font-size: 20px;
	}
	.list:hover {
	    background-color: #E4E0E1;
	    border-bottom : 2px solid #493628;
	    text-align : center;
	    font-weight: bold;
	    height : 60px;
	}
	
	#ntitle {
	    cursor : pointer;
	}
	
	/*페이징영역*/
	.pagingArea {
	    width : fit-content;
	    margin:auto;
	}
	.pagination {
	    list-style-type : none;
	}
	.pagination>li {
	    float : left;
	    font-size : 20px;
	    margin-left: 10px;
	    margin-right: 10px;
	}
	li>a {
	    text-decoration-line: none;
	    color : #F3F3F3;
	}
	
	li>a:hover, li>a:active {
	    color : #AB886D;
	}

</style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />
    <!--전체영역을 감싸는 container-->
    <div class="container">
    
        <h2 style="color : #E4E0E1;">공지사항</h2>
        <h3 style="color : #E4E0E1; ">FILOOM의 주요한 이슈 및 여러가지 소식들을 확인할 수 있습니다.</h3>
        <div style="font-weight: bold; color : #E4E0E1; margin-bottom : 20px;">총<b style="color : #AB886D;">110</b>건</div>

        <!--공지사항 게시글 목록 리스트 영역-->
        <div class="listArea">
            <div class="menu">
                <div id="no">번호</div>
                <div id="title">제목</div>
                <div id="createDate">작성일</div>
                <div id="count">조회수</div>
            </div>

            <!--목록테이블-->
            <div class="list-area">
                <table class="nTable">
                    <tbody>
                        <tr class="list">
                            <td id="nNo">1</td>
                            <td id="nTitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td id="nCreateDate">2024-11-26</td>
                            <td id="nCount">5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                        <tr class="list">
                            <td>1</td>
                            <td id="ntitle" align="left">2025&2026 VIP 멤버십 운영 변경 안내</td>
                            <td>2024-11-26</td>
                            <td>5000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

	    <!--페이징바-->
	    <div class="pagingArea">
	        <ul class="pagination">
	            <li class="page-item disabled"><a class="page-link" href="#">«</a></li>
	            <li class="page-item"><a class="page-link" href="#">1</a></li>
	            <li class="page-item"><a class="page-link" href="#">2</a></li>
	            <li class="page-item"><a class="page-link" href="#">3</a></li>
	            <li class="page-item"><a class="page-link" href="#">4</a></li>
	            <li class="page-item"><a class="page-link" href="#">5</a></li>
	            <li class="page-item"><a class="page-link" href="#">6</a></li>
	            <li class="page-item"><a class="page-link" href="#">7</a></li>
	            <li class="page-item"><a class="page-link" href="#">8</a></li>
	            <li class="page-item"><a class="page-link" href="#">9</a></li>
	            <li class="page-item"><a class="page-link" href="#">10</a></li>
	            <li class="page-item"><a class="page-link" href="#">»</a></li>
	        </ul> 
	    </div>
    
    </div>
   


    <jsp:include page="../common/footer.jsp" />
<title>Insert title here</title>
</head>
<body>

</body>
</html>