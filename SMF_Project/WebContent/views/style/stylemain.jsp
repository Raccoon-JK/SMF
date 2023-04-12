<%@ page import="com.smf.common.model.vo.PageInfo, java.util.ArrayList, com.smf.style.model.vo.*, com.smf.member.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<StylePost> list = (ArrayList<StylePost>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>
<link rel="stylesheet" href="resources/style/스타일 메인.css" />
<style>
	.hm-menu{
        display: flex;
        justify-content: flex-end;
        width: 90%;
      }

      .hm-menu span{
        margin-right: 10px;
      }
</style>
</head>
  <body>
    <header>
      <div class="headerwrap">
        <div class="headertop">
          <ul>
            <li>
              <a href="">고객센터</a>
            </li>
            <li>
              <a href="">관심상품</a>
            </li>
            <li>
              <a href="<%= contextPath %>/login.page">로그인</a>
            </li>
          </ul>
        </div>
        <div class="headermain">
          <div class="hm-logo">
            <a href=""><h2>구해줘 패션</h2></a>
          </div>
          <div class="hm-menu">
          	<a href=""><span>HOME</span></a>
            <a href="<%= contextPath %>"><span>STYLE</span></a>
            <a href=""><span>SHOP</span></a>
            <a href="<%= contextPath %>/mypagemain.me"><span>MY</span></a>
          </div>
        </div>
        <div class="headerbottom">
          <a href="<%= contextPath %>/follow.me"><span>팔로잉</span></a>
          <a href="<%= contextPath %>"><span>발견</span></a>
          <a href="<%= contextPath %>/snekers.do"><span>스니커즈</span></a>
          <a href="<%= contextPath %>/luxury.do"><span>럭셔리</span></a>
          <a href="<%= contextPath %>/clothes.do"><span>의류</span></a>
          <a href="<%= contextPath %>/bag.do"><span>가방</span></a>
          <a href="<%= contextPath %>/accessory.do"><span>악세서리</span></a>
        </div>
      </div>
    </header>

    <content>
      <div class="contentwrap">
        <div class="ct-tagcontainer">
          <a
            href="<%= contextPath %>/hashtag.do"
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
          <a href="<%= contextPath %>/styleInsert.me" class="style-insert">#스타일 등록</a>
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
          <div class="feedwrap">
	       	<% for (StylePost sp : list) { %>
            <div class="feedimg1">
            <img src="<%= contextPath %> <%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>">
              <input type="hidden" value="<%= sp.getPostNo() %>">
					<img src="<%=contextPath %><%= sp.getPi().getImgPath()+ sp.getPi().getImgName() %>" width="200px" height="150px">
					<p>
						<%= sp.getUserId() %><br><%= sp.getContent() %>						
					</p>
            </div>
          </div>
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