<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
        
#header {
   
   margin: auto;
   z-index: 1000;
   width: 1900px;
   height: 200px;
   opacity: 90%;
   /*background-color: aqua;*/
}

#header>hr{
   height: 3px; 
   width: 1900px;
   background-color: #E4E0E1; 
   border: none;
   border-radius: 5px;
}

#header_top {
   width: 100%;
   height: 40%;
   display: flex; 
   align-items: center;
   justify-content: space-between; 
   padding: 0 20px;
}


.logo {

   margin-right: 80px;
   margin-top: 60px;
   vertical-align : bottom;
   font-size: 50px; 
   font-weight: bold; 
   color: #E4E0E1; 
   text-decoration: none; 
   font-family: 'Arial', sans-serif;

}


#header_top ul {
  
   list-style: none;
   display: flex;
   margin: 0;
   padding: 0;
  
}

#header_top ul li {
   
   margin-top: 60px;
   margin-right: 50px;
   width: auto;
   font-size: 25px;
   color: #E4E0E1;
   cursor: pointer;
   transition: color 0.3s ease;
   font-weight: bolder;
  
}

#header_top ul li a {
	color: #E4E0E1;
	text-decoration: none;
	transition: color 0.3s ease;
}


#header_top ul li:hover, #header_top ul li a:hover {
   color: #493628; 
}


/* 아래는 하단 네비바 */

#header_bottom {
   margin: auto;
   width: 95%;
   height: 70px;
   display: flex; 
   align-items: center; 
   justify-content: center;
   border-radius: 10px;
}

#header_bottom ul {
   list-style: none; 
   display: flex;
   margin: 0;
   padding: 0;
   cursor: pointer;
}

#header_bottom li {
   margin: 0 60px; 
   text-decoration: none; 
   color: #8B8B8B; 
   font-size: 40px; 
   font-weight: bold; 
   transition: color 0.3s ease, transform 0.3s ease;
   
}


#header_bottom li:hover {
   color: #493628; 
   transform: scale(1.1); 
}



    </style>

<style>
        
	#header {
	   
	   margin: auto;
	   z-index: 1000;
	   width: 1900px;
	   height: 200px;
	   opacity: 90%;
	   /*background-color: aqua;*/
	}
	
	#header>hr{
	   height: 3px; 
	   width: 1900px;
	   background-color: #E4E0E1; 
	   border: none;
	   border-radius: 5px;
	}
	
	#header_top {
	   width: 100%;
	   height: 40%;
	   display: flex; 
	   align-items: center;
	   justify-content: space-between; 
	   padding: 0 20px;
	}
	
	
	#header_top a {
	
	   margin-right: 80px;
	   margin-top: 60px;
	   vertical-align : bottom;
	   font-size: 50px; 
	   font-weight: bold; 
	   color: #E4E0E1; 
	   text-decoration: none; 
	   font-family: 'Arial', sans-serif;
	
	}
	
	
	#header_top ul {
	  
	   list-style: none;
	   display: flex;
	   margin: 0;
	   padding: 0;
	  
	}
	
	#header_top ul li {
	   
	   margin-top: 60px;
	   margin-right: 50px;
	   width: auto;
	   font-size: 25px;
	   color: #E4E0E1;
	   cursor: pointer;
	   transition: color 0.3s ease;
	   font-weight: bolder;
	  
	}
	
	
	#header_top ul li:hover {
	   color: #493628; 
	}
	
	
	/* 아래는 하단 네비바 */
	
	#header_bottom {
	   margin: auto;
	   width: 95%;
	   height: 70px;
	   display: flex; 
	   align-items: center; 
	   justify-content: center;
	   border-radius: 10px;
	}
	
	#header_bottom ul {
	   list-style: none; 
	   display: flex;
	   margin: 0;
	   padding: 0;
	   cursor: pointer;
	}
	
	#header_bottom li {
	   margin: 0 60px; 
	   text-decoration: none; 
	   color: #8B8B8B; 
	   font-size: 40px; 
	   font-weight: bold; 
	   transition: color 0.3s ease, transform 0.3s ease;
	   
	}
	
	
	#header_bottom li:hover {
	   color: #493628; 
	   transform: scale(1.1); 
	}
	
	

</style>   
</head>
<body>
	<div id = "header">
        <div id = "header_top">

            <ul>
   
               <li>공지사항</li> &nbsp;&nbsp;&nbsp;&nbsp;
               <li>문의</li>

         	</ul>



            <a class="logo">Filoom</a>


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
         </ul>



            <a>Filoom</a>

            <ul>
 
                <li>로그인</li> &nbsp;&nbsp;&nbsp;&nbsp;
                <li>회원가입</li>

            </ul>

        </div>
        <hr >
        <div id = "header_bottom">
            <ul>
                <li>영화</li>
                <li>예매</li>
                <li>이벤트</li>

            </ul>
        </div>
        <hr>
    </div>
</body>
</html>