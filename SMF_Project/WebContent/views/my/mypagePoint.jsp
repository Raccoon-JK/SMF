<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../resources/my/css/mypagePoint.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/main/menubar_sun.jsp" />
	<div id="mypage_wrapper">
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		<div id="mypage_content_wrapper">
			<div id="mypage_title">
				<p>포인트</p>
			</div>
			<div id="mypage_content">
				<div id="Retention_point">
					<p>보유 포인트</p>
					<p>30 P</p>
				</div>
				<div id="details_point">
					<div id="details_point_title">
						<p>상세 내역</p>
						<p>적립 내역은 최근 1개월만 표시됩니다.</p>
					</div>
					<div class="details_product_buyPoint">
						<img alt="" src="../../resources/mypage/img/_W_ Nike Dunk Low Black_1.png">
						<div class="details_product_name">
							<p>Adidas</p>
							<p>Adidas x Kith Samba OG Classics Program</p>
							<p>10 P</p>
							<p>275</p>
						</div>
					</div>
					<div class="details_product_buyPoint">
						<img alt="" src="../../resources/mypage/img/_W_ Nike Dunk Low Black_1.png">
						<div class="details_product_name">
							<p>Adidas</p>
							<p>Adidas x Kith Samba OG Classics Program</p>
							<p>10 P</p>
							<p>275</p>
						</div>
					</div>
					<div class="details_product_buyPoint">
						<img alt="" src="../../resources/mypage/img/_W_ Nike Dunk Low Black_1.png">
						<div class="details_product_name">
							<p>Adidas</p>
							<p>Adidas x Kith Samba OG Classics Program</p>
							<p>10 P</p>
							<p>275</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>