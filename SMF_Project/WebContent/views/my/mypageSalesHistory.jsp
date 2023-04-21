<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/mypageSaleBuy.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/main/menubar_sun.jsp" />
    <div id="mypage_wrapper">
    	<jsp:include page="mypageMenu.jsp"></jsp:include>
    	<div id="mypage_content_wrapper">
            <div id="mypage_title">
                <p id="title" style="display: inline-block;">판매 내역</p>
            </div>
            <div id="mypage_content">
                <div class="salebuy_menuTab">
                    <div class="buysale_menuSelect buysale_menutab_common" id="buysale_all">
                        <a href="">전체</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_waiting_for_sales">
                        <a href="">판매 대기</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_on_sale">
                        <a href="">판매 중</a>
                    </div>
                    <div class="buysale_menuUnselect buysale_menutab_common" id="buysaleMenu_completed_sale">
                        <a href="">판매 완료</a>
                    </div>
                </div>
                <div class="dateSelect_box">
                    <div class="decentBtn_box">
                        <button type="button" class="monthBtn customBtn" value="2">최근 2개월</button>
                        <button type="button" class="monthBtn customBtn" value="4"> 4개월</button>
                        <button type="button" class="monthBtn customBtn" value="6"> 6개월</button>
                    </div>
                    <div class="duration_box">
                        <input type="date" name="duration_start" id="">
                        <span>~</span>
                        <input type="date" name="duration_end" id="">
                        <button type="button">조회</button>
                    </div>
                </div>
                <div class="salebuy_info_wrapper">
                <c:forEach var="list" items="${sellList }">
                    <div class="salebuy_info_box">
                        <div class="salebuy_info_title">
                            <p>${list.sellDate}</p>
                            <span>판매중</span>
                            <span>남은 수량 : ${list.sellCount} 개</span>
                        </div>
                        <div class="salebuy_info_product_flex">
                            <div class="salebuy_info_product_left">
                                <div class="salebuy_info_product_img">
                                    <img src="${pageContext.request.contextPath}${list.imgPath}${list.imgName}" alt="" width="80" height="80">
                                </div>
                                <div class="salebuy_info_product_text">
                                    <span class="p_brandname">${list.brandName}</span>
                                    <span>${list.productName}</span>
                                    <span>${list.pSize}</span>
                                </div>
                            </div>
                            <div class="salebuy_info_product_right">
                                <p>가격 : ${list.amount}원</p>
                                <div class="salebuy_info_product_btn">
                                    <!-- <button></button>
                                    <button></button>
                                    <button></button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.monthBtn').click(function(){
            let month = $(this).val()

            $.ajax({
                url : "${pageContext.request.contextPath}/sellingHistoryMonthAjax.me",
                type : 'POST',
                data : {month : month},
                success : function(data){
                    $('.salebuy_info_wrapper').empty();
                   $.each (data, function(index, el){
                        $('.salebuy_info_wrapper').append(  '<div class="salebuy_info_box">'
                                                                +'<div class="salebuy_info_title">'
                                                                    +'<p>'+el.sellDate+'</p>'
                                                                    +'<span>판매중</span>'
                                                                    +'<span>남은 수량 : '+el.sellCount+' 개</span>'
                                                                +'</div>'
                                                                +'<div class="salebuy_info_product_flex">'
                                                                    +'<div class="salebuy_info_product_left">'
                                                                        +'<div class="salebuy_info_product_img">'
                                                                            +'<img src="${pageContext.request.contextPath}'+el.imgPath+el.imgName+'" alt="" width="80" height="80">'
                                                                        +'</div>'
                                                                        +'<div class="salebuy_info_product_text">'
                                                                            +'<p>'+el.brandName+'</p>'
                                                                            +'<p>'+el.productName+'</p>'
                                                                            +'<p>'+el.pSize+'</p>'
                                                                        +'</div>'
                                                                    +'</div>'
                                                                    +'<div class="salebuy_info_product_right">'
                                                                        +'<p>가격 : '+el.amount+'원</p>'
                                                                        +'<div class="salebuy_info_product_btn">'
                                                                            +'<!-- <button></button>'
                                                                            +'<button></button>'
                                                                            +'<button></button> -->'
                                                                        +'</div>'
                                                                    +'</div>'
                                                                +'</div>'
                                                            +'</div>' )
                        console.log(el)
                   });
                },
                error : function(data){
                    console.log(data)
                }
            });
        });
    </script>
</body>
</html>