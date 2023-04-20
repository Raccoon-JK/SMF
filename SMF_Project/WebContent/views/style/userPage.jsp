<%@ page import="com.smf.style.model.vo.*, com.smf.member.model.vo.*, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<StylePost> list = (ArrayList<StylePost>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>
<link rel="stylesheet" href="resources/style/css/userPage.css" />
</head>
  <body>
     <header><jsp:include page="/views/main/menubar_style.jsp" /></header>
    <content>
      <div class="contentwrap">
        <div class="user-area">
            <div class="user-top">
                <div class="profile-imgbox">
                    <img class="profile-img" src="<%= contextPath + loginUser.getUserImg() %>">
                </div>
                <div class="profile-infobox">
                  <p class="user-name" style="font-size: 20px; margin-top: 0; margin-bottom: 0;">
                  <%= loginUser.getUserId() %>
                  </p>
                </div>
                <div class="user-explane">
                  <p class="sub-txt" style="margin-top: 0;">
                  <% if (loginUser.getInteroduce() != null)  { %>
                  <%= loginUser.getInteroduce() %>
                  <% } %>
                  </p>
                </div>
            </div>
        </div>
        
       <div class="ct-feedcontainer">
       <% for(StylePost sp : list) { %>
      	<% if(loginUser != null && loginUser.getUserId().equals( sp.getUserId() )) { %>
          <div class="feedwrap">
          <input type="hidden" name="postNo" value="<%= sp.getPostNo() %>">
            <div class="feedimg1">
              <img src="<%= contextPath %><%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>" width="250px" height="170px"/>
				<div>
					 <div class="userImg"><img src="<%= contextPath %><%= sp.getUserImage() %>" style="width:30px; height:30px;"><%=sp.getUserId() %>
					 <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" style="margin-left:30px;">
			                  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			                 </svg>
			                 
			            <%= sp.getpLike() %>
					 </div>
					 <%=sp.getContent() %>
				</div>
            </div>
          </div>
       	<% } %>
       	<% } %>
      </div>
     </div>

    
      
       <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
      
		<script>
		$(function(){
			$(".feedwrap").click(function(){
				location.href = "<%= contextPath%>/DetailPost.st?pno="+$(this).children().eq(0).val();
			})
		});
	  </script>
      
      
      <script>
        const open = document.getElementById("open");
        const close = document.getElementById("close");
  
        const modal = document.querySelector(".modal-wrapper");
  
        open.onclick = () => {
          modal.style.display = "flex";
        };
  
        close.onclick = () => {
          modal.style.display = "none";
        };
      </script>
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
            <%-- <jsp:include page="/views/common/footer.jsp" /> --%>
      
    </foorter>
  </body>
  </body>
</html>