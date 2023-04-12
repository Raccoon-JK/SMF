<%@ page import="com.smf.main.model.vo.Product, java.util.ArrayList, com.smf.main.model.vo.ProductRange" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_메인페이지</title>
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
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/common/css/index.css"
	type="text/css">
</head>
<style>
.swiper-button-prev.style {
	background-image: url("resources/common/images/prev_button.svg") !important;
	width: 80px;
	height: 100px;
	margin-left: -25px;
	margin-top: -60px;
}

.swiper-button-next.style {
	background-image: url("resources/common/images/next_button.svg") !important;
	width: 80px;
	height: 100px;
	margin-right: -25px;
	margin-top: -60px;
}
</style>
<body>

	<jsp:include page="/views/common/menubar_sun.jsp" />

	<!-- Swiper -->
	<div class="swiper first">
		<div class="swiper-wrapper">
			<div class="swiper-slide banner">
				<a><img src="${pageContext.request.contextPath}/resources/common/images/banner1.webp"/></a>
			</div>
			<div class="swiper-slide banner">
				<a><img src="${pageContext.request.contextPath}/resources/common/images/banner2.webp"/></a>
			</div>
			<div class="swiper-slide banner">
				<a><img src="${pageContext.request.contextPath}/resources/common/images/banner3.webp"/></a>
			</div>
			<div class="swiper-slide banner">
				<a><img src="${pageContext.request.contextPath}/resources/common/images/banner4.webp"/></a>
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>

	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

	<div class="container">
		<div class="content">
			<div class="box_men">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/남성추천.webp"
						id="box1">
						<p>남성 추천</p>
					</a>
				</div>
			</div>
			<div class="box_women">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/여성추천.webp"
						id="box1">
						<p>여성 추천</p>
					</a>
				</div>
			</div>
			<div class="box_brand">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/인기브랜드.webp"
						id="box1">
						<p>인기 브랜드</p>
					</a>
				</div>
			</div>
			<div class="box_men">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/정가아래.webp"
						id="box1">
						<p>정가 아래</p>
					</a>
				</div>
			</div>
			<div class="box_women">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/셀럽픽.webp"
						id="box1">
						<p>셀럽픽</p>
					</a>
				</div>
			</div>
			<div class="box_brand">
				<div>
					<a href=""> <img
						src="${pageContext.request.contextPath}/resources/common/images/인기럭셔리.webp"
						id="box1">
						<p>인기 럭셔리</p>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="content_label">
			<h5>
				<b>Most Popular</b>
			</h5>
			인기상품
		</div>

		<div class="row">
			
		</div>

		<div class="button_box">
			<button class="btn_more" id="more">더보기</button>
		</div>
	</div>

	<!-- Swiper -->
	<div class="container">
		<div class="content_label style_head">
			<h5>
				<b>Newest Style</b>
			</h5>
		</div>
		<div class="content">
			<div class="swiper second">
				<div class="swiper-wrapper">
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test1.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test1.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>

					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test2.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test2.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>

					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test3.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test3.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test4.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test4.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test5.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test5.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test6.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test6.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test7.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test7.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test8.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test8.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test9.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test9.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
					<div class="swiper-slide style">
						<div class="style-container">
							<div class="style-pro">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test10.webp"></a>
							</div>
							<div class="style-main">
								<a><img
									src="${pageContext.request.contextPath}/resources/common/images/test10.webp"></a>
							</div>
							<p class="userId">@test1</p>
						</div>
					</div>
				</div>
				<div class="swiper-button-next style"></div>
				<div class="swiper-button-prev style"></div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/views/common/js/index.js"></script>

	<jsp:include page="/views/common/footer.jsp" />


</body>
</html>