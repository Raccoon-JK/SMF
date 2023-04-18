<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/SMF_Project/resources/member/css/search_pwd.css">
</head>

<body>
    <div class="wrap">
		<jsp:include page="/views/common/menubar.jsp"></jsp:include>
        <div class="container help">
            <div class="content lg">
                <div class="help_area">
                	<form action="<%=request.getContextPath()%>/searchPwd.me" method="post" id="search_pwd">
                    
                        <h2 class="help_title">비밀번호 찾기</h2>
                        <div class="help_notice">
                            <p class="notice_txt">
                            가입 시 등록한 휴대폰 번호와 이메일을 입력하시면 <br>
                            비밀번호의 일부를 알려드립니다.
                            </p>
                        </div>
                        <div class="input_box">
                            <h3 class="input_title">휴대폰 번호</h3>
                            <div class="input_item">
                                <input type="tel" placeholder="가입하신 휴대폰 번호" class="input_txt" maxlength="11" name="uphone" id="uphone">
                            </div>
                        </div>

                        <div class="input_box">
                            <h3 class="input_title">이메일 </h3>
                            <div class="input_item">
                                <input type="email" placeholder="예)kream@kream.co.kr" class="input_txt" name="email" id="userId" >
                            </div>
                        </div>
                        <div class="help_btn_box">
                            <input type="button"  class="btn full solid disabled" id="emailsearch_btn" value="비밀번호 찾기" onclick="phoneEmailCheck();"> 
                        </div>

					</form>
                        
            
                       

                    
                    
                    
                    
                    
                    
                    
                    
            </div>
        </div>
    </div>
       <jsp:include page="/views/common/footer.jsp"></jsp:include>
  </div>  
    
</body>
<script>
function phoneEmailCheck(){
	
	var phoneCheck = /^[0~9]{11}/g;
		if(!phoneCheck.test(uphone.value)){
			alert("올바른 전화번호 형식이 아닙니다. ");
			uphone.focus();
			return false;
		}
	
	var emailCheck = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$/g;
         
         if(!emailCheck.test(userId.value)){
             alert("올바른 이메일 형식이 아닙니다. ");
             userId.focus();
             return false;
        }
         
 	
	var pwdsearchSubmit = document.getElementById("search_pwd")
		pwdsearchSubmit.submit();

}
	

	
	
</script>
</html>