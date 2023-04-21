<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_푸터</title>
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
<style>
.footer {
	background-color: white;
}

.footer_box {
	height: 400px;
	max-width: 1280px;
	margin: 30px auto 60px;
	border-bottom: solid 1px rgb(231, 231, 231);
	padding: 0 40px;
}

.service_area {
	display: flex;
	padding-bottom: 60px;
}

.customer_service {
	margin-left: auto;
}

.corporation_area {
	margine: 30px 0px;
}

.notice_area {
	padding-top: 10px;
}

.menu_box {
	width: 155px;
	height: auto;
	margin-right: 40px;
}

#menu_li {
	padding-left: 0px;
	list-style: none;
}

#menu_li>li {
	margin-right: 10px;
}

.terms li {
	float: left;
	padding-right: 20px;
}

.ask {
	margin-top: 10px;
	border-radius: 10px;
	background-color: white;
	border: solid 1px rgb(231, 231, 231);
	padding: 1px 6px;
}
</style>
</head>
<body>
	<div class="footer">
		<div class="footer_box">
			<div class="service_area">
				<div class="menu_box">
					<strong>이용안내</strong>
					<ul id="menu_li">
						<li>검수기준</li>
						<li>이용정책</li>
						<li>페널티 정책</li>
						<li>커뮤니티 가이드라인</li>
					</ul>
				</div>
				<div class="menu_box">
					<strong>고객지원</strong>
					<ul id="menu_li">
						<li>공지사항</li>
						<li>서비스 소개</li>
						<li>쇼룸 안내</li>
					</ul>
				</div>
				<div class="customer_service">
					<strong>고객센터 1588-0000</strong>
					<ul id="menu_li">
						<li>운영시간 :</li>
						<li>1:1 문의하기는 PC버전에서만 가능합니다.</li>
					</ul>
					<div class="question_box">
						<a href="${pageContext.request.contextPath}/Faqlist.no"><button class="ask">자주 묻는 질문</button></a>
					</div>
				</div>
			</div>
			<hr>
			<div class="corporation_area">
				<div class="terms">
					<ul id="menu_li">
						<li>회사소개</li>
						<li>인재채용</li>
						<li>제휴제안</li>
						<li>이용약관</li>
						<li>개인정보처리방침</li>
					</ul>
				</div>
				<br>
				<br>
				<div class="info">
					<ul id="menu_li">
						<li>크림 주식회사 · 대표 김창욱 /</li>
						<li>사업자등록번호 : 570-88-01618 /</li>
						<li>사업자정보확인통신판매업 : 제 2021-성남분당C-0093호 /</li>
						<li>사업장소재지 : 경기도 성남시 분당구 분당내곡로 131 판교테크원 타워1, 8층 /</li>
						<li>호스팅 서비스 : 네이버 클라우드 ㈜</li>
					</ul>
				</div>
			</div>
			<br><br>
			<div class="notice_area">
				<p>구해줘패션(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로
					상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및 정책, 기타 거래 체결 과정에서
					고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 구해줘패션(주)에 있습니다.</p>
			</div>
		</div>
	</div>

</body>
</html>