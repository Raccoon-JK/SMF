<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/my/css/orderPaymentForm.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
    <h1>배송 / 결제</h1>
    <div id="orderPayment_wrapper">
        <div id="orderPayment_contentArea">
            <div class="orderPayment_div">
                <h5>상품 정보</h5>
                <div id="proudctInfo_flex">
                    <div id="productInfo_img">
                        <img src="../../resources/my/img/Adidas Gazelle Dark Green Cream White_1.png" alt="">
                    </div>
                    <div id="productInfo_text">
                        <strong class="product_brand">Nike</strong>
                        <p class="product_en">Jordan 4 x Nike SB Retro Pine Green</p>
                        <p class="product_ko">조던 4 x 나이키 SB 레트로 파인 그린</p>
                        <p class="product_size">245</p>
                    </div>
                </div>
            </div>
            <div class="orderPayment_div">
                <div id="orderAdress_title">
                    <h5>배송 주소</h5>
                    <a href="">변경</a>
                </div>
                <div id="orderAddress_area">
                    <div>
                        <span class="orderAddress_title">받는 분</span>
                        <span class="orderAddress_desc">와우이</span>
                    </div>
                    <div>
                        <span class="orderAddress_title">연락처</span>
                        <span class="orderAddress_desc">010-0000-0000</span>
                    </div>
                    <div>
                        <span class="orderAddress_title">배송 주소</span>
                        <span class="orderAddress_desc">서울 강북서구 강북서로 99길 28</span>
                    </div>
                </div>
            </div>
            <div class="orderPayment_div" id="orderPayment_point">
                <div id="orderPoint_title">
                    <h5>포인트</h5>
                    <span><a href="#">모두 사용</a></span>
                </div>
                <input type="number" id="pointInputBox">
                <span>보유 포인트</span>
                <span>0P</span>
            </div>
            <div class="orderPayment_div">
                <h5>결제 방법</h5>
                <div id="enrollment_orderPayment">
                    <p id=enrollment_cardTitle>등록된 카드</p>
                    <div id="enrollment_card_flex">
	                    <div id="enrollment_card_left">
		                    <span id="enrollment_cardNum">1564X-895X-15X5-192X</span>
		                    <span id="enrollment_cardDate">MM/YY</span>
	                    </div>
	                    <div id="enrollment_card_right">
	                    	<input type="number" id="paymentPwdInputBox" placeholder="비밀번호 앞 2자리" oninput="numLimit(this)">
	                   	</div>
                    </div>
                </div>
                <div id="generalPayments">
                    <p id="generalPayments_title">일반 결제</p>
                    <div id="generalPayments_box">
	                    <div id="tossPayments">
	                        <span>토스 페이</span>
	                        <img id="tossPay_img" alt="" src="/SMF_Project/resources/my/img/Toss_Logo_Secondary_Blue.png">
	                    </div>
                    </div>
                </div>
            </div>
            <div class="orderPayment_div">
                <h5>최종 주문 정보</h5>
                <div id="finalOrder_price_Div">
                    <p id="finalOrder_priceTitle">총 결제금액</p>
                    <p id="finalOrder_price">468,800원</p>
                </div>
                <div id="finalOrder_Detail">
                    <div class="finalOrder_Detail_flex" id="finalOrder_buy">
                        <span class="finalOrder_Detail_titleStyle">구매가</span>
                        <span class="finalOrder_Detail_textStyle">457,000원</span>
                    </div>
                    <div class="finalOrder_Detail_flex" id="finalOrder_point">
                        <span class="finalOrder_Detail_titleStyle">포인트</span>
                        <span class="finalOrder_Detail_textStyle">0P</span>
                    </div>
                    <div class="finalOrder_Detail_flex" id="finalOrder_shippingCost">
                        <span class="finalOrder_Detail_titleStyle">배송비</span>
                        <span class="finalOrder_Detail_textStyle">5,000원</span>
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
        function numLimit(pwdLimit){
            if(pwdLimit.value.length > 2){
                pwdLimit.value = pwdLimit.value.substr(0, 2);
            }
        }
        
        function checkbox_checked() {
        	let paymentBtn = document.getElementById("paymentsBtn");
        	
            if(tradeAgree.checked == true){
				paymentBtn.style.cursor = 'pointer';  	
            	paymentBtn.setAttribute('onclick', 'paymentsBtn_click()');
            	paymentBtn.style.backgroundColor = 'rgb(46, 204, 113)';
            } else{
            	paymentBtn.style.cursor = 'none';  
            	paymentBtn.removeAttribute('onclick');
            	paymentBtn.style.backgroundColor = '#ebebeb';
            }
		}
    </script>
    <script src="https://js.tosspayments.com/v1/payment"></script>
	<script>
	// 토스결제
	function paymentsBtn_click() {
	  var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
	  // 2. 초기화
	  var tossPayments = TossPayments(clientKey)
	  
		tossPayments.requestPayment('카드', { // 결제 수단 파라미터
		  // 결제 정보 파라미터
		  amount: 15000,
		  orderId: '153M7AC-opbm8vgsdJ8Bk',
		  orderName: '토스 티셔츠 외 2건',
		  customerName: '판매자상점',
		  successUrl: 'http://localhost:8080/SMF_Project/address.me',
		  failUrl: 'http://localhost:8080/fail',
		})
		.catch(function (error) {
		  if (error.code === 'USER_CANCEL') {
		    // 결제 고객이 결제창을 닫았을 때 에러 처리
		  } else if (error.code === 'INVALID_CARD_COMPANY') {
		    // 유효하지 않은 카드 코드에 대한 에러 처리
		  }
		})
	}
	</script>
</body>
</html>