<%@ page import="com.smf.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

Member loginUser = (Member) session.getAttribute("loginUser");
// 로그인 전 : null값이 담김
// 로그인 후 : 로그인한 회원의 Member객체

char weather = 's';
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_메뉴바_화창</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/menu.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/modal.css"
	type="text/css">
<% if(weather == 's') { %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/sunny.css"
	type="text/css">
<% } else if(weather == 'r') { %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/rain.css"
	type="text/css">
<% } else if(weather == 'n') { %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/snow.css"
	type="text/css">
<% } %>
<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	background-color: rgba(255, 255, 255, 0);
	border-bottom: solid 1px rgb(231, 231, 231);
}

.header_box {
	height: 130px;
	max-width: 1280px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<div class="sky">
		<div class="sky__phase sky__1"></div>
		<div class="sky__phase sky__2"></div>
		<div class="orbit">
			<div class="sun"></div>
			<div class="sun2"></div>
			<div class="sun3"></div>
			<div class="sun4"></div>
		</div>
	</div>

	<div class="modal">
		<div class="frame">
			<div class="deco"></div>
			<div class="modal-alarm">
				<span class="close">&times;</span>
				<div>
					<table class="alarm-list"></table>
					<p class="no-alarm" hidden>새로운 알림이 없습니다.</p>
				</div>
			</div>
		</div>
	</div>

	<div class="header">
		<div class="header_box">
			<div class="header_top">
				<div class="top_inner">
					<ul class="top_list">
						<li class="top_item"><a href="">고객센터</a></li>
						<li class="top_item"><a href="">관심상품</a></li>
						<%
							if (loginUser == null) {
						%>
						<li class="top_item"><a
							href="${pageContext.request.contextPath}/login.page">로그인</a></li>
						<%
							} else {
						%>
						<li class="top_item"><a
							href="${pageContext.request.contextPath}/logout.me">로그아웃</a></li>
						<li><button class="view_more" type="button">
								<img id="alarm"
									src="${pageContext.request.contextPath}/resources/main/bell_icon.png">
								<div class="red-dot" hidden></div>
							</button></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="header_main">
				<div class="main_inner">구해줘패션(로고 삽입 예정)</div>
				<div class="gnb_area">
					<nav class="gnb">
						<ul class="gnb_list">
							<li><a
								href="${pageContext.request.contextPath}/dressroomMain.me">DRESS
									ROOM</a></li>
							<li><a href="">MY</a></li>
							<li><button class="view_more" type="button">
									<img id="search"
										src="${pageContext.request.contextPath}/resources/main/search_icon.png">
								</button></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="tab_area">
				<ul>
					<li><a href=""><span>HOME</span></a></li>
					<li><a href="${pageContext.request.contextPath}/styleList.st"><span>STYLE</span></a></li>
					<li><a href=""><span>SHOP</span></a></li>
					<li><a href=""><span>기획전</span></a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/main/js/modal.js"></script>

	<% if(weather == 'r') { %>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/main/js/rain.js"></script>
	<% } else if(weather == 'n') { %>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/main/js/snow.js"></script>
	<% } %>


</body>
</html>