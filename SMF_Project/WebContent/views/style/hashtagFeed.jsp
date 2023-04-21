<%@ page import="com.smf.member.model.vo.* , com.smf.style.model.vo.* , java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<StylePost> list = (ArrayList<StylePost>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>구해줘 패션</title>
    <link rel="stylesheet" href="resources/style/css/hashtag.css" />
  </head>
  <body>
    <header>
    <jsp:include page="/views/main/menubar_style.jsp" />
    <div><h2 style="text-align: center;">#오늘뭐입지</h2></div>
	</header>

    <content>
    <div class="contentwrap">
       <div class="ct-feedcontainer">
	        <% for(StylePost sp : list) { %>
	        <% if(sp.getContent().contains("#오늘뭐입지") ) { %>
	        <div class="feedwrap">
	        	<a href="<%= contextPath %>/follow.st">
	            <div class="feedimg1">
					<img src="<%= contextPath %><%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>" width="250px" height="170px"/>
					<div>
						 <div class="userImg"><img src="<%= contextPath %><%= sp.getUserImage() %>" style="width:30px; height:30px;"></div>
						 <%=sp.getUserId() %><br>
						 <%=sp.getContent() %><br>
					</div>
				</div>
				</a>
         	</div>
         	 <% } %>
	         <% } %>
      	</div>
     </div>
    </content>

    <foorter>
      <div class="moveTopBtn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
          </svg>
      </div>

      <script>

          const $topBtn = document.querySelector(".moveTopBtn");

          // 버튼 클릭 시 맨 위로 이동
          $topBtn.onclick = () => {
          window.scrollTo({ top: 0 });  
          }
      </script>
      
    </foorter>
  </body>
</html>
