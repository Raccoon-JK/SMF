<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해줘패션_푸터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<style>
.footer {
	margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    padding-top: 50px;
    padding-bottom: 50px;
    border-top: 1px solid #ebebeb;
}

.footer_box {
	padding: 0 40px;
}

.service_area {
	display: flex;
	padding-bottom: 60px;
	border-bottom: 1px solid #ebebeb;
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
	padding-top: 16px;
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
	border: 1px solid #ebebeb;
	padding: 1px 6px;
}
.thinText{
	font-size: 14px;
    letter-spacing: -.21px;
    color: rgba(34,34,34,.5);
}
.termText+.termText{
	margin-top: 12px;
}
.abcd{
	margin-top: 30px;
	padding-left: 0px;
	list-style: none;
}
.abcde{
	padding-left: 0px;
	list-style: none;
}
.ansdml{
	font-size: 13px;
    letter-spacing: -.07px;
    padding-top: 8px;
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
						<li class="thinText termText">검수기준</li>
						<li class="thinText termText">이용정책</li>
						<li class="thinText termText">페널티 정책</li>
						<li class="thinText termText">커뮤니티 가이드라인</li>
					</ul>
				</div>
				<div class="menu_box">
					<strong>고객지원</strong>
					<ul id="menu_li">
						<li class="thinText termText">공지사항</li>
						<li class="thinText termText">서비스 소개</li>
						<li class="thinText termText">쇼룸 안내</li>
					</ul>
				</div>
				<div class="customer_service">
					<strong>고객센터 1588-0000</strong>
					<ul id="menu_li">
						<li class="thinText">운영시간 :</li>
						<li class="ansdml">1:1 문의하기는 PC버전에서만 가능합니다.</li>
					</ul>
					<div class="question_box">
						<button class="ask">자주 묻는 질문</button>
					</div>
				</div>
			</div>
			<div class="corporation_area">
				<div class="terms">
					<ul class="abcd">
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
					<ul class="abcde">
						<li class="thinText">크림 주식회사 · 대표 김창욱 </li>
						<li class="thinText">사업자등록번호 : 570-88-01618 </li>
						<li class="thinText">사업자정보확인통신판매업 : 제 2021-성남분당C-0093호 </li>
						<li class="thinText">사업장소재지 : 경기도 성남시 분당구 분당내곡로 131 판교테크원 타워1, 8층 </li>
						<li class="thinText">호스팅 서비스 : 네이버 클라우드 ㈜</li>
					</ul>
				</div>
			</div>
			<div class="notice_area">
				<p class="thinText">구해줘패션(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로
					상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및 정책, 기타 거래 체결 과정에서
					고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 구해줘패션(주)에 있습니다.</p>
			</div>
		</div>
	</div>

</body>
</html>