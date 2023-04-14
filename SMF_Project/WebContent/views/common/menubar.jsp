<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_메뉴바</title>
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

<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	background-color: white;
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
	<div class="modal">
		<div class="frame">
			<div class="deco"></div>
			<div class="modal-alarm">
				<span class="close">&times;</span>
				<div>
					<table class="table-alarm">
						<tr>
							<td>새로운 알림이 왔습니다.</td>
						</tr>
						<tr>
							<td>새로운 알림이 왔습니다.</td>
						</tr>
						<tr>
							<td>새로운 알림이 왔습니다.</td>
						</tr>
						<tr>
							<td>새로운 알림이 왔습니다.</td>
						</tr>
						<tr>
							<td>새로운 알림이 왔습니다.</td>
						</tr>
					</table>
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
						<li class="top_item"><a href="">로그인</a></li>
						<li><button class="view_more" type="button">
								<img id="alarm"
									src="${pageContext.request.contextPath}/resources/main/bell_icon.png">
							</button></li>
					</ul>
				</div>
			</div>
			<div class="header_main">
				<div class="main_inner">구해줘패션(로고 삽입 예정)</div>
				<div class="gnb_area">
					<nav class="gnb">
						<ul class="gnb_list">
							<li><a href="">DRESS ROOM</a></li>
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
					<li><a href=""><span>STYLE</span></a></li>
					<li><a href=""><span>SHOP</span></a></li>
					<li><a href=""><span>기획전</span></a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/main/js/modal.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/main/js/rain.js"></script>

</body>
</html>