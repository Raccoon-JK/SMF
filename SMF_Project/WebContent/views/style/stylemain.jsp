<%@ page import="com.smf.member.model.vo.* , com.smf.style.model.vo.* , java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<StylePost> list = (ArrayList<StylePost>) request.getAttribute("list");
	Member m = (Member) session.getAttribute("m");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>
<link rel="stylesheet" href="resources/style/스타일 메인.css" />
<style>
	a {
	  text-decoration: none;
	  color: black;
	}
	
	.ct-feedcontainer {
	  justify-content: center;
	  margin-top: 30px;
	  padding-bottom: 50px;
	  width: 100%;
	  border-bottom: 1px solid #f0f0f0;
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
                  src="resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg"
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
                  src="resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp"
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
                  src="resources/style/a_89c114d3a071422e9966dca98fa051f8.webp"
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
                  src="resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp"
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
                  src="resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg"
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
                  src="resources/style/a_17002637a4e44a5c958830c00ab3059a.webp"
                />
                <p class="tagtitle">#지겨워</p>
              </div>
            </div>
          </a>
        </div>
        <div class="ct-sort">
        <% if(loginUser != null){ %>
          <a href="<%= contextPath %>/styleEnroll.st" class="style-insert" style="">#스타일 등록</a>
       	<% } else {%>
       	  <a href="<%= contextPath %>/login.page" class="style-insert">#스타일 등록</a>
       	<% } %>
          <ul>
            <li>
              <a href="#" style="font-weight: bold;">날짜별</a>
            </li>
            <li>
              <a href="#">인기순</a>
            </li>
            <li>
              <a href="#">최신순</a>
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
						<form action="<%= contextPath %>/styleList.st" method="POST">
							 <div class="userImg"><img src="<%= contextPath %><%= sp.getUserImage() %>" style="width:30px; height:30px; margin-right:5px;"><%= sp.getUserId() %>
		            			<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" style="margin-left:60px;">
				                  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
				                 </svg>
							 </div>
		            	</form>
						 <%=sp.getContent() %><br>
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
				location.href = "<%= contextPath%>/follow.st?pno="+$(this).children().eq(0).val();
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
      
      <jsp:include page="/views/common/footer.jsp" />
      
    </foorter>
  </body>

</html>