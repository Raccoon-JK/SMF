<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/main/css/sunny.css"
	type="text/css">
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
					<table>
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

	<div class="modal" id="background">
		<div class="frame">
			<div class="modal-search">
				<span class="close">&times;</span>
				<div>
					<form method="" action="" name="search">
						<input class="searchBar" onkeyup="enterkey();" type="search"
							name="name" placeholder="브랜드명, 모델명 등">
					</form>
				</div>
				<div class="recSearch">
					<div class="serTitle">
						<b>추천 검색어</b>
					</div>
					<ul>
						<li><a><span>구찌</span></a></li>
						<li><a><span>에르메스</span></a></li>
						<li><a><span>구찌</span></a></li>
						<li><a><span>에르메스</span></a></li>
						<li><a><span>구찌</span></a></li>
						<li><a><span>에르메스</span></a></li>
					</ul>
				</div>
				<div class="bestSearch">
					<div class="serTitle">
						<b>인기 검색어</b>
					</div>
					<div class="serList">
						<ul>
							<li><a><span>1</span><span>구찌</span></a></li>
							<li><a><span>2</span><span>구찌</span></a></li>
							<li><a><span>3</span><span>구찌</span></a></li>
							<li><a><span>4</span><span>구찌</span></a></li>
							<li><a><span>5</span><span>구찌</span></a></li>
							<li><a><span>6</span><span>구찌</span></a></li>
							<li><a><span>7</span><span>구찌</span></a></li>
							<li><a><span>8</span><span>구찌</span></a></li>
							<li><a><span>9</span><span>구찌</span></a></li>
							<li><a><span>10</span><span>구찌</span></a></li>
						</ul>
					</div>
					<div class="serList">
						<ul>
							<li><a><span>11</span><span>구찌</span></a></li>
							<li><a><span>12</span><span>구찌</span></a></li>
							<li><a><span>13</span><span>구찌</span></a></li>
							<li><a><span>14</span><span>구찌</span></a></li>
							<li><a><span>15</span><span>구찌</span></a></li>
							<li><a><span>16</span><span>구찌</span></a></li>
							<li><a><span>17</span><span>구찌</span></a></li>
							<li><a><span>18</span><span>구찌</span></a></li>
							<li><a><span>19</span><span>구찌</span></a></li>
							<li><a><span>20</span><span>구찌</span></a></li>
						</ul>
					</div>

				</div>
				<div class="recBrand">
					<div class="serTitle">
						<b>추천 브랜드</b>
					</div>
					<ul>
						<li><a><div>
									<img src="https://via.placeholder.com/100">
									<p>구찌</p>
								</div></a></li>
						<li><a><div>
									<img src="https://via.placeholder.com/100">
									<p>구찌</p>
								</div></a></li>
						<li><a><div>
									<img src="https://via.placeholder.com/100">
									<p>구찌</p>
								</div></a></li>
					</ul>
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
	

</body>
</html>