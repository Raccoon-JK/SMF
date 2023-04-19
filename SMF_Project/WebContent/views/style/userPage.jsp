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
<link rel="stylesheet" href="resources/style/유저피드.css" />
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
                  </p>
                </div>
                <div class="user-btn">
                  <button type="button"  class="follow-btn">팔로잉</button>
                  <span>
                    <button type="button" id="open">
                      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                      </svg>
                    </button>
                  </span>
                </div>
                <div class="social-area">
                  <ul class="social-list">
                    <li class="social-item">
                      <a href="" class="item-link">
                        <span class="item-menu">게시물</span>
                        <span class="item-count">141</span>
                      </a>
                    </li>
                    <li class="social-item">
                      <a href="" class="item-link">
                        <span class="item-menu">팔로워</span>
                        <span class="item-count">6088</span>
                      </a>
                    </li>
                    <li class="social-item">
                      <a href="" class="item-link">
                        <span class="item-menu">팔로잉</span>
                        <span class="item-count">58</span>
                      </a>
                    </li>
                  </ul>

                </div>
            </div>
        </div>
        
       <div class="ct-feedcontainer">
       <% for(StylePost sp : list) { %>
      	<% if(loginUser != null && loginUser.getUserId().equals( sp.getUserId() )) { %>
          <div class="feedwrap">
            <div class="feedimg1">
              <img src="<%= contextPath %><%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>" width="250px" height="170px"/>
				<div>
					 <div class="userImg"><img src="<%= contextPath %><%= sp.getUserImage() %>" style="width:30px; height:30px;"></div>
					 <%=sp.getUserId() %><br>
					 <%=sp.getContent() %><br>
				</div>
            </div>
          </div>
       	<% } %>
       	<% } %>
      </div>
     </div>

      <div class="modal-wrapper" style="display: none">
        <div class="modal">
          <div class="modal-title">
            <ul class="action-list">
              <li class="action-item">프로필 차단</li>
              <li class="action-item">프로필 신고</li>
              <li id="close">취소</li>
            </ul>
          </div>
          
        </div>
      </div>

      
      
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
            <jsp:include page="/views/common/footer.jsp" />
      
    </foorter>
  </body>
  </body>
</html>