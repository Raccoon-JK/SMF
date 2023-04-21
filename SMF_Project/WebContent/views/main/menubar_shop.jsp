<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_메뉴바</title>
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- <!-- Popper JS --> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- Latest compiled JavaScript -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/menu_shop.css"
	type="text/css">
<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	background-color: white;
}

.header_box {
	height: 109px;
	max-width: 1280px;
	margin-left: auto;
	margin-right: auto;
}

.search_title {
	margin: 30px 0px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header_box">
			<div class="header_top">
				<div class="top_inner">
					<ul class="top_list">
						<li class="top_item"><a href="">고객센터</a></li>
						<li class="top_item"><a href="">관심상품</a></li>
						<li class="top_item"><a href="">로그인</a></li>
						<li><a href=""><img id="notice"
								src="resources/main/bell_icon.png"></a></li>
					</ul>
				</div>
				<a class="nav-link nav-icons" href="javascript:void(0);"
					id="navbarDropdownMenuLink1" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <i
					class="fas fa-fw fa-bell"></i><input type="hidden"
					value="${loginUser.userId }" id="memIdSpan"> <span
					class="indicator" id="alarmIcon" style="display: none;"></span>
				</a>
			</div>
			<div class="header_main">
				<div class="main_inner">구해줘패션(로고 삽입 예정)</div>
				<div class="gnb_area">
					<nav class="gnb">
						<ul class="gnb_list">
							<li><a href="">HOME</a></li>
							<li><a href="">STYLE</a></li>
							<li><a href="">SHOP</a></li>
							<li><a href="">MY</a></li>
							<li><button class="btnFind" type="submit" name="btnFind">
									<img id="searchBtn"
										src="${pageContext.request.contextPath}/resources/main/search_icon.png">
								</button></li>
						</ul>
					</nav>
				</div>
			</div>
<!-- 			<div class="search_title"> -->
<!-- 				<h1>SHOP</h1> -->
<!-- 			</div> -->
<!-- 			<div class="tab_area"> -->
<!-- 				<ul> -->
<!-- 					<li><a href=""> <span>전체</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>럭셔리</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>신발</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>아우터</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>상의</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>하의</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>가방</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>지갑</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>시계</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href=""> <span>패션잡화</span> -->
<!-- 					</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
		</div>
	</div>


</body>
</html>