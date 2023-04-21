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
<jsp:include page="mypageHead.jsp"></jsp:include>
<link rel="stylesheet" href="/SMF_Project/resources/my/css/mypageAddress.css">
<title>Insert title here</title>
<style>
	.modal{
		z-index: 1050 !important;
	}
</style>
</head>
<body>
	<!-- 주소추가 모달 -->
    <div class="modal fade" id="addressAdd" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content add-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel">새 주소 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <form action="<%=request.getContextPath()%>/addrinsert.me" method="post">
		                <div class="modal-body">
	                        <label for="name">이름</label>
	                        <div class="input_box">
	                            <input type="text" name="name" class="inputBox" placeholder="수령인의 이름">
	                        </div>
	                        <label for="phone">휴대폰 번호</label>
	                        <div class="input_box">
	                            <input type="text" name="phone" class="inputBox" placeholder="- 없이 입력" pattern="[0-9]*" maxlength="11">
	                        </div>
	                        <label for="postcode">우편번호</label>
	                        <div class="input_box" id="postcode_wrapper">
	                            <input type="text" name="postcode" id="postcodeInsert" class="inputBox" placeholder="우편 번호를 검색하세요" readonly>
	                            <button type="button" class="postcodeBtn" onclick="insertDaumPostcodeBtn();">우편번호 검색</button>
	                        </div>
	                        <label for="address">주소</label>
	                        <div class="input_box">
	                            <input type="text" name="address" id="roadAddrInsert" class="inputBox" placeholder="우편 번호 검색후 자동입력 됩니다." readonly>
	                        </div>
	                        <label for="detailed_address">상세 주소</label>
	                        <div class="input_box">
	                            <input type="text" name="detailedAddress" class="inputBox" placeholder="건물, 아파트, 동/호수 입력">
	                        </div>
                		</div>
               		 <div class="modal-footer">
                    	<button type="submit" class="btn btn-primary" id="addrSave">추가</button>
                    	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="addrModalCancel();">취소</button>
                	</div>
           		</form>
            </div>
        </div>
    </div>
   	<!-- 주소수정 모달 -->
    <div class="modal fade" id="addressUpdate" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalLabel">배송지 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <form action="<%=request.getContextPath()%>/addrupdate.me" method="post">
		                <div class="modal-body">
		                	<input type="hidden" name="addrNo">
	                        <label for="name">이름</label>
	                        <div class="input_box">
	                            <input type="text" name="name" class="inputBox" placeholder="수령인의 이름">
	                        </div>
	                        <label for="phone">휴대폰 번호</label>
	                        <div class="input_box">
	                            <input type="text" name="phone" placeholder="- 없이 입력">
	                        </div>
	                        <label for="postcode">우편번호</label>
	                        <div class="input_box" id="postcode_wrapper">
	                            <input type="text" name="postcode" id="postcodeUpdate" placeholder="우편 번호를 검색하세요" readonly>
	                            <button type="button" class="postcodeBtn" onclick="updateDaumPostcodeBtn();">우편번호 검색</button>
	                        </div>
	                        <label for="address">주소</label>
	                        <div class="input_box">
	                            <input type="text" name="address" id="roadAddrUpdate" placeholder="우편 번호 검색후 자동입력 됩니다." readonly>
	                        </div>
	                        <label for="detailed_address">상세 주소</label>
	                        <div class="input_box">
	                            <input type="text" name="detailedAddress" placeholder="건물, 아파트, 동/호수 입력">
	                        </div>
                		</div>
               		 <div class="modal-footer">
                    	<button type="submit" class="btn btn-primary" id="addrUpdateBtn">저장</button>
                    	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="addrModalCancel();">취소</button>
                	</div>
           		</form>
            </div>
        </div>
    </div>
	<!-- 삭제 모달창 -->
    <div class="modal fade" id="addressDel" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
		        	<h5 class="modal-title" id="staticBackdropLabel">배송지 삭제</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
			        </button>
			    </div>
   				<div class="modal-body">
        			정말 삭제하시겠습니까?
      			</div>
   				<div class="modal-footer">
        			<a href="#" class="btn btn-primary" onclick="addrDel_modal();">삭제</a>
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      			</div>
   			</div>
  		</div>
	</div>
	<jsp:include page="/views/main/menubar_sun.jsp" />
    <div id="mypage_wrapper">
	    <jsp:include page="mypageMenu.jsp"></jsp:include>
        <div id="mypage_content_wrapper">
            <div id="mypage_title">
                <p id="title" style="display: inline-block;">주소록</p>
                <button type="button" id="customAddID" class="customAadd" data-toggle="modal" data-target="#addressAdd">새 주소 추가</button>
            </div>
            <div id="mypage_content">
            	<div id="address_wrapper">
					<c:choose>
						<c:when test="${addrDefault eq null and addrList == '[]'}">
							<!-- 기본 배송지 -->
              				<div class="address_null">
	               				<p>등록된 배송지가 없습니다...</p>
	               			</div>
	               		</c:when>
	               		<c:otherwise>
	               			<c:choose>
								<c:when test="${addrDefault ne null}">
					                <div class="address_area" id="default_address">
										<div class="address_area_left">
											<div id="defaultAddr_title" class="addrTop">
												<span class="addrName" style="display: inline-block;">${addrDefault.receiver}</span>
												<span id="default_addrText">기본 배송지</span>
											</div>
												<p>${addrDefault.phone}</p>
												<p>(${addrDefault.postcode}) ${addrDefault.address}</p>
										</div>
										<div class="address_area_right">
											<a href="#" class="mypageBtn customAupdate" data-toggle="modal" data-target="#addressUpdate" onclick="addrUpdateDefault(${addrDefault.addressNo});">수정</a>
										</div>
					                </div>
				                </c:when>
				                <c:otherwise>
				                	<div class="address_null">
				                		<p>등록된 기본 배송지가 없습니다.</p>
				                	</div>
				                </c:otherwise>
			                </c:choose>
			                <div id="addressLine"></div>
			                <!-- 그 외 배송지 -->
		             		<c:forEach var="list" items="${addrList}">
			  	                <div class="address_area">
									<div class="address_area_left">
										<div class="addrTop">
											<p class="addrName">${list.receiver}</p>
										</div>
										<p>${list.phone}</p>
										<p>(${list.postcode}) ${list.address}</p>
									</div>
									<div class="address_area_right">
										<div class="addressBtn_top">
											<a href="#" class="mypageBtn customAadd" id="defaultAddr_Btn" onclick="defaultAddrChange(${list.addressNo});">기본 배송지</a>
										</div>
										<div class="addressBtn_bottom">
											<a href="#" class="mypageBtn customAupdate" data-toggle="modal" data-target="#addressUpdate" onclick="addrUpdate(${list.addressNo});">수정</a>
											<a href="#" class="mypageBtn customADel" data-toggle="modal" data-target="#addressDel" onclick="addrDel(${list.addressNo});">삭제</a>
										</div>
									</div>
				                </div>
		               		</c:forEach>
	               		</c:otherwise>
        			</c:choose>
                </div>
            </div>
    	</div>
    </div>   
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/SMF_Project/resources/my/javascript/daum_postcode.js"></script>
	<script>
		$('.modal-body input[type="text"]').on('click', function(){
			let addrTitle = $(this).parent().prev();

			$('.modal-body input[type="text"]').removeClass('inputBoxSelect');
			$('.modal-body input[type="text"]').parent().prev().removeClass('inputBoxSelectTitle');

			if(addrTitle.text() == '이름' || addrTitle.text() == '휴대폰 번호' || addrTitle.text() == '상세 주소'){
				$(this).addClass('inputBoxSelect');
				addrTitle.addClass('inputBoxSelectTitle');
			}
		});

		//정규식
		$('input[name="phone"]').on('input', function(){
			let val = $(this).val();
			let NumVal = val.replace(/[^0-9]/g, "").slice(0, 11);

			if (NumVal != val){
				$(this).val(NumVal);
			}
		});
		
		function validate(e){
			let regExpName = '';
			let inputBox = $(e).parents('.modal-content')

			if(inputBox.find('input[name="name"]').val() == ''){
				alert("이름이 비어있습니다.")
				inputBox.find('input[name="name"]').click();
				inputBox.find('input[name="name"]').focus();

				return false;
			}
			if(inputBox.find('input[name="phone"]').val() == ''){
				alert("휴대폰 번호가 비어있습니다.")
				inputBox.find('input[name="phone"]').click();
				inputBox.find('input[name="phone"]').focus();

				return false;
			}
			regExpName = /^\d{11}$/g;
			if(!regExpName.test(inputBox.find('input[name="phone"]').val())){
				alert("휴대폰 번호가 아닙니다.")
				inputBox.find('input[name="phone"]').click();
				inputBox.find('input[name="phone"]').focus();

				return false;
			}
			if(inputBox.find('input[name="postcode"]').val() == ''){
				alert("우편번호가 비어있습니다.")
				inputBox.find('input[name="postcode"]').click();
				inputBox.find('input[name="postcode"]').focus();

				return false;
			}
			if(inputBox.find('input[name="address"]').val() == ''){
				alert("주소가 비어있습니다.")
				inputBox.find('input[name="address"]').click();
				inputBox.find('input[name="address"]').focus();

				return false;
			}
			if(inputBox.find('input[name="detailedAddress"]').val() == ''){
				alert("상세 주소가 비어있습니다.")
				inputBox.find('input[name="detailedAddress"]').click();
				inputBox.find('input[name="detailedAddress"]').focus();

				return false;
			}
		}
		


		var Num = 0;
    	function defaultAddrChange(addrNo) {
			location.href = "<%= contextPath %>/defaultaddr.me?addrno="+addrNo;
		}
    	function addrDel(addrNo) {
    		Num = addrNo;
		}
    	function addrDel_modal() {
			location.href = "<%= contextPath %>/addrdel.me?addrNo="+Num;
		}
		function addrUpdateDefault(addrNo){
			let current = event.currentTarget;
			let current_info = current.parentNode.parentNode.parentNode.children[0].children;
			
			let addrName = current_info[0].children[0].innerText;
			let addrPhone = current_info[0].children[1].innerText;
			
			let updateModal = document.querySelector('#addressUpdate .modal-body');
			
			let modalName = updateModal.querySelector('.input_box>input[name="name"]');
			let modalPhone = updateModal.querySelector('.input_box>input[name="phone"]');
			let modalhidden = updateModal.querySelector('input[type="hidden"]');
			
			modalhidden.value = addrNo;
			modalName.value = addrName.replace('기본 배송지', '');
			modalPhone.value = addrPhone.replace(/-/g, "");
		}
    	function addrUpdate(addrNo) {
			let current = event.currentTarget;
			let current_info = current.parentNode.parentNode.parentNode.children[0].children;
			
			let addrName = current_info[0].children[0].innerText;
			let addrPhone = current_info[1].innerText;
			
			let updateModal = document.querySelector('#addressUpdate .modal-body');
			
			let modalName = updateModal.querySelector('.input_box>input[name="name"]');
			let modalPhone = updateModal.querySelector('.input_box>input[name="phone"]');
			let modalhidden = updateModal.querySelector('input[type="hidden"]');
			
			modalhidden.value = addrNo;
			modalName.value = addrName.replace('기본 배송지', '');
			modalPhone.value = addrPhone.replace(/-/g, "");
		}
    	function addrModalCancel() {
    		let current = event.currentTarget;
    		let current_info = current.parentNode.parentNode.children[0];
    		let current_input = document.querySelectorAll('input[type="text"]');
    		
			current_input.forEach(function(item){
				item.value = "";
			});
		}

		$('#addrSave').on('click',function(){
			return validate($(this))
		});

		$('#addrUpdateBtn').on('click',function(){
			return validate($(this))
		});
    </script>
</body>
</html>