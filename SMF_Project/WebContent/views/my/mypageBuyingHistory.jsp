<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.smf.my.model.vo.BuySellHistory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<ArrayList<BuySellHistory>> list = (ArrayList<ArrayList<BuySellHistory>>)request.getAttribute("list");
	ArrayList<BuySellHistory> orderList = (ArrayList<BuySellHistory>)request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/mypageSaleBuy.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/main/menubar_sun.jsp" />
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
                        <button type="button" class="monthSearch" value="2">최근 2개월</button>
                        <button type="button" class="monthSearch" value="4"> 4개월</button>
                        <button type="button" class="monthSearch" value="6"> 6개월</button>
                    </div>
                    <div class="duration_box">
                        <input type="date" name="duration_start" id="">
                        <span>~</span>
                        <input type="date" name="duration_end" id="">
                        <button type="button">조회</button>
                    </div>
                </div>
                <div class="salebuy_info_wrapper">
                	<% for(int i=0; i<list.size(); i++) { %>
	                    <div class="salebuy_info_box">
	                        <div class="salebuy_info_title">
	                            <p><%= orderList.get(i).getOrderDate() %></p>
	                            <p><%= orderList.get(i).getTotalAmount() %>원</p>
	                            <span>결제 완료</span>
	                            <span><a href="">취소</a></span>
	                        </div>
	                        <% for(int j=0; j<list.get(i).size(); j++){ %>
		                        <div class="salebuy_info_product_flex">
		                            <div class="salebuy_info_product_left">
		                                <div class="salebuy_info_product_img">
		                                    <img src="<%=request.getContextPath()%><%=list.get(i).get(j).getImgPath()%><%=list.get(i).get(j).getImgName()%>" alt="" width="80" height="80">
		                                </div>
		                                <div class="salebuy_info_product_text">
		                                    <p><%=list.get(i).get(j).getBrandName()%></p>
		                                    <p><%=list.get(i).get(j).getProductName()%></p>
		                                    <p><%=list.get(i).get(j).getpSize()%></p>
		                                </div>
		                            </div>
		                            <div class="salebuy_info_product_right">
		                                <p>가격 : <%=list.get(i).get(j).getAmount()%>원</p>
		                                <div class="salebuy_info_product_btn">
		                                    <!-- <button></button>
		                                    <button></button>
		                                    <button></button> -->
		                                </div>
		                            </div>
		                        </div>
	                        <%} %>
	                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.monthSearch').click(function(){
            let month = $(this).val()
            $.ajax({
                url: "${pageContext.request.contextPath}/buyingHistoryMonthAjax.me",
                type : 'POST',
                data : {month : month},
                success : function(data){
                    let arr = data;
                    let item;
                    $('.salebuy_info_wrapper').empty();
                    for(let i=0; i<arr.length; i++){
                        item = arr[i]
                        let str='<div class="salebuy_info_box">';
                        for(let j=0; j<item.length; j++){
                            str += '<div class="salebuy_info_product_flex">'
                                        +'<div class="salebuy_info_product_left">'
                                            +'<div class="salebuy_info_product_img">'
                                                +'<img src="${pageContext.request.contextPath}'+item[j].imgPath+item[j].imgName+'" alt="" width="80" height="80">'
                                            +'</div>'
                                            +'<div class="salebuy_info_product_text">'
                                                +'<p>'+item[j].brandName+'</p>'
                                                +'<p>'+item[j].productName+'</p>'
                                                +'<p>'+item[j].pSize+'</p>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="salebuy_info_product_right">'
                                            +'<p>가격 :'+item[j].amount+'원</p>'
                                            +'<div class="salebuy_info_product_btn"></div>'
                                        +'</div>'
                                     +'</div>'
                        }
                        $('.salebuy_info_wrapper').append(str+'</div>'); 
                    }
                    $.ajax({
                        url: "${pageContext.request.contextPath}/buyingHistoryMonthAjax2.me",
                        type : 'POST',
                        data : {month : month},
                        success : function(data){
                            for(let i=0; i<data.length; i++){
                                let str = '<div class="salebuy_info_title">'
                                            +'<p>'+data[i].orderDate+'</p>'
                                            +'<p>'+data[i].totalAmount+'원</p>'
                                            +'<span>결제 완료</span>'
                                            +'<span><a href="">취소</a></span>'
                                            +'</div>';
                                $($('.salebuy_info_box')[i]).prepend(str);
                           }       
                        },
                        error : function(data){
                            console.log('실패2')
                        }
                    });        
                },
                error : function(data){
                    console.log('실패1');
                }
                
            })

        })
    </script>
</body>
</html>