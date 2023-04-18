<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = (String)request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SMF_Project/resources/my/css/mypageMain.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/common/menubar_sun.jsp" />
	<div id="mypage_wrapper">
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		<div id="mypage_content_wrapper">
<!--             <div id="mypage_title"> -->
<!--             </div> -->
            <div id="mypage_content">
            	<div id="myprofile">
            		<div id="myprofile_left">
            			<div id="profile_img">
            				<img alt="" src="<%=contextPath%>${ loginUser.userImg}">
            			</div>
            			<div id="myname">
            				<p id="my_name">${ loginUser.userName }</p>
            				<p id="my_id">${ loginUser.userId }</p>
            			</div>
            		</div>
            		<div id="myprofile_right">
						<!-- <div id=grade>
							<p>등급</p>
							<p>일반 회원</p>
						</div> -->
						<div id="point">
							<p>포인트</p>
							<p>${ loginUser.totalPoint}</p>
						</div>
	            	</div>
            	</div>
            	<div class="mypage_box" id="delivery_summary">
            		<div id="delivery_title">
            			<div id="shoppingcart">
            				<?xml version="1.0" encoding="utf-8"?>
							<svg fill="#000000" width="45px" height="45px" viewBox="0 0 256 256" id="Flat" xmlns="http://www.w3.org/2000/svg">
  								<path d="M215.64941,133.00879l12.15723-66.86231A12.00043,12.00043,0,0,0,216,52H58.01514L53.72852,28.42285A19.99033,19.99033,0,0,0,34.05078,12H16a12,12,0,0,0,0,24H30.71289l26.4707,145.59229A31.98171,31.98171,0,1,0,110.9873,196h42.0254A32.00193,32.00193,0,1,0,184,172H79.833l-2.90918-16H188.10156A27.98561,27.98561,0,0,0,215.64941,133.00879ZM88,204a8,8,0,1,1-8-8A8.00917,8.00917,0,0,1,88,204Zm96,8a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,184,212ZM62.37891,76H201.62109l-9.585,52.71631A3.99708,3.99708,0,0,1,188.10156,132H72.56055Z"/>
							</svg>
            				<p>배송 조회</p>
            			</div>
						<div id="shopping_more">
            				<a>더보기</a>
						</div>
            		</div>
            		<div id="delivery_content">
            			<div class="delivery_tracking_summary">
            				<p>2023.03.17 (금) 도착 예정</p>
            				<div class="delivery_product">
	            				<img alt="" src="/SMF_Project/resources/my/img/Adidas Gazelle Dark Green Cream White_1.png">
	            				<div class="delivery_product_content">
		            				<p>Adidas x Kith Samba OG Classics Progra</p>
		            				<p class="others">외 1개</p>
	            				</div>
            				</div>
            			</div>
            			<div class="delivery_tracking_summary">
            				<p>2023.03.17 (금) 도착 예정</p>
            				<div class="delivery_product">
	            				<img alt="" src="/SMF_Project/resources/my/img/Adidas Gazelle Dark Green Cream White_1.png">
	            				<div class="delivery_product_content">
		            				<p>Adidas x Kith Samba OG Classics Progra</p>
		            				<p class="others">외 1개</p>
	            				</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="mypage_box" id="interest_summary">
            		<div id="interest_title">
            			<div id="interest">
            				<?xml version="1.0" encoding="utf-8"?>
							<!-- License: PD. Made by Mary Akveo: https://maryakveo.com/ -->
							<svg fill="#000000" width="60px" height="60px" viewBox="0 0 24 24" id="bookmark" data-name="Line Color" xmlns="http://www.w3.org/2000/svg" class="icon line-color"><path id="primary" d="M12,17,5,21V4A1,1,0,0,1,6,3H18a1,1,0,0,1,1,1V21Z" style="fill: none; stroke: rgb(0, 0, 0); stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"></path></svg>
            				<p>관심 상품</p>
            			</div>
						<div id="whishList_more">
            				<a>더보기</a>
						</div>
            		</div>
            		<div id="interest_content">
            			<div class="interest_product_wrapper">
            				<c:choose>
            				<c:when test="${wList ne '[]' }">
            				<c:forEach var="list" items="${wList}">
	            				<div class="interest_products">
	          						<div class="interest_img">
	            						<img alt="" src="${pageContext.request.contextPath}${list.imgPath}${list.imgName}">
	            					</div>
	            					<p class="mainBrandName">${list.brandName}</p>
	            					<p class="mainProudctName">${list.productName}</p>
	            				</div>
            				</c:forEach>
            				</c:when>
            				<c:otherwise>
            					<p>등록된 관심 상품이 없습니다.....</p>
            				</c:otherwise>
            				</c:choose>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
	</div>
	<jsp:include page="/views/common/footer.jsp" />
	<script>
		document.querySelector("#shopping_more>a").addEventListener('click',function(){
			location.href='<%=contextPath%>/mypagbuyhistory.me';
		});
		document.querySelector("#whishList_more>a").addEventListener('click',function(){
			location.href='<%=contextPath%>/mypagewishlist.me';
		});

		$('.interest_products').css('cursor', 'pointer');

		$('.interest_products').click(function(){
			let prodcutName = $(this).children('.mainProudctName').text();
			let productUrl = '${pageContext.request.contextPath}/productDetail.sh?productName='+prodcutName
			window.location.href =  productUrl;
		});
	</script>
</body>
</html>