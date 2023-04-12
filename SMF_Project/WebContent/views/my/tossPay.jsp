<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>결제하기</title>
  <!-- 1. 스크립트 추가 -->
</head>
  <script src="https://js.tosspayments.com/v1/payment"></script>
<script>
  var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq' // 테스트용 클라이언트 키
  // 2. 초기화
  var tossPayments = TossPayments(clientKey)
  
	tossPayments.requestPayment('카드', { // 결제 수단 파라미터
	  // 결제 정보 파라미터
	  amount: 15000,
	  orderId: '153M7AC-opbm8vgsdJ8Bk',
	  orderName: '토스 티셔츠 외 2건',
	  customerName: '박토스',
	  successUrl: 'http://localhost:8080/SMF-Project/my/mypageAddress.me',
	  failUrl: 'http://localhost:8080/fail',
	})
	.catch(function (error) {
	  if (error.code === 'USER_CANCEL') {
	    // 결제 고객이 결제창을 닫았을 때 에러 처리
	  } else if (error.code === 'INVALID_CARD_COMPANY') {
	    // 유효하지 않은 카드 코드에 대한 에러 처리
	  }
	})
</script>

</html>