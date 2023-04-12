<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SMF_Project/resources/my/css/mypageInfo.css">
<jsp:include page="mypageHead.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/views/common/menubar_sun.jsp" />
	<div id="mypage_wrapper">
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		<div id="mypage_content_wrapper">
            <div id="mypage_title">
            	<p>내 프로필 정보</p>
            </div>
			<div id="mypage_content">
				<form method="POST" id="myInfoForm" enctype="multipart/form-data">
					<div id="mypageInfo_img">
						<img id="mypage_profileImg" alt="" src="<%=contextPath%>${loginUser.userImg}">
						<input type="file" name="userImg" id="updateMyImg">
						<label for="updateMyImg">변경</label>
						<input type="hidden" name="id" value="${loginUser.userId}">
					</div>
				</form>
				<div id="mypageInfo_content">
					<div id="mypageInfo_content_left">
						<div class="Personal_info mypageInfo_class">
							<h5>개인정보</h5>
							<p>이름</p>
							<input class="inputBox" type="text" name="USER_NAME" readonly>
							<button type="button">변경</button>
						</div>
						<div class="Personal_info mypageInfo_class">
							<p>생년월일</p>
							<input class="inputBox" type="text" name="BIRTH" readonly>
							<button type="button">변경</button>
						</div>
						<div class="Personal_info mypageInfo_class">
							<p>핸드폰</p>
							<input class="inputBox" type="text"  name="PHONE" readonly>
							<button type="button">변경</button>
						</div>
					</div>
					<div id="mypageInfo_content_right">
						<div id="mypageInfo_loginInfo">
							<div class="login_info mypageInfo_class">
								<h5>로그인 정보</h5>
								<p>아이디</p>
								<input class="inputBox" type="text" readonly>
								<button type="button">변경</button>
							</div>
							<div class="login_info mypageInfo_class">
								<p>비밀번호</p>
								<input class="inputBox" type="password"  name="USER_PWD" readonly>
								<button type="button">변경</button>
							</div>
						</div>
						<div class="mypageInfo_class" id="Agree_to_receiveInfo">
							<h5>정보 수신 동의</h5>
							<p>이메일</p>
							<div id="agree_radio_box">
								<label for="agree_radio">수신 동의</label>
								<input type="radio" name="AGREE_EMAIL" id="agree_radio" value="Y">
								<label for="disagree_radio">수신 거부</label>
								<input type="radio" name="AGREE_EMAIL" id="disagree_radio" value="N">
							</div>
						</div>
					</div>
				</div>
				<div id="memberDel_div">
					<span id="memberDel"><a>회원 탈퇴</a></span>
				</div>
			</div>
		</div>
	</div>
	<script src="/SMF_Project/resources/common/javascript/priceFormat.js"></script>
	<script>
		let info = document.getElementById("mypageInfo_content");
		let inputText = info.querySelectorAll('input[type=text]');
		let inputPwd = info.querySelector('input[type=password]');
		let inputRadio = info.querySelectorAll('input[type=radio]')

		inputText[0].value = '${loginUser.userName}';
		inputText[1].value = '${loginUser.birth}';
		inputText[2].value = '${loginUser.phone}'; //MemberDao에서 핸드폰 형식수정
		inputText[3].value = '${loginUser.userId}';
		inputPwd.value = '${loginUser.userPwd}';

		console.log('${loginUser.agreeEmail}');
		if( '${loginUser.agreeEmail}' == 'Y'){
			inputRadio[0].checked = true;
		} else{
			inputRadio[1].checked = true;
		}

		let currBtn = $("button[type='button']");
		let currRadio = $("input[type='radio']");
		let currImg = $("input[type='file']");
		
		currBtn.click(function(){
			console.log($(this).text())
				let currInput = $(this).siblings("input");
				if($(this).text() == '변경'){
				currInput.attr('readonly', false);
				currInput.val('');
				currInput.focus();
				$(this).text('저장');
				}else if($(this).text() == '저장'){
					let currName = currInput.attr('name');
					let currVal = currInput.val();
					console.log
					$.ajax({ // 어차피 변경된 값만 input값만 보여주고 새로고침할 때 변경된 값을 보여주면 될거 같은데 왜 굳이 ajax로 했을까란 후회를 다 하고나서 합니다...
			 			url : "<%=contextPath%>/myinfoupdate.me",
						data : { name : currName, val : currVal, id : '${ loginUser.userId }'},
						type : "post",
						success : function(m){
						},
						error :  console.log('실패!')
					});
					if(currName == 'BIRTH'){
						let year = currVal.substring(0,4);
						let month = currVal.substring(4, 6);
						let day = currVal.substring(6,8);
						let dateFormat = year+'-'+month+'-'+day;
						currInput.val(dateFormat);
					}
					$(this).text('변경');
				}
		});
		
		currRadio.click(function() {
			$.ajax({ // 어차피 변경된 값만 input값만 보여주고 새로고침할 때 변경된 값을 보여주면 될거 같은데 왜 굳이 ajax로 했을까란 후회를 다 하고나서 합니다...
	 			url : "<%=contextPath%>/myinfoupdate.me",
				data : { name : currRadio.attr('name'), val : $(this).val(), id : '${ loginUser.userId }'},
				type : "post",
				success : function(m){
				},
				error :  console.log('실패!')
			});
		});
		
		currImg.change(function(event){
			let form= $("#myInfoForm")[0];
			let formData = new FormData(form);
			$.ajax({
	 			url : "<%=contextPath%>/myinfoupdate.me",
 			  	processData: false,
 	            contentType: false,
 	            type : 'POST', 
 	            data : formData,
 	            dataType : "JSON",
				success : function(m){
					$("#mypage_profileImg").attr('src', "<%=contextPath%>"+m.userImg);
				},
				error :  console.log('실패!')
			});
		});
		document.querySelector("#memberDel>a").addEventListener('click',function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = '<%=contextPath%>/myinfodelete.me?userId=${loginUser.userId}';
			};
		});
	</script>
</body>
</html>