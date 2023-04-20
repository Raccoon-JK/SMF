<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="mypageHead.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/mypageShoppingCart.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<jsp:include page="/views/common/menubar_sun.jsp" /> --%>
    <div id="mypage_wrapper">
    	<jsp:include page="mypageMenu.jsp"></jsp:include>
    	<div id="mypage_content_wrapper">
            <div id="mypage_title">
                <p id="title" style="display: inline-block;">관심 상품 / 장바구니</p>
            </div>
            <div id="mypage_content">
            	<div id="wishList_shoppingCart_menuTab">
                    <div class="wish_cart_menuTab" id="wishList_menuTab">
                        <a href="<%=request.getContextPath()%>/mypagewishlist.me">관심 상품</a>
                    </div>
                    <div class="wish_cart_menuTab" id="shoppingCart_menuTab">
                        <a href="">장바구니</a>
                    </div>
                </div>
                <c:choose>
	                <c:when test="${cartList != '[]'}">
		                <form action="${ pageContext.request.contextPath }/orderForm.pay" method="get">
			                <div id="shoppingCartList_wrapper">
			                    <c:forEach var="c" items="${cartList}">
				                    <div class="shoppingCart_productInfo">
										<input type="hidden" name="" value="${c.status}">
				                        <div class="shoppingCart_productInfo_flexLeft">
				                            <div class="shoppingCart_productInfo_checkbox">
				                                <input type="checkbox" class="p_checkbox" name="cNo" value="${ c.cartNo }"  checked>
				                            </div>
				                            <div class="shoppingCart_productInfo_img">
				                                <img src="${pageContext.request.contextPath}${c.imgPath}${c.imgName}" alt="" width="80" height="80">
				                            </div>
				                            <div class="shoppingCart_productInfo_text">
				                                <p class="shoppingCart_productInfo_brand">${ c.brandName }</p>
				                                <p class="shoppingCart_productInfo_name">${ c.productName }</p>
				                                <!-- <p>1</p> -->
				                                <p class="shoppingCart_productInfo_size">${ c.size }</p>
												<p class="shoppingCart_productInfo_stockAmount">${c.cartCount}</p> <!-- 해당 재고 수량-->
				                            </div>
				                        </div>
				                        <div class="shoppingCart_productInfo_flexRight">
				                            <div class="shoppingCart_productInfo_price">
				                                <span class="priceTitle">가격: </span>
				                                <span class="priceValue">${ c.price*c.cartCount }원</span>
				                            </div>
				                            <div class="shoppingCart_productInfo_delete_div">
				                                <a href="#">삭제</a>
												<input type="hidden" name="" value="${ c.cartNo }">
				                            </div>
				                        </div>
				                    </div>
			                    </c:forEach>
			                    <div id="total_buy">
			                        <div id="total_buyPrice">
			                            <span>총 결제 금액 : </span>
										<span id="total_priceVal"></span>
			                        </div>
			                        <div id="buyBtn_div">
			                            <a href="#"><button type="submit">결제하기</button></a> <!-- 회원은 하나의 재고 상품에 한번만 장바구니에 담기 가능 -->
			                        </div>
			                    </div>
			                </div>
		                </form>
	                </c:when>
	                <c:otherwise>
	                	<p>장바구니에 담겨져 있는 상품이 없습니다.</p>
	                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
   	<script>
// 		const msg = "${alertMsg}";
		 
// 		 if(msg != ""){
// 			alert(msg);
<%-- 			<% session.removeAttribute("alertMsg"); %> --%>
// 		} 
	</script>
    <script>
		function p_totalPrice(){
			let total_price = 0
			$('.p_checkbox').each(function(){
				if($(this).is(':checked') == true){
					let p_priceText = $(this).parents('.shoppingCart_productInfo').children('.shoppingCart_productInfo_flexRight').children('.shoppingCart_productInfo_price').children('.priceValue').text();
					let p_pirce = parseInt(p_priceText.replace('원', ''));
					total_price += p_pirce;
				}
			});
			$('#total_priceVal').text(total_price+'원');
		}

		let pInfo = $('.shoppingCart_productInfo')

		pInfo.each(function(){ // 장바구니에 담긴 상품재고가 판매완료면 매진이라는걸 알 수 있게 하기
			if($(this).children('input[type="hidden"]').val() == 2 ){
				let soldOut_checkbox = $(this).children('.shoppingCart_productInfo_flexLeft').children('.shoppingCart_productInfo_checkbox').children('input[type="checkbox"]');
				soldOut_checkbox.prop('checked', false);
				soldOut_checkbox.prop('disabled', true);

				$(this).css('background-color', 'red');
			}
		});

		p_totalPrice();

		$('.p_checkbox').change(function(){
			p_totalPrice();
			if($('.p_checkbox:checked').length == 0){
				$('#buyBtn_div>a').removeAttr('href');
				$('#buyBtn_div>a').css('background-color', '#ebebeb');
			}else{
				$('#buyBtn_div>a').attr('href','#');
				$('#buyBtn_div>a').removeAttr('style');
			}
		});


		$('.shoppingCart_productInfo_delete_div>a').click(function(){
			let cNo = $(this).siblings('input[type="hidden"]').val();
    		if(confirm('정말 삭제하십니까?')){
    			$(this).attr("href","${pageContext.request.contextPath}/mypageshoppingDel.me?cNo="+cNo);
			}
    	});
    </script>
</body>
</html>