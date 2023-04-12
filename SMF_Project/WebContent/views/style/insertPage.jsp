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
<title>Insert title here</title>
<link rel="stylesheet" href="resources/style/게시물등록.css" />
<style>
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
                <a href="">로그인</a>
              </li>
            </ul>
          </div>
          <div class="headermain">
            <div class="hm-logo"></div>
            <div class="hm-menu"></div>
          </div>
      </div>
    </header>

    <content>

        <div class="noticewrap1">
          <div class="insertnotice">
            <div class="insert-btnwrap">
              <a href="http://127.0.0.1:3000/%EC%8A%A4%ED%83%80%EC%9D%BC%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.html">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close-btn" viewBox="0 0 16 16">
                  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                </svg>
              </a>
              <div class="insert-btn">
                <button type="submit" class="submit-btn">등록</button>
              </div>
            </div>
            <div class="insert-header">
              <h2>당신의 STYLE 을 공유해보세요 !</h2>
            </div>
                
            <table>
              <tr>
                <div class="uproadfilewrap">
                    <label><input type="file" onchange="setDetailImage(event);" multiple="multiple">이미지 등록</label>
                      
                </div>
              </tr>
              <div class="img-area"></div>
              

              <div class="notice-content">
                  <textarea style="width: 500px; height: 300px;" placeholder="#아이템과 #스타일을 공유해보세요!"></textarea>
              </div>
              
              
              <div class="fc-tag">
                  <span class="tag-link">
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/오늘뭐입지">#오늘뭐입지</a>
                      </button>
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/KREAM스타일">#KREAM스타일</a>
                      </button>
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/아디다스">#아디다스</a>
                      </button>
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/오늘뭐입지">#오늘뭐입지</a>
                      </button>
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/KREAM스타일">#KREAM스타일</a>
                      </button>
                      <button type="button" class="btn btn-dark">
                        <a class="hashtag" href="https://kream.co.kr/social/tags/아디다스">#아디다스</a>
                      </button>
                  </span>
              </div>
            </table>
          </div>
        </div>
        <div class="noticewrap2">
            <div class="insertnotice2">
                <div class="uproad-img">
                    <img src="resources/style/a_7350c375e3a1458f96e16223e2310cc3.webp">
                </div>
                <div class="uproad-img">
                  <img src="resources/style/a_b2f594eb104a44c9b3b6f2286771f221.webp">
                </div>
            </div>
            <div class="item-tag">
              <button id="open2" type="submit" style="border-radius: 100%; border: 0 gray;" onclick="openModal('modal-wrapper2')">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="50" fill="currentColor" class="bi bi-tag-fill" viewBox="0 0 16 16">
                  <path d="M2 1a1 1 0 0 0-1 1v4.586a1 1 0 0 0 .293.707l7 7a1 1 0 0 0 1.414 0l4.586-4.586a1 1 0 0 0 0-1.414l-7-7A1 1 0 0 0 6.586 1H2zm4 3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                </svg>
              </button>
              <span style="font-weight: bold;">상품태그</span>
            </div>
        </div>
        

        <div id="modal-wrapper2" style="display: none">
          <div class="modal">
            <div id="close-wrapper2">
              <button type="submit" class="insert-btn2">등록</button>
              <button type="reset"  id="close2" onclick="closeModal('modal-wrapper2')">닫기</button>
              
            </div>
            <div class="modal-title">상품 태그하기</div>
            <div class="buy-list">
              <button type="button" class="list-btn" value="구매내역 불러오기"></button>
              <p>나이키 에어포스</p>
              <p>조던 1로우 그레이</p>
              <p>뉴발란스 992</p>
            </div>
            
          </div>
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

        <script>
          function setDetailImage(event){
            for(var image of event.target.files){
              var reader = new FileReader();
              
              reader.onload = function(event){
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                document.querySelector("div.img-area").appendChild(img);
              };
              
              console.log(image);
              reader.readAsDataURL(image);
            }
          }
        </script>
        

        <br><br><br><br><br><br>
    
    <foorter> </foorter>
  </body>
</html>