<%@ page import="com.smf.style.model.vo.*, com.smf.member.model.vo.*, java.io.File,  java.util.ArrayList, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<PostImg> list = (ArrayList<PostImg>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>
<link rel="stylesheet" href="resources/style/css/PostInsert.css" />
<style>

	#enroll-form{
		font-family: "paybooc-Light", sans-serif;
	}
	
	#enroll-form img{
		 border: 1px solid rgba(0, 0, 0, 0.2);
		 box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	}
	
	#enroll-form textarea{
		margin-left : 100px;
		margin-bottom: 20px;
		width: 600px; 
		height: 300px; 
		resize:none; 
		border: 1px solid rgba(0, 0, 0, 0.2);
	}
	
      .img-area img{
          width: 150px;
          height: 200px;
      }

      .img-area {
        margin-top: 20px;
        margin-bottom: 20px;
         width: 250;
    	height: 170;
      }
      
	      .w-btn {
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	}
	
	.w-btn-outline {
	    position: relative;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	}
	
	
	
	.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}
	
	.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}
      
    </style>
  </head>
  <body>
    <header>
    <jsp:include page="/views/main/menubar_style.jsp" />
	</header>

    <content>
        <div class="noticewrap1">
        <div class="outer">
		<br> <h4 ><strong>당신의 STYLE 을 공유해보세요 !</strong></h4> <br>
		
		<form action="<%= contextPath %>/styleInsert.st" id="enroll-form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
			<div>
				<textarea name="content" required placeholder="#아이템과 #스타일을 입력하세요"></textarea>
				<p><strong>스타일 이미지 등록하기</strong></p>
			 	<img id="titleImg" width="200" height="150">
				<img id="contentImg1" width="200" height="150">
				<img id="contentImg2" width="200" height="150">
				<img id="contentImg3" width="200" height="150">
			</div>
			<br>
			
			
			<div id="file-area" style="display:none;">
				<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);" required>
				<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);"> 
				<input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
				<input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
			</div>
			
			
			<script>
				$(function(){
					
					$("#titleImg").click(function(){
						$("#img1").click();
					});
					
					$("[id^=contentImg]").each(function(index, item){
						$(item).click(function(){
							$("#img"+(index+2)).click();
						})
					});
				})
				
				function loadImg(inputFile, num){
					
					
					if(inputFile.files.length != 0){
						
						let reader = new FileReader();
						
						
						reader.readAsDataURL(inputFile.files[0]);
						
						reader.onload = function(e){ 
							let url = e.target.result;
							switch(num){
							case 1 : $("#titleImg").attr("src",url);break;
							case 2 : $("#contentImg1").attr("src",url);break;
							case 3 : $("#contentImg2").attr("src",url);break;
							case 4 : $("#contentImg3").attr("src",url);break;
							}	
						}
					} else{
						switch(num){
							case 1 : $("#titleImg").removeAttr("src"); break;
							case 2 : $("#contentImg1").removeAttr("src"); break;
							case 3 : $("#contentImg2").removeAttr("src"); break;
							case 4 : $("#contentImg3").removeAttr("src"); break;
						}	
					}
				}
			</script>
			<br>
			<div align="center">
			
				<button class="w-btn w-btn-gray-outline" type="submit">스타일 등록</button>
				<button class="w-btn w-btn-gray-outline submit-btn" type="button" onclick="history.back();">취소</button>
			</div>
			
		</form>
		
	</div>
    
    </content>

        <script>

          function openModal(id) {
            document.getElementById(id).style.display = "flex";
          }
          
          // 모달창 닫기
          function closeModal(id) {
            document.getElementById(id).style.display = "none";
          }

          // 모달창 외부 클릭 이벤트 처리
          window.onclick = function(event) {
            if (event.target.classList.contains("modal")) {
              closeModal(event.target.id);
            }
          }
        </script>


        <br><br><br><br><br><br>
    
    <foorter>
    
    </foorter>
  </body>
</html>