<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/mypageSaleBuy.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/common/menubar_sun.jsp" />
    <div id="mypage_wrapper">
    	<jsp:include page="mypageMenu.jsp"></jsp:include>
    	<div id="mypage_content_wrapper">
            <div id="mypage_title">
                <p id="title" style="display: inline-block;">구매 내역</p>
            </div>
            <div id="mypage_content">
                <div class="salebuy_menuTab">
                    <div class="buysale_menuSelect buysale_menutab_common" id="buysale_all">
                        <a href="">전체</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_indelivery">
                        <a href="">결제</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_payments">
                        <a href="">배송 중</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_delivered">
                        <a href="">배송 완료</a>
                    </div>
                </div>
                <div class="dateSelect_box">
                    <div class="decentBtn_box">
                        <button type="button" value="2">최근 2개월</button>
                        <button type="button" value="4"> 4개월</button>
                        <button type="button" value="6"> 6개월</button>
                    </div>
                    <div class="duration_box">
                        <input type="date" name="duration_start" id="">
                        <span>~</span>
                        <input type="date" name="duration_end" id="">
                        <button type="button">조회</button>
                    </div>
                </div>
                <div class="salebuy_info_wrapper">
                    <div class="salebuy_info_box">
                        <div class="salebuy_info_title">
                            <p>2023.03.15</p>
                            <span>결제 완료</span>
                            <span><a href="">취소</a></span>
                        </div>
                        <div class="salebuy_info_product_flex">
                            <div class="salebuy_info_product_left">
                                <div class="salebuy_info_product_img">
                                    <img src="/SMF_Project/resources/my/img/_W_ Asics Gel_Kayano 14 White Midnight_1.png" alt="" width="80" height="80">
                                </div>
                                <div class="salebuy_info_product_text">
                                    <p>Adidas</p>
                                    <p>Adidas x Kith Samba OG Classics Program</p>
                                    <p>275</p>
                                </div>
                            </div>
                            <div class="salebuy_info_product_right">
                                <p>가격 : 1000원</p>
                                <div class="salebuy_info_product_btn">
                                    <!-- <button></button>
                                    <button></button>
                                    <button></button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>