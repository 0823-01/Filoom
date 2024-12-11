<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 이벤트 글작성</title>
<!--link rel="stylesheet" href="../main/admin.css" /> -->
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


#navbar{
    width: 20%;
    height: 100%;
    /*background-color: #4b8492;*/
    float: left;
    
}


#logo{
    position: relative;
    width: 100%;
    height: 15%;
    /*background-color: aliceblue;*/
}

#logo>img{
    position: absolute;
    left: 50%;
    right:  50%; 
    transform: translate(-50%, 80%);
    width: 60%;
    height: auto;
}

#nav {
    margin: auto;
    width: 90%;
    height: 80%;
    background-color: #151515;
    border-radius: 10px;
    cursor: pointer;
}

#nav > ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
    height: 80%;
    text-align: center;
}

#nav > ul > li {
    margin: auto;
    gap: 2px;
    width: 90%;
    height: 20%;
    /*background-color: aliceblue;*/
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.3s; 
}

#nav > ul > li:hover {
    background-color: #d6c0b3; 
}

#nav > ul > li.selected {
    background-color: #ab886d; 
}

#nav > ul > li > a {
    color: #313131;
    font-size: 30px;
    font-weight: bold;
    text-decoration: none;
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

#admin_detail{
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

/*내거 영역*/
    #admin_title_content {
        display: flex;
        justify-content: space-between;
        align-items: center;

    }

    #boardTitle {
        font-size: 30px;
        font-weight: bold;
        color : #493628;
        padding : 20px; 
    }

    #sub {
        font-size: 20px;
        font-weight: bold;
        color : #493628;
        padding : 25px; 
        margin-top: 5px;
    }

    .title_date_count {
        border-bottom : 4px solid #493628;
        padding: 10px;
        display: flex;
        justify-content: left;
        gap : 32px;
        /*border : 1px solid blue;*/
    }

    .contentArea {
        border-bottom : 4px solid #493628;
        margin-left: 0px;
        padding: 10px;
        display : flex;
        align-items: left;
        gap : 3px;
    }

    .content {
        padding: 10px;
    }

    .title, .startDate, .endDate, .content, #thumbnail {
        font-size: 24px;
        font-weight: bold;
        color : #493628;
        padding-left : 5px;
        display: flex;
        justify-content: left;
        gap : 10px;
        margin-left: 5px;
    }

    #title, #startDate, #endDate, #content {
        height: 40px;
        border: none;
        border-radius: 5px;
        box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
        outline: none;
        margin-bottom : 10px;
        background-color: white;
    }

    #content {
        width : 1300px;
        height : 320px;
        resize: none;
        
    }

    #title {
        width : 450px;
    }

    #startDate {
        width : 200px;
    }

    #endDate {
        width : 200px;
    }

    /*사진첨부영역*/
    .fileArea {
        border-bottom : 4px solid #493628;
        margin-left: 0px;
        padding: 10px;
        display : flex;
        align-items: left;
        gap : 15px;
    }

    #file {
        padding: 10px 0 10px 10px;
    }
    
    
    #contentImg1, #contentImg2, #contentImg3, #contentImg4 {
            height: 170px;
            width : 170px;
            border: none;
            border-radius: 5px;
            box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
            outline: none;
            margin-bottom : 5px;
            background-color: white;
            
     }
	
	/*
    .thumbnailArea>input {
        height: 170px;
        width : 170px;
        border: none;
        border-radius: 5px;
        box-shadow: 3px 3px 3px rgb(0, 0, 0, 0.2);
        outline: none;
        margin-bottom : 5px;
        background-color: white;
    } */

    /*이벤트 종류, 종료여부, 버튼*/
    .type-status-btn {
        display: flex;
        justify-content: right;
        gap : 25px;
        padding : 10px;
    }

    /*이벤트 종류*/
    .type, .status {
        display: flex;
        justify-content: right;
        gap : 25px;
        font-size: 20px;
        font-weight: bold;
        color: #493628;
        padding : 10px;
    }

    #type-method, #eventStatus {
        font-size: 17px;
        padding : 3px;
    }

    #type-method>input, #eventStatus>input {
        width: 12px;
        height : 12px;
    }

    /*버튼*/
    .btn {
        text-align: right;
        box-sizing: border-box;
        padding : 5px;

    }

    button {
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

    button:hover {
        transform: scale(1.1em);
    }

    button:active {
        background-color: #AB886D;
    }

</style>

</head>
<body>
    <div id = "admin_content">
        <div id = "navbar">
            
            <div id = "logo">
                <!-- img src="..admin/main/Filoom.png">-->
            </div>
           
            <div id = "nav">
                <ul>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                    <li><a>회원 관리</a></li>
                </ul>
    
            </div>
        </div>
        <div id = "admin_right">
            <div id ="admin_title">

                <!-- 혜원 - 관리자 이벤트 상세조회 -->
                <div id = "admin_title_content">
                    <div id="boardTitle">이벤트 글 작성</div>
                    <div id="sub">체크(<b style="color : red;">*</b>)된 항목은 필수 입력사항입니다.</div>
                </div>
            </div>

            <div id = "admin_detail">
                
                <!-- 혜원 목록테이블-->
                <div id ="admin_page">
                    <!--이건 버튼 이랑 text 샘플
                    <input type ="text" id ="text_sample">
                    <input type="button" id ="button_sample" value="샘플">-->
                    
                    
                    <form id="enrollForm" action="insert.ev" method="post" enctype="multipart/form-data">
                        <!--제목, 작성일, 조회수-->
                        <div class="title_date_count">
                            <div class="title">
                                <label for="title">제목<b style="color : red;">*</b></label><input type="text" id="title" name="eventTitle" requried></input>
                            </div>

                            <div class="startDate">
                                <label for="startDate">이벤트 시작일<b style="color : red;">*</b></label> <input type="date" id="startDate" name="startDate"></input>
                            </div>

                            <div class="endDate">
                                <label for="endDate">이벤트 종료일<b style="color : red;">*</b></label><input type="date" id="endDate" name="endDate"></input>
                            </div>
                        </div>

                        <!-- 내용 -->
                        <div class="contentArea">
                            <label for="content" class="content">내용<b style="color : red;">*</b></label>
                            <textarea id="content" name="eventContent"></textarea>
                        </div>

                        <!-- 사진첨부 -->
                        <div class="fileArea">
                            <label for="fileInput" id="file">사진<br>첨부<b style="color : red;">*</b></label>
                            
                            <img id="contentImg1" src="" alt="Preview Image 1" data-target="file1" />
                            <img id="contentImg2" src="" alt="Preview Image 2" data-target="file2" />
                            <img id="contentImg3" src="" alt="Preview Image 3" data-target="file3"/>
                            <img id="contentImg4" src="" alt="Preview Image 4" data-target="file4"/>
                            
                            <!-- 파일 입력받는 요소  -->
                            <div id="file-area" style="display : none;">
	                            <!-- 썸네일은 필수입력사항으로 지정 -->
	                            <input type="file" id="file1" name="upfiles" onchange="loadImg(this, 1);" multiple>
	                            
	                            <!-- 기본이미지 -->
	                            <input type="file" id="file2" name="upfiles" onchange="loadImg(this, 2);" multiple>
	                            <input type="file" id="file3" name="upfiles" onchange="loadImg(this, 3);" multiple>
	                            <input type="file" id="file4" name="upfiles" onchange="loadImg(this, 4);" multiple>
                            </div>
                            
                            <!-- 이미지 클릭 시 파일 탐색기 열리기 -->
                            <script>
	                            document.addEventListener("DOMContentLoaded", function() {
	                                const container = document.querySelector(".fileArea");
	
	                                // 이미지 클릭 시 해당 파일 선택을 위한 이벤트 리스너
	                                container.addEventListener("click", function(e) {
	                                    const targetImg = e.target.closest("img[data-target]");
	                                    if (targetImg) {
	                                        const fileInputId = targetImg.getAttribute("data-target");
	                                        const fileInput = document.getElementById(fileInputId);
	                                        if (fileInput) fileInput.click();
	                                    }
	                                });
	
	                                // 이미지 파일 선택 후 미리보기 업데이트
	                                function handleFileChange(input, index) {
	                                    const previewImg = document.getElementById(`contentImg${index}`);
	                                    const file = input.files[0];
	
	                                    if (file) {
	                                        const reader = new FileReader();
	                                        reader.onload = function(e) {
	                                            previewImg.src = e.target.result; // 파일 읽기 후 미리보기 이미지에 설정
	                                        };
	                                        reader.readAsDataURL(file);
	                                    }
	                                }
	
	                                // 각 input의 onchange 이벤트에 handleFileChange 함수 연결
	                                const fileInputs = document.querySelectorAll('input[name="upfiles"]');
	                                fileInputs.forEach((input, index) => {
	                                    input.addEventListener("change", () => handleFileChange(input, index + 1));
	                                });
	
	                                // 미리보기 이미지 클릭 시 파일 선택을 연결할 때, 각 이미지에 data-target을 설정
	                                const previewImgs = document.querySelectorAll('img[id^="contentImg"]');
	                                previewImgs.forEach((img, index) => {
	                                    img.setAttribute("data-target", `file${index + 1}`);
	                                });
	                            });
                        	</script>
                            
                            <div class="comment" style="padding : 10px;">
                                <button class="btn" id="fileButton" style="width : 140px; text-align: center;">파일첨부</button>
                                <input type="file" id="fileInput" style="display:none;">
                                <div style="color : #493628; font-size: 16px; font-weight : bold; margin-top: 10px;">
                                    * JPEG, PNG 형식의 5M 이하의 파일만 첨부 가능합니다.(최대 4개)<br><br>
                                    * 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다. 
                                </div>
                            </div>
                        </div>
                        
                        <!-- 파일첨부 버튼 스크립트 -->
                        <script>
	                        document.addEventListener("DOMContentLoaded", function () {
	                            const fileButton = document.getElementById("fileButton");
	                            const fileInput = document.getElementById("fileInput");
	
	                            // 버튼 클릭 시 숨겨진 파일 입력 필드 클릭
	                            fileButton.addEventListener("click", function () {
	                                fileInput.click();
	                            });
	
	                            // 파일 선택 시 파일 이름 로그 확인 (옵션)
	                            fileInput.addEventListener("change", function () {
	                                if (fileInput.files.length > 0) {
	                                    console.log("선택된 파일:", fileInput.files[0].name);
	                                }
	                            });
	                        });
                        </script>


                        <!--이벤트 종류 / 종료 여부 / 버튼-->
                        <div class="type-status-btn">
                            <div class="type">
                                <div style="margin-top: 2px;">이벤트 참여 방법<b style="color : red;">*</b></div>
                                <div id="type-method">
                                    댓글<input type="radio" name="eventType" value="1">
                                    응모버튼<input type="radio" name="eventType" value="2">
                                    오프라인<input type="radio" name="eventType" value="3">
                                </div>
                            </div>

                            <div class="status">
                                <div style="margin-top: 2px;">이벤트 종료 여부<b style="color : red;">*</b></div>
                                <div id="eventStatus">
                                    진행중인 이벤트<input type="radio" name="eventStatus" value="Y">
                                    종료된 이벤트<input type="radio" name="eventStatus" value="N">
                                </div>
                            </div>
                        
                            <!--등록, 취소 버튼-->
                            <div class="btn">
                                <button id="cancle" style="width : 100px; margin-right : 5px;" onclick="history.back()">취소</button>
                                <button type="submit" id="submit" style="width : 130px;">등록</button>
                            </div>
                        </div>

                    </form>

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