<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"
	import="java.util.ArrayList"    
%>
<%
	String contextPath = request.getContextPath();
	
	ArrayList<String> email = (ArrayList<String>)session.getAttribute("email");
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
       <link rel="stylesheet" href="/SMF_Project/resources/member/css/search_email_result.css">
</head>
<body>
    <div class="wrap">
 <jsp:include page="/views/main/menubar_sun.jsp"></jsp:include>
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
                             <h2 class="notice_title">
                             	<% for(String a : email){%>
                             	 <%=  a %> <br>
                             	<%} %> 입니다.
                             </h2>
                             <dd class="notice_txt"> </dd>
                            </dl>
                        </div>
                        <div class="success_btn_box">
                            <a href="<%=request.getContextPath()%>/searchpwd.page" class="btn outline large" type="button">비밀번호 찾기</a>
                            <a href="<%=request.getContextPath()%>/login.page" class="btn outline large" type="button">로그인</a>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
         <jsp:include page="/views/common/footer.jsp"></jsp:include>
    </div>
    
</body>
</html>