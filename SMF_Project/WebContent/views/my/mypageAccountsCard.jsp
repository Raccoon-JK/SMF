<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SMF_Project/resources/my/css/mypageAccountsCard.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/main/menubar_sun.jsp" />
	<div id="mypage_wrapper">
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		<div id="mypage_content_wrapper">
			<div id="mypage_title">
				<p>계좌 및 카드 관리</p>
			</div>
			<div id="mypage_content">
				<div id="accounts_card">
				<div id="settlement_accounts">
					<h5 class="accountCardTitle" >정산 계좌</h5>
					<form action="" method="post" id="account_form">
						<div>
							<p>은행명</p>
							<input type="text" class="inputBox" name="bankName" placeholder="은행을 입력하세요" readonly>
						</div>
						<div>
							<p>계좌번호</p>
							<input type="text" class="inputBox" name="accountNo" placeholder="- 없이 입력하세요" readonly>
						</div>
						<div>
							<p>예금주</p>
							<input type="text" class="inputBox" name="accountHolder" placeholder="예금주명을 정확히 입력하세요" readonly>
						</div>
						<div>
							<button type="button" id="accountBtn" class="customBtn"></button>
						</div>
					</form>
				</div>
					<div id="manage_Card">
						<h5 class="accountCardTitle" >카드 관리</h5>
						<form action="" method="post" id="card_form">
							<div>
								<p>카드번호</p>
								<input type="text" class="inputBox" name="cardNo" placeholder="- 없이 입력하세요" readonly>
							</div>
							<div>
								<p>카드 비밀번호</p>
								<input type="text" class="inputBox" name="cardPwd" placeholder="앞 2자리" readonly>
							</div>
							<div>
								<p>카드 유효기간</p>
								<input type="text" class="inputBox" name="cardDate" placeholder="MM/YY" readonly>
							</div>
							<div>
								<p>CVC</p>
								<input type="text" class="inputBox" name="cvcNo" placeholder="3자리" readonly>
							</div>
							<div>
								<button type="button" id="cardBtn" class="customBtn"></button>
							</div>
						</form>
					</div>
				</div>			
			</div>
		</div>
	</div>
	<script>
		let accountInput = document.querySelectorAll('#settlement_accounts input');
		let accountBtn = document.querySelector('#accountBtn');
		let cardInput = document.querySelectorAll('#manage_Card input');
		let cardBtn = document.querySelector('#cardBtn');
		
		let accountForm = document.querySelector('#account_form');
		let cardForm = document.querySelector('#card_form');

		accountInput[0].value = '${account.bankName}';
		accountInput[1].value = '${account.accountNo}';
		accountInput[2].value = '${account.accountHolder}';

		cardInput[0].value = '${card.cardNo}';
		cardInput[1].value = '${card.cardPwd}';
		cardInput[2].value = MMYY('${card.cardValidity}');
		cardInput[3].value = '${card.cvc}';
		
		function validate(e){
			let boolVal = true;
			let regExpName = '';
			let inputBox = $(e).parents('form')
			if(inputBox.attr('id') == 'account_form'){

				if(inputBox.find('input[name="bankName"]').val() == ''){
					alert("은행명이 비어있습니다.")
					inputBox.find('input[name="bankName"]').click();
					inputBox.find('input[name="bankName"]').focus();

					boolVal = false;
				}
				if(inputBox.find('input[name="accountNo"]').val() == ''){
					alert("계좌번호가 비어있습니다.")
					inputBox.find('input[name="accountNo"]').click();
					inputBox.find('input[name="accountNo"]').focus();

					boolVal = false;
				}
				// regExpName = /^\d{11}$/g;
				// if(!regExpName.test(inputBox.find('input[name="phone"]').val())){
				// 	alert("휴대폰 번호가 아닙니다.")
				// 	inputBox.find('input[name="phone"]').click();
				// 	inputBox.find('input[name="phone"]').focus();

				// 	return false;
				// }
				if(inputBox.find('input[name="accountHolder"]').val() == ''){
					alert("예금주가 비어있습니다.")
					inputBox.find('input[name="accountHolder"]').click();
					inputBox.find('input[name="accountHolder"]').focus();

					boolVal = false;
				}
			}else{
				if(inputBox.find('input[name="cardNo"]').val() == ''){
					alert("카드번호가 비어있습니다.")
					inputBox.find('input[name="cardNo"]').click();
					inputBox.find('input[name="cardNo"]').focus();

					boolVal = false;
				}
				if(inputBox.find('input[name="cardPwd"]').val() == ''){
					alert("카드 비밀번호가 비어있습니다.")
					inputBox.find('input[name="cardPwd"]').click();
					inputBox.find('input[name="cardPwd"]').focus();

					boolVal = false;
				}
				if(inputBox.find('input[name="cardDate"]').val() == ''){
					alert("카드 유효기간이 비어있습니다.")
					inputBox.find('input[name="cardDate"]').click();
					inputBox.find('input[name="cardDate"]').focus();

					boolVal = false;
				}
				if(inputBox.find('input[name="cvcNo"]').val() == ''){
					alert("CVC가 비어있습니다.")
					inputBox.find('input[name="cvcNo"]').click();
					inputBox.find('input[name="cvcNo"]').focus();

					boolVal = false;
				}
				return boolVal;
			}
	}
		if('${account}' == ''){
			accountBtn.innerText = '추가하기';
			accountForm.setAttribute('action','<%=contextPath%>/accountinsert.me');
		}else{
			accountBtn.innerText = '변경하기';
			accountForm.setAttribute('action','<%=contextPath%>/accountupdate.me');
		}
		
		if('${card}' == ''){
			cardBtn.innerText = '추가하기';
			cardForm.setAttribute('action','<%=contextPath%>/cardinsert.me');
		}else{
			cardBtn.innerText = '변경하기';
			cardForm.setAttribute('action','<%=contextPath%>/cardupdate.me');
		}

		accountBtn.addEventListener('click',function(){
			accountInput.forEach(function(item, index, array){
				item.removeAttribute('readonly');
			});
			accountInput[0].click();
			accountInput[0].focus(); // 나중에 포커스가 아닌 스타일을 다르게 주는 것도 생각해야 함
			accountBtn.innerText = '저장하기';
			accountBtn.addEventListener('click',function(){
				if(validate($(this))){
					accountForm.submit();
				}
				return false;
			});
		});

		cardBtn.addEventListener('click',function(){
			cardInput.forEach(function(item, index, array){
				item.removeAttribute('readonly');
			});
			if(cardBtn.textContent != '저장하기'){
				cardInput[0].click();
				cardInput[0].focus();
			}
			cardBtn.innerText = '저장하기';
			cardBtn.addEventListener('click',function(){
					cardForm.submit(function(){
						return validate($(this));
					});
			});
		});
		
		function MMYY(mmyy) {
			let inputDateStr = mmyy;
			let inputDate = new Date(inputDateStr);
			let month = inputDate.getMonth()+1;
			let year = String(inputDate.getFullYear()).slice(2);
			let outputDateStr = '';
			if(mmyy != ''){
				outputDateStr = ('00'+month.toString()).slice(-2)+'/'+year;
			}
			return outputDateStr
		}

		$('.inputBox').on('click', function(){
			let inputTitle = $(this).parent();

			$('input[type="text"]').removeClass('inputBoxSelect');
			$('input[type="text"]').parent().removeClass('inputBoxSelectTitle');

			if($(this).attr('readonly') != 'readonly'){
			$(this).addClass('inputBoxSelect');
			inputTitle.addClass('inputBoxSelectTitle');
		}
		})

	</script>
</body>
</html>