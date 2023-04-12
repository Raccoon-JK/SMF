<%@ page import="com.smf.common.model.vo.PageInfo, java.util.ArrayList, com.smf.style.model.vo.*, com.smf.member.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	StylePost sp = (StylePost) request.getAttribute("sp");
	StyleComment sc = (StyleComment) request.getAttribute("sc");
	ArrayList<PostImg> list = (ArrayList<PostImg>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/style/팔로잉.css" />
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
            <div class="hm-logo"></div>
            <div class="hm-menu"></div>
          </div>
          <div class="headerbottom">
            <a href="<%= contextPath %>/follow.me"><span>팔로잉</span></a>
            <a href="<%= contextPath %>" class="underline"><span>발견</span></a>
            <a href="<%= contextPath %>/snekers.do" class="underline"><span>스니커즈</span></a>
            <a href="<%= contextPath %>/luxury.do"><span>럭셔리</span></a>
          	<a href="<%= contextPath %>/clothes.do"><span>의류</span></a>
          	<a href="<%= contextPath %>/bag.do"><span>가방</span></a>
          	<a href="<%= contextPath %>/accessory.do"><span>악세서리</span></a>
          </div>
      </div>
    </header>

    <content>
    
      <div class="feedcontainer">
        <div class="feedwrap">
          <div class="feeduser">
            <a href="<%= contextPath %>/userPage.me">
              <div class="userimg">
                <img src="resources/style/p_fa94223fea044656b2f41d55cbcb334c.jpeg" />
              </div>
              <div class="userinfo">
                <p class="userid" value="<%= loginUser.getUserId() %>"></p>
                <p class="uproadtime"><%= sp.getUproadTime() %></p>
              </div>
            </a>
            <div class="userfollow"><button type="button"  id="follow-btn">팔로잉</button></div>
          </div>
          <div class="swiper mySwiper">
          <% for (PostImg pi : list) { %>
            <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="<%= pi.getImgPath() + pi.getImgName() %>"></div>
              
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
          </div>
          <% } %>
        </div>
        <div class="feedproduct">
          <div class="product-title">
            <span class="title-txt"
              >상품&nbsp;태그<strong class="num">2</strong>개</span
            >
          </div>
          <div class="product-list">
            <ul class="itemwrap">
              <li class="item">
                <a href="">
                  <div class="product" background-color: rgb(241, 241, 234);>
                    <img
                      src="resources/style/a_7350c375e3a1458f96e16223e2310cc3.webp"
                    />
                  </div>
                  <div class="product-info">
                    <p class="product-name">
                      (W) Adidas Sambarose White Black Gum
                    </p>
                    <div class="price-box">
                      <span class="amount">120,000</span>
                      <span class="unit">원</span>
                    </div>
                  </div>
                </a>
              </li>
              <li class="item">
                <a href="">
                  <div class="product" background-color: rgb(241, 241, 234);>
                    <img
                      src="resources/style/a_b2f594eb104a44c9b3b6f2286771f221.webp"
                    />
                  </div>
                  <div class="product-info">
                    <p class="product-name">
                      Gucci Interlocking G Pendant Necklace Silver
                    </p>
                    <div class="price-box">
                      <span class="amount">361,000</span>
                      <span class="unit">원</span>
                    </div>
                    
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="feedcontent">
          <div class="fc-btn">
            <div class="btn-bind">
              <a href="" class="btn-like">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                </svg>
              </a>
              <a id="open1" onclick="openModal('modal-wrapper1')">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                </svg>
              </a>
            </div>
            <a href="" class="btn-share">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-bar-up" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 10a.5.5 0 0 0 .5-.5V3.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 3.707V9.5a.5.5 0 0 0 .5.5zm-7 2.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z"/>
              </svg>  
            </a>
          </div>
        </div>
        <div class="fc-count">
          <a href="" class="like-count">공감&nbsp;<strong>68</strong>개</a>
        </div>
        <div class="fc-tag">
          <span class="tag-link">
            <span class="txt">
             <a class="hashtag" href="https://kream.co.kr/social/tags/오늘뭐입지">#오늘뭐입지</a>
             <a class="hashtag" href="https://kream.co.kr/social/tags/KREAM스타일">#KREAM스타일</a>
             <a class="hashtag" href="https://kream.co.kr/social/tags/아디다스">#아디다스</a>
            </span>
          </span>
        </div>
        <div class="fc-comment">
          <div class="comment-area">
            <a id ="open1" class="comment-count" onclick="openModal('modal-wrapper1')"> 댓글 <strong>2</strong>개 </a>
          </div>
          <div class="comment-list">
            <div class="comment-box">
              <a href="" class="profile-link">
                <img src="resources/style/account_img_default.png">
              </a>
              <div class="comment-detail">
                <div class="main">
                  <span class="user-name"><%= sp.getUserId() %></span>
                  <span class="comment-txt"><%= sc.getcContent() %></span>
                </div>
                <div class="sub">
                  <span class="upload-time"><%= sc.getcUproadTime() %></span>
                </div>
              </div>
              <div class="btn-like">
                <img src="resources/style/좋아요.PNG">
              </div>
            </div>
          </div>
        </div>
        
        
        <div id="modal-wrapper1" style="display: none">
          <div class="modal">
            <div class="close-wrapper1">
              <button class="close" style="background-color: white; border: 0; cursor: pointer;" onclick="closeModal('modal-wrapper1')">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
                  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                </svg>
              </button>
            </div>
            <div class="modal-title">댓글</div>
            <div class="comment-box">
              <div class="comment-top">
                <div class="feeduser">
                  <a href="http://127.0.0.1:3000/%EC%9C%A0%EC%A0%80%ED%94%BC%EB%93%9C.html">
                    <div class="userimg">
                      <img src="resources/style/p_fa94223fea044656b2f41d55cbcb334c.jpeg" />
                    </div>
                    <div class="userinfo">
                      <p class="userid"><%= sp.getUserId() %></p>
                      <p class="user-comment"><%= sc.getcContent() %></p>
                      <p class="uproadtime"><%= sc.getcUproadTime() %></p>
                    </div>
                  </a>
                </div>
              </div>
              <div id="comments">
                <form id="commentForm" action="">
                  <div class="modal-profile">
                    <img src="resources/style/account_img_default.png">
                  </div>
                  <input type="text" id="commentInput" style="width: 250px;" placeholder="댓글을 남기세요">
                  <button type="submit">작성</button>
                </form>
                <ul id="commentList">
                  <!-- 작성한 댓글들이 표시될 영역 -->
                </ul>
              </div>
            </div>
    
          </div>
        </div>
      </div>
    </content>

        
 
    <foorter>
      <div class="moveTopBtn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
          </svg>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
      <script>
      const $topBtn = document.querySelector(".moveTopBtn");
      

	   // 버튼 클릭 시 맨 위로 이동
	   $topBtn.onclick = () => {
	   window.scrollTo({ top: 0 });  
	   }
	
	   // 피드 이미지 슬라이드
	
	   var swiper = new Swiper(".mySwiper", {
	       cssMode: true,
	       navigation: {
	         nextEl: ".swiper-button-next",
	         prevEl: ".swiper-button-prev",
	       },
	       pagination: {
	         el: ".swiper-pagination",
	       },
	       mousewheel: true,
	       keyboard: true,
	     });
	
	   // 팔로우 버튼 클릭시 변경
	
	   const fb = document.querySelectorAll('#follow-btn');
	
	   fb.forEach(button => {
	       button.addEventListener('click', () => {
	       if (button.style.backgroundColor === 'black') {
	           // 배경색을 원래대로 되돌리는 코드 작성
	           button.style.backgroundColor = 'white';
	           button.style.color = 'black';
	       } else {
	           // 배경색을 변경하는 코드 작성
	           button.style.backgroundColor = 'black';
	           button.style.color = 'white';
	       }
	       });
	   });
	
	   // 댓글 입력 기능
	
	   const commentForm = document.querySelector('#commentForm');
	   const commentInput = document.querySelector('#commentInput');
	   const commentList = document.querySelector('#commentList');
	
	   commentForm.addEventListener('submit', (event) => {
	       event.preventDefault(); // 폼의 기본 동작을 막음
	       
	       const comment = commentInput.value.trim(); // 입력한 댓글 내용을 가져옴
	       if (!comment) return; // 댓글 내용이 없으면 함수를 종료함
	       
	       const commentItem = document.createElement('li'); // 새로운 댓글 아이템 생성
	       commentItem.innerText = comment;
	       commentList.appendChild(commentItem); // 새로운 댓글 아이템을 목록에 추가
	       
	       commentInput.value = ''; // 댓글 입력창을 초기화
	   });
	
	   // 모달 컨트롤
	
	     // 모달창 열기
	     function openModal(id) {
	       document.getElementById(id).style.display = "flex";
	       document.body.style.overflow ="hidden"; // 모달창 열릴때 스크롤 작동 못하게
	     }
	     
	     // 모달창 닫기
	     function closeModal(id) {
	       document.getElementById(id).style.display = "none";
	       document.body.style.overflow ="scroll"; // 모달창 닫힐때 스크롤 정상 작동
	       
	     }
	
	     // 모달창 외부 클릭 이벤트 처리
	     window.onclick = function(event) {
	       if (event.target.classList.contains("modal")) {
	         closeModal(event.target.id);
	       }
	     }
      
      </script>
      
    </foorter>
  </body>
</html>