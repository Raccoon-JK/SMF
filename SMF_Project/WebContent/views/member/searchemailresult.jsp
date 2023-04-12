<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	String email = (String) session.getAttribute("email");
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <div class="wrap">
        <div class="container help">
            <div class="content lg">
                <div class="help_area">
                    <div>
                        <h2 class="help_title success">
                            <span> 이메일 주소 찾기에 </span>
                            <span> 성공하였습니다</span>
                        </h2>
                        <div class="success_notice">
                            <dl>
                             <dt class="notice_title"> <%= email.email() %> 입니다.</dt>
                             <dd class="notice_txt"> </dd>
                            </dl>
                        </div>
                        <div class="success_btn_box">
                            <a href="/login/findpassword" class="btn outline large" type="button">비밀번호 찾기</a>
                            <a href="/login" class="btn outline large" type="button">로그인</a>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>