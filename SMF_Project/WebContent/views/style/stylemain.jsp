<%@ page import="com.smf.member.model.vo.* , com.smf.style.model.vo.* , java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<StylePost> list = (ArrayList<StylePost>) request.getAttribute("list");
	ArrayList<PostLike> list2 = (ArrayList<PostLike>) request.getAttribute("list2");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>

<link rel="stylesheet" href="resources/style/css/Stylemain.css" />
<style>
a {
  text-decoration: none;
  color: rgba(34, 34, 34, 0.5);
}

#feedContent{
	color: gray;
	font-weight: 500;
}
	
</style>
</head>
  <body>
    <header>
    <jsp:include page="/views/main/menubar_style.jsp" />
	</header>
    <content>
      <div class="contentwrap">
        <div class="ct-tagcontainer">
          <a
            href="<%= contextPath %>/hashtag.st"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042020184728058.webp"
                />
                <p class="tagtitle">#오늘뭐입지</p>
              </div>
            </div>
          </a>
          <a
            href="https://kream.co.kr/social/tags/%EC%98%A4%EB%8A%98%EB%AD%90%EC%9E%85%EC%A7%80"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042017520117969.webp"
                />
                <p class="tagtitle">#내일뭐입지</p>
              </div>
            </div>
          </a>
          <a
            href="https://kream.co.kr/social/tags/%EC%98%A4%EB%8A%98%EB%AD%90%EC%9E%85%EC%A7%80"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042017520117969.webp"
                />
                <p class="tagtitle">#집에가고싶다</p>
              </div>
            </div>
          </a>
          <a
            href="https://kream.co.kr/social/tags/%EC%98%A4%EB%8A%98%EB%AD%90%EC%9E%85%EC%A7%80"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042017520117969.webp"
                />
                <p class="tagtitle">#졸리다으아</p>
              </div>
            </div>
          </a>
          <a
            href="https://kream.co.kr/social/tags/%EC%98%A4%EB%8A%98%EB%AD%90%EC%9E%85%EC%A7%80"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042017520117969.webp"
                />
                <p class="tagtitle">#크림</p>
              </div>
            </div>
          </a>
          <a
            href="https://kream.co.kr/social/tags/%EC%98%A4%EB%8A%98%EB%AD%90%EC%9E%85%EC%A7%80"
          >
            <div class="tagshort">
              <div class="round">
                <img
                  src="resources/style/upfiles/2023042017520117969.webp"
                />
                <p class="tagtitle">#지겨워</p>
              </div>
            </div>
          </a>
        </div>
        <div class="ct-sort">
        <% if(loginUser != null){ %>
          <a href="<%= contextPath %>/styleEnroll.st" class="style-insert">#스타일 등록</a>
       	<% } else {%>
       	  <a href="<%= contextPath %>/login.page" class="style-insert">#스타일 등록</a>
       	<% } %>
          <ul>
            <li>
              <a href="#" style="font-weight: bold;">최신순</a>&nbsp&nbsp|&nbsp&nbsp&nbsp
            </li>
            <li>
              <a href="#">인기순</a>
            </li>
          </ul>
        </div>
        <div class="ct-feedcontainer">
	        <% for(StylePost sp : list) { %>
	        <div class="feedwrap">
	        	<input type="hidden" name="postNo" value="<%= sp.getPostNo() %>">
	            <div class="feedimg1">
					<img src="<%= contextPath %><%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>" width="250px" height="170px"/>
					<div>
						 <div class="userImg"><img src="<%= contextPath %><%= sp.getUserImage() %>" style="width:30px; height:30px; margin-right:5px;"><%= sp.getUserId() %>
	            			<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" style="margin-left:20px;">
			                  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			                 </svg>
			                 
			                 <%= sp.getpLike() %>
			                 
						 </div>
						 <div id="feedContent"><%=sp.getContent() %></div><br>
					</div>
				</div>
         	</div>
	         <% } %>
      	</div>
      
      
    </content>
	
    <foorter>
      <div class="moveTopBtn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
          </svg>
      </div>
      
      <script>
		$(function(){
			$(".feedwrap").click(function(){
				location.href = "<%= contextPath %>/DetailPost.st?pno="+$(this).children().eq(0).val();
			})
		});
	  </script>
      
      	

      <script>

          const $topBtn = document.querySelector(".moveTopBtn");

          // 버튼 클릭 시 맨 위로 이동
          $topBtn.onclick = () => {
          window.scrollTo({ top: 0 });  
          }
      </script>
      
    <jsp:include page="/views/main/footer.jsp" />
    </foorter>
      
      
      
    
  </body>

</html>