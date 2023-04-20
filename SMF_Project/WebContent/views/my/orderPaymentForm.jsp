<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/orderPaymentForm.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="/views/main/menubar_sun.jsp" />
    <h1>배송 / 결제</h1>
    <div id="orderPayment_wrapper">
        <div id="orderPayment_contentArea">
            <div class="orderPayment_div">
                <h5>상품 정보</h5>
                <c:forEach var="list" items="${ pList }">
	                <div class="proudctInfo_flex">
                        <div class="proudctInfo_leftFlex">
                            <div class="productInfo_img">
                                <img src="${pageContext.request.contextPath}${list.imgPath}${list.imgName}" alt="">
                            </div>
                            <div class="productInfo_text">
                                <input type="hidden" name="sNo" value="${list.stockNo}">
                                <input type="hidden" name="cNo" value="${list.cartNo}">
                                <strong class="product_brand">${list.brandName}</strong>
                                <p class="product_en">${list.productName}</p>
                                <p class="product_size">${list.size}</p>
                            </div>
                        </div>
                        <div class="proudctInfo_rightFlex">
                            <span class="p_quantity">${list.cartCount}개</span>
                            <span class="p_price">${list.price * list.cartCount}원</span>
                            <!-- <span>원</span> -->
                        </div>
	                </div>
                </c:forEach>
            </div>
            <div class="orderPayment_div">
                <div id="orderAdress_title">
                    <h5>배송 주소</h5>
                    <a href="">변경</a>
                </div>
                <div id="orderAddress_area">
                    <input type="hidden" name="arrNo" value="${ defaultAddr.addressNo }">
                    <div>
                        <span class="orderAddress_title">배송지 이름</span>
                        <span class="orderAddress_desc">${ defaultAddr.receiver }</span>
                    </div>
                    <div>
                        <span class="orderAddress_title">연락처</span>
                        <span class="orderAddress_desc">${ defaultAddr.phone }</span>
                    </div>
                    <div>
                        <span class="orderAddress_title">배송 주소</span>
                        <span class="orderAddress_desc">${ defaultAddr.address }</span>
                    </div>
                </div>
            </div>
            <div class="orderPayment_div" id="orderPayment_point">
                <div id="orderPoint_title">
                    <h5>포인트</h5>
                    <button id="allPoint">모두 사용</button>
                </div>
                <input type="number" id="pointInputBox" value="0">
                <span>보유 포인트</span>
                <span>${ loginUser.totalPoint }P</span>
            </div>
            <div class="orderPayment_div">
                <h5>결제 방법</h5>
                <div class="paymentsClass" id="enrollment_orderPayment">
                    <p id=enrollment_cardTitle>등록된 카드</p>
                    <div id="enrollment_card_flex">
	                    <div id="enrollment_card_left">
		                    <span id="enrollment_cardNum">${ card.cardNo }</span>
		                    <span id="enrollment_cardDate">${ card.cardValidity }</span>
	                    </div>
	                    <div id="enrollment_card_right">
	                    	<input type="number" id="paymentPwdInputBox" placeholder="비밀번호 앞 2자리" oninput="numLimit(this)">
	                   	</div>
                    </div>
                </div>
                <div id="generalPayments">
                    <p id="generalPayments_title">일반 결제</p> <!-- 나중에 카드가 추가 안될 시에 대한 조건문 제시 -->
                    <div id="generalPayments_box">
	                    <div class="paymentsClass" id="tossPayments">
	                        <p>토스 페이</p>
	                        <img id="tossPay_img" alt="" src="/SMF_Project/resources/my/img/Toss_Logo_Secondary_Blue.png">
	                    </div>
                    </div>
                </div>
            </div>
            <div class="orderPayment_div">
                <h5>최종 주문 정보</h5>
                <div id="finalOrder_price_Div">
                    <p id="finalOrder_priceTitle">총 결제금액</p>
                    <p id="finalOrder_price" id="finalOrder_Totalprice">0원</p>
                </div>
                <div id="finalOrder_Detail">
                    <div class="finalOrder_Detail_flex" id="finalOrder_buy">
                        <span class="finalOrder_Detail_titleStyle">구매가</span>
                        <span class="finalOrder_Detail_textStyle" id="finalOrder_Detail_priceTxT">0원</span>
                    </div>
                    <div class="finalOrder_Detail_flex" id="finalOrder_point">
                        <span class="finalOrder_Detail_titleStyle">포인트</span>
                        <span class="finalOrder_Detail_textStyle" id="finalOrder_Detail_pointTxT">0P</span>
                    </div>
                    <div class="finalOrder_Detail_flex" id="finalOrder_shippingCost">
                        <span class="finalOrder_Detail_titleStyle">배송비</span>
                        <span class="finalOrder_Detail_textStyle" id="delivery_price">5,000원</span>
                    </div>
                </div>
                <div>
                    <div id="tradeAgree_flex">
                        <p>구매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</p>
                        <input type="checkbox" name="" id="tradeAgree" onclick="checkbox_checked();">
                    </div>
                    <div id="paymentsBtn_div">
                        <a id="paymentsBtn">결제하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //상품 가격
        var p_priceTotalNum = 0
        var final_TotalPoint = 0
        var delivery_priceNum = 0
        var final_totalPrice = 0
        //배송비
        delivery_priceNum = parseInt($('#delivery_price').text().replace(/[^0-9]/g, ""));

        $('.p_price').each(function(i, value){
            p_priceTotalNum += parseInt(value.innerHTML.replace(/[^0-9]/g, ""));
        });
        final_totalPrice = p_priceTotalNum-final_TotalPoint+delivery_priceNum
        $('#finalOrder_Detail_priceTxT').text(p_priceTotalNum.toLocaleString()+'원')
        $('#finalOrder_price').text((final_totalPrice).toLocaleString()+'원')

        

    	//카드 비밀번호 최대 2자리
        function numLimit(pwdLimit){
            if(pwdLimit.value.length > 2){
                pwdLimit.value = pwdLimit.value.substr(0, 2);
            }
        }
         
        // 체크박스 체크 시 결제버튼 활성화
        function checkbox_checked() {
        	let paymentBtn = document.getElementById("paymentsBtn");
        	
            if(tradeAgree.checked == true){
                if($('#enrollment_orderPayment').hasClass('paymentSelect') == false && ($('#tossPayments').hasClass('paymentSelect') == false)){
                    paymentBtn.style.cursor = 'default';  
            	    paymentBtn.removeAttribute('onclick');
            	    paymentBtn.style.backgroundColor = '#ebebeb';
                }else{
                    paymentBtn.style.cursor = 'pointer';  	
            	    paymentBtn.setAttribute('onclick', 'paymentsBtn_click()');
            	    paymentBtn.style.backgroundColor = 'rgb(46, 204, 113)';
                }
            } else{
            	paymentBtn.style.cursor = 'default';  
            	paymentBtn.removeAttribute('onclick');
            	paymentBtn.style.backgroundColor = '#ebebeb';
            }
		}

        // 포인트 모두 사용
        let allPointBtn = $('#allPoint')

        allPointBtn.click(function(){
            $('#pointInputBox').val('${loginUser.totalPoint}')

            $('#finalOrder_Detail_pointTxT').text( $('#pointInputBox').val()+'P')

            final_TotalPoint = parseInt($('#finalOrder_Detail_pointTxT').text().replace(/[^0-9]/g, ""));
            if((p_priceTotalNum-final_TotalPoint+delivery_priceNum)<=0){
                $('#finalOrder_price').text(0+'원')  
            }else{
               $('#finalOrder_price').text((final_totalPrice).toLocaleString()+'원')
            }
        });
        
        // 포인트 적용
        let finalTotal_pointTxt = $('#finalOrder_Detail_pointTxT')
        finalTotal_pointTxt.text(0+'P')
        $('#pointInputBox').keyup(function(event){
            let totalPoint_input = parseInt($(this).val(),10);
            $(this).val(parseInt($(this).val(),10));

            if(isNaN(totalPoint_input)){
                totalPoint_input = 0;
            }

            finalTotal_pointTxt.text(totalPoint_input+'P')

            final_TotalPoint = parseInt($('#finalOrder_Detail_pointTxT').text().replace(/[^0-9]/g, ""));
            if((p_priceTotalNum-final_TotalPoint+delivery_priceNum)<=0){
                $('#finalOrder_price').text(0+'원')
            }else{
               $('#finalOrder_price').text((p_priceTotalNum-final_TotalPoint+delivery_priceNum).toLocaleString()+'원')
            }
        });

        //결제 방법
        $('.paymentsClass').click(function(){
            $('.paymentSelect').removeClass('paymentSelect');
            $(this).addClass('paymentSelect');
            if($('#tradeAgree').is(':checked') == true){
                $('#paymentsBtn').css('background-color','rgb(46, 204, 113)')
                $('#paymentsBtn').css('cursor','pointer');
                $('#paymentsBtn').attr('onclick', 'paymentsBtn_click()');  	

            }
        });
    </script>
    <script src="https://js.tosspayments.com/v1/payment"></script>
	<script>
        // 결제버튼
        var p_count = $('.proudctInfo_flex').length
        var first_pName = $('.proudctInfo_flex .product_en')[0].innerHTML
        var orderNameVal = first_pName+' 외 '+p_count+'건';
        var amountVal = 0
        var p_quantityTxT = $('.p_quantity');
        var stockNo = $('input[name="sNo"]');
        var cartNo = $('input[name="cNo"]');
        var cNoArr = [];
        var sNoArr = [];
        var p_quantityArr = [];
        var addrNo = 'addrNo='+$('input[name="arrNo"]').val();

        
        cartNo.each(function(i, item){
            cNoArr.push('cNo='+item.value);
        });
        stockNo.each(function(i, item){
            sNoArr.push('sNo='+item.value);
        });
        p_quantityTxT.each(function(i, item){
            p_quantityArr.push('orderCount='+item.innerHTML.replace(/[^0-9]/g, ""));
        });
        
        var cNoStr = cNoArr.join('&');
        var sNoStr = sNoArr.join('&');
        var p_quantityStr = p_quantityArr.join('&');
        function paymentsBtn_click() {
            amountVal = parseInt($('#finalOrder_price').text().replace(/[^0-9]/g, ""))
            console.log(amountVal);
            // 토스결제
            if($('#tossPayments').hasClass('paymentSelect')){
                const clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
                // 2. 초기화
                var tossPayments = TossPayments(clientKey)

                tossPayments.requestPayment('카드', { // 결제 수단 파라미터
                // 결제 정보 파라미터
                amount: amountVal,
                orderId: '153M7AC-opbm8vgsdJ8Bk',
                orderName: orderNameVal,
                customerName: '${loginUser.userName}',
                // escrowProducts: {id : '123', name : 'ddd'},
                successUrl: 'http://localhost:8080/SMF_Project/ordersuccess.pay?'+cNoStr+'&'+sNoStr+'&'+p_quantityStr+'&point='+final_TotalPoint+'&'+addrNo,
                failUrl: 'http://localhost:8080/fail',
                })
                .catch(function (error) {
                if (error.code === 'USER_CANCEL') {
                    // 결제 고객이 결제창을 닫았을 때 에러 처리
                } else if (error.code === 'INVALID_CARD_COMPANY') {
                    // 유효하지 않은 카드 코드에 대한 에러 처리
                }
                });
            }
            //등록된 카드결제    
            if($('#enrollment_orderPayment').hasClass('paymentSelect') && $('#paymentPwdInputBox').val() == 0){
                alert('카드 비밀번호 2자리를 입력해주세요.');
            }else if($('#enrollment_orderPayment').hasClass('paymentSelect') && $('#paymentPwdInputBox').val() != 0){
                if(parseInt($('#paymentPwdInputBox').val()) == parseInt('${card.cardPwd}')){
                    location.href = 'http://localhost:8080/SMF_Project/ordersuccess.pay?'+cNoStr+'&'+sNoStr+'&'+p_quantityStr+'&point='+final_TotalPoint+'&'+addrNo+'&amount='+amountVal;
                }
            }
            if($('#enrollment_orderPayment').hasClass('paymentSelect') == false && ($('#tossPayments').hasClass('paymentSelect') == false)){
                alert('카드를 선택해주세요.');
            }
        }
	</script>
</body>
</html>