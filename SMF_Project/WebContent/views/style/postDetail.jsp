<%@ page import="com.smf.member.model.vo.* , com.smf.style.model.vo.* , java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	StylePost sp = (StylePost) request.getAttribute("sp");
	ArrayList<StyleComment> list = (ArrayList<StyleComment>) request.getAttribute("list");
	ArrayList<ArrayList<PostImg>> list2 = (ArrayList<ArrayList<PostImg>>) request.getAttribute("list2");
	ArrayList<StylePost> m = (ArrayList<StylePost>)request.getAttribute("m");
	int i = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘 패션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/style/css/팔로잉.css" />
<style>
	

</style>
</head>
   <body>
	<header>
	<%-- <jsp:include page="/views/main/menubar_style.jsp" /> --%>
	</header>
    <content>
    
       
      
      <div class="feedcontainer">
        <div class="feedwrap">
          <div class="feeduser">
            <a href="">
            <input type="hidden" name="postNo" value="<%= sp.getPostNo() %>" >
              <div class="userimg">
                <img src="<%= contextPath %><%= m.get(0).getUserImage()%>" >
              </div>
              <div class="userinfo">
                <p class="userid"><%= sp.getContent()%></p>
                <p class="uproadtime"><%=sp.getUproadTime() %></p>
              </div>
            </a>
            <div class="userfollow">
            	<% if( loginUser.getUserId().equals(sp.getUserId())) { %>
            	
            	<% } else { %>
            	<form action="<%= contextPath %>/folllowInsert.st" method="POST">
            		<input type="hidden" name="follower" value="<%= sp.getUserId() %>"><button type="submit" id="follow-btn">팔로우</button>
            	</form>
            	<% } %>
            </div>
          </div>
          <div class="swiper mySwiper">
            <div class="swiper-wrapper">
            <% for(int j = 0; j<list2.get(i).size(); j++) { %>
              <div class="swiper-slide"><img src="<%= contextPath %><%= list2.get(i).get(j).getImgPath()+ list2.get(i).get(j).getImgName()  %>"></div>

           <% } %>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
          </div>
        </div>
          
        <div class="feedproduct">
          <div class="product-title">
            <span class="title-txt"></span>
          </div>
          <div class="product-list">
            <ul class="itemwrap">
              <li class="item">
                <a href="">
                  <div class="product" background-color: rgb(241, 241, 234);>
                    <img
                      src=""
                    />
                  </div>
                  <div class="product-info">
                    <p class="product-name">
                    </p>
                    <div class="price-box">
                      <span class="amount"></span>
                      <span class="unit"></span>
                    </div>
                  </div>
                </a>
              </li>
              <li class="item">
                <a href="">
                  <div class="product" background-color: rgb(241, 241, 234);>
                    <img
                      src=""
                    />
                  </div>
                  <div class="product-info">
                    <p class="product-name">
                    </p>
                    <div class="price-box">
                      <span class="amount"></span>
                      <span class="unit"></span>
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
              <a href="" >
            	<form action="<%= contextPath %>/postLike.st" method="POST">
	           		<input type="hidden" name="postNo" value="<%= sp.getPostNo() %>">
	           		<button type="submit" class="btn-like" style="border:0; background-color:white; cursor:pointer;">
	           			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
	                 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
	               		</svg>
	           		</button>
           		</form>
              </a>
              <a id="open1"  onclick="openModal('modal-wrapper1')">
              	<input type="hidden" name="postNo" value="<%= sp.getPostNo() %>">
	           	<button type="submit" class="btn-comment" style="border:0; background-color:white; cursor:pointer;">
	                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="29" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
	                  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
	                </svg>
                </button>
              </a>
            </div>
            <a id="open2" onclick="openModal('modal-wrapper2')" class="btn-share">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-bar-up" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 10a.5.5 0 0 0 .5-.5V3.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 3.707V9.5a.5.5 0 0 0 .5.5zm-7 2.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13a.5.5 0 0 1-.5-.5z"/>
              </svg>  
            </a>
          </div>
        </div>
        <div class="fc-count">
          <a href="" class="like-count">좋아요 <%= m.get(0).getpLike() %> 개</a>
        </div>
        <div class="fc-tag">
          <span class="tag-link" style="width:150px;">
             <%= sp.getUserId() %>
          </span>
        </div>
        <div class="fc-comment">
          <div class="comment-area">
            <button type="submit" id ="open1" name="postNo" value="<%= sp.getPostNo() %>" class="comment-count btn-white" onclick="openModal('modal-wrapper1')">  <strong>댓글&nbsp;보기</strong></button>
          </div>
          <div class="comment-list">
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
                  <a href="">
                    <div class="userimg">
                      <img src="<%= contextPath %><%= m.get(0).getUserImage() %>" />
                    </div>
                    <div class="userinfo">
                      <p class="userid"><%= sp.getContent() %></p>
                      <p class="user-comment"><%= sp.getUserId() %></p>
                      <p class="uproadtime"><%= sp.getUproadTime() %></p>
                    </div>
                  </a>
                </div>
              </div>
              <div id="comments">
                  <div id="reply-area">
					<table border="1">
						<thead>
								<tr>
									<th>댓글작성</th>
									<td>
										<textarea class="form-control" id="replyContent" cols="20"  rows="3" style="resize:none;" placeholder="댓글을 남기세요"></textarea>
									</td>
									<td><button onclick="insertReply();">등록</button></td>
								</tr>
						</thead>
						<tbody>
							
							<% for(StyleComment sc : list) { %>
								<tr>
									<td><%= sc.getUserId() %></td>
									<td><%= sc.getcContent() %></td>
									<td><%= sc.getcUproadTime() %></td>
								</tr>
							<% } %>
						</tbody>
					</table>
				</div>
              </div>
              
              
            </div>
    
          </div>
        </div>
        <div style="display:none;"><%= i++ %></div>
        
        
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script>
        $(function(){
        	const inner = $('#45').val()
        	console.log(inner)
        	
        })
        </script>
 
        <script>
			$(function(){
				setInterval(selectCommentList, 500);
			});
			function insertReply(){
				$.ajax({
					url : "<%= contextPath%>/insertComment.st",
					data :{
						cContent : $("#replyContent").val() , 
						postNo    : "<%= sp.getPostNo() %>"
					}, 
					success : function(result){
						//댓글등록성공시  result = 1
						
						// 댓글등록 실패시 result = 0
						if(result > 0){
							//새 댓글목록 불러오는 함수호출
							selectCommentList();
							// 댓글내용 비워주기
							$("#replyContent").val("");
						}else{
							alert("댓글작성에 실패했습니다.");	
						}
						
					}, error : function(){
						console.log("댓글작성실패")
					}
				})
			}
			
			function selectCommentList(){
				$.ajax({
					url : "<%= contextPath %>/commentList.st",
					data : {postNo : "<%= sp.getPostNo() %>"},
					success : function(list){
						
						// 서버로부터 전달받은 리스트를 반복문을통해 댓글목록으로 변환
						let result  = "";
						for(let i of list){ 
							result += "<tr>"
										+"<td>"+ i.cContent +"</td>"
										+"<td>"+ i.userId +"</td>"
										+"<td>"+ i.cUproadTime +"</td>"
								   +  "</tr>"
						}
						
						$("#reply-area tbody").html(result);
					},
					error : function(){
						console.log("게시글 목록조회 실패")
					}
				});
			}
		</script>
		
		

		
        
       
        
        
      </div>
      
      <!-- <div id="modal-wrapper2" style="display: none">
        <div class="modal">
          <div class="modal-title">
            <ul class="action-list">
              <li class="action-item">공유
              	<div class="close-wrapper2">
	              <button class="close" style="background-color: white; border: 0; cursor: pointer;" onclick="closeModal('modal-wrapper2')">
	                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
	                  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
	                </svg>
	              </button>
            </div>
              </li>
              <li class="action-item"></li>
            </ul>
          </div>
          
        </div>
      </div> -->
      
    </content>

        
 
    <foorter>

      <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
      
      <script>
	   // 피드 이미지 슬라이드
	
		  var swiper = new Swiper(".mySwiper", {
	      slidesPerView: 1,
	      spaceBetween: 30,
	      loop: true,
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true,
	      },
	      navigation: {
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev",
	      },
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