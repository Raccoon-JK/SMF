<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/유저피드.css" />
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
              <a href="">로그인</a>
            </li>
          </ul>
        </div>
        <div class="headermain">
          <div class="hm-logo">
            <a href="<%= contextPath %>"><h2>구해줘 패션</h2></a>
          </div>
          <div class="hm-menu"></div>
        </div>
        <div class="headerbottom">
          
        </div>
      </div>
    </header>

    <content>
      <div class="contentwrap">
        <div class="user-area">
            <div class="user-top">
                <div class="profile-imgbox">
                    <img class="profile-img" src="resources/style/p_fa94223fea044656b2f41d55cbcb334c.jpeg">
                </div>
                <div class="profile-infobox">
                  <p class="user-name" style="font-size: 20px; margin-top: 0; margin-bottom: 0;">
                    yxxhzzi
                  </p>
                </div>
                <div class="user-explane">
                  <p class="sub-txt" style="margin-top: 0;">
                    @yxxhzzi
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
          <div class="feedwrap">
            <div class="feedimg1">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
              <img src="./resources/style/캡처55.PNG">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
            </div>
          </div>
          <div class="feedwrap">
            <div class="feedimg2">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡처88.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
            </div>
          </div>
          <div class="feedwrap">
            <div class="feedimg3">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
            </div>
          </div>
          <div class="feedwrap">
            <div class="feedimg4">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
              <img src="./resources/style/a_17002637a4e44a5c958830c00ab3059a.webp">
              <img src="./resources/style/a_171c091de0d142dfb94c421b6bf55b6f.jpg">
              <img src="./resources/style/캡쳐66.PNG">
              <img src="./resources/style/a_1a4352d0cfaf42639677af7d142ed7c0.webp">
              <img src="./resources/style/a_aa9dfdbd41a746dfbc025a06fad36f62.webp">
              <img src="./resources/style/a_89c114d3a071422e9966dca98fa051f8.webp">
            </div>
          </div>
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
      
    </foorter>
  </body>
  </body>
</html>