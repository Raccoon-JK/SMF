<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="mypageHead.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/mypageWhishList.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/main/menubar_sun.jsp" />
    <div id="mypage_wrapper">
    	<jsp:include page="mypageMenu.jsp"></jsp:include>
    	<div id="mypage_content_wrapper">
            <div id="mypage_title">
                <p id="title" style="display: inline-block;">관심 상품 / 장바구니</p>
            </div>
            <div id="mypage_content">
            	<div id="wishList_shoppingCart_menuTab">
                    <div class="wish_cart_menuTab" id="wishList_menuTab">
                        <a href="">관심 상품</a>
                    </div>
                    <div class="wish_cart_menuTab" id="shoppingCart_menuTab">
                        <a href="<%=request.getContextPath()%>/mypageshoppingcart.me">장바구니</a>
                    </div>
                </div>
                <div id="wishList_productInfo_wrapper">
                	<c:choose>
                		<c:when test="${wList != '[]'}">
		                    <c:forEach var="list" items="${wList}">
			                    <div class="wishList_productInfo_flex">
			                        <div class="wishList_productInfo_left">
			                            <div class="wishList_productInfo_img">
			                                <img src="${pageContext.request.contextPath}${list.imgPath}${list.imgName}" alt="" width="80px" height="80px">
			                            </div>
			                            <div class="wishList_productInfo_text">
			                                <p class="wishList_productInfo_brand">${list.brandName }</p>
			                                <p class="wishList_productInfo_name">${list.productName }</p>
			                            </div>
			                        </div>
			                        <div class="wishList_productInfo_right">
			                            <div class="wishList_productInfo_shoppingCart_div">
			                                <a href="${pageContext.request.contextPath}/productDetail.sh?productName=${list.productName}" >상품페이지 이동</a>
			                            </div>
			                            <div class="wishList_productInfo_delete_div">
			                                <a href="#">삭제</a>
			                            </div>
			                        </div>
			                    </div>
		                    </c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<div id="wishList_null">
                    			<p>관심상품으로 등록된 상품이 없습니다.</p>
                    		</div>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
   	<script>
		const msg = "${alertMsg}";
		 
		 if(msg != ""){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		} 
	</script>
    <script>
    	$('.wishList_productInfo_delete_div>a').click(function(){
			let pName = $(this).parents('.wishList_productInfo_flex').children('.wishList_productInfo_left').children('.wishList_productInfo_text').children('.wishList_productInfo_name').text();
    		if(confirm('정말 삭제하십니까?')){
    			$(this).attr("href","${pageContext.request.contextPath}/wishListItemDel.me?pName="+pName)
			}
    	});
    </script>
</body>
</html>