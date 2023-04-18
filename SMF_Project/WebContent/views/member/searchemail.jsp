<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 아이디 찾기</title>
     <link rel="stylesheet" href="/SMF_Project/resources/member/css/search_email.css">
</head>


<body>
    <div class="wrap">

        <div class="container help">
            <div class="content lg">
                <div class="help_area">
                    <form action="<%=request.getContextPath()%>/searchEmail.me" method="post" id="search_email">
                        <h2 class="help_title">이메일 아이디 찾기</h2>
                        <div class="help_notice">
                            <p class="notice_txt">
                            "가입 시 등록한 휴대폰 번호를 입력하면" <br>
                            "이메일 주소를 알려드립니다."
                            </p>
                        </div>
                        <div class="input_box">
                            <h3 class="input_title">휴대폰 번호</h3>
                            <div class="input_item">
                                <input type="tel" placeholder="가입하신 휴대폰 번호" class="input_txt" maxlength="11" id="uphone" name="uphone"></input>
                            </div>
                        </div>
                        <div class="emailsearch_btn_box">
                            <input type="button" class="btn full solid disabled" id="emailsearch_btn" value="이메일 아이디 찾기" onclick="phoneCheck();"> 
                        
                        </div>
                       
					 </form>
                    
                    
                    
                    
                    
                    
                    
                    
            </div>
        </div>
    </div>
  </div>  
</body>
<script>
function phoneCheck(){
	
	var reg = /^[0-9]{11}/g;
		if(!reg.test(uphone.value)){
    	alert("올바른 전화번호 형식이 아닙니다 .");
    	uphone.focus();
    	return false;
}
	
	
	 var emailsearchSubmit = document.getElementById("search_email")
	 	 emailsearchSubmit.submit();
	
}

</script>
</html>