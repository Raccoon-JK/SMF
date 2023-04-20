<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/SMF_Project/resources/member/css/login.css">
</head>
<body>
    <div class="wrap">
    <jsp:include page="/views/main/menubar_sun.jsp"></jsp:include>
        <div class="container login">
            <div class="content lg">
                <div class="login_area">
                    <h2 class="login_title">로고</h2>
                
                    <form action="<%=request.getContextPath()%>/login.me" method="post" id="login_form">
                            
                        <div class="has_button input_box" id="email_input_box">
                            <h3 class="input_title">이메일 주소</h3>
                            <div class="input_item">
                                <input type="text" placeholder="예) SaveMeFashion@SMF.co.kr" class="input_txt" id="email_input" name="email" >
                            </div>
                            <p class="input_error" id="email_input_error"></p>
                        </div>
                        <div class="input_box has_button" id="password_input_box">
                            <h3 class="input_title">비밀번호</h3>
                            <div class="input_item">
                                <input type="password" class="input_txt" id="password_input" name="userpw" >
                            </div>
                            <p class="input_error" id="password_input_error">영어, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)  </p>
                        </div>
                        <div class="login_btn_box">
                            <input type="button"  class="btn full solid disabled" id="login_btn" onclick="loginCheck();" value="로그인"></input>
                            
                            
                        </div>
                    </form>
                    <ul class="look_box">
                        <li class="look_list"><a href="<%=request.getContextPath() %>/enroll.me" class="look_link"> 이메일 가입 </a></li>
                        <li class="look_list"><a href="<%=request.getContextPath() %>/searchemail.page" class="look_link"> 이메일 찾기 </a></li>
                        <li class="look_list"><a href="<%=request.getContextPath() %>/searchpwd.page" class="look_link"> 비밀번호 찾기 </a></li>
                    </ul>
                </div>
             </div>
        </div>
        <jsp:include page="/views/common/footer.jsp"></jsp:include>
    </div>
</body>
<script>
 const msg = "<%= alertMsg %>";
 
  if(msg !="null"){
	 alert(msg);
	 <% session.removeAttribute("alertMsg"); %>
 } 
 
 function loginCheck(){
 

 if (email_input.value == "") {
     alert("이메일을 입력하세요");
     email_input.focus();
     return false;
 };

 
 if(password_input.value== ""){
	 alert("비밀번호를 입력하세요");
     password_input.focus();
     return false;
 }
 var loginSubmit = document.getElementById("login_form")
 loginSubmit.submit();
}
 
 
</script>
</html>