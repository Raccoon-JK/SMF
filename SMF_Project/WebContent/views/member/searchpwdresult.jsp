<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	String pwd = (String) session.getAttribute("pwd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 주소 찾기에 성공하</title>
   <link rel="stylesheet" href="/SMF_Project/resources/member/css/search_pwd_result.css">
</head>

<body>
    <div class="wrap">
        <div class="container help">
            <div class="content lg">
                <div class="help_area">
                    <div>
                        <h2 class="help_title success">
                            <span> 비밀번호 찾기에 </span>
                            <span> 성공하였습니다</span>
                        </h2>
                        <div class="success_notice">
                            <dl>
                             <h2 class="notice_title">  입니다.</h2>
                             <dd class="notice_txt"> </dd>
                            </dl>
                        </div>
                        <div class="success_btn_box">
                            <a href="<%=request.getContextPath()%>/login.page"  class="btn outline large" type="button">로그인</a>
                        </div>

                        
                        
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
<script>
const str = '<%= pwd %>';
const maskedStr = str.slice(0, -4) + str.slice(-4).replace(/./g, '*');
console.log(maskedStr); // '1q2w3e****'

var el = document.querySelector(".notice_title");
el.innerText = maskedStr + "  입니다.";



</script>
</html>