<%@ page import="java.util.ArrayList, com.smf.admin.model.vo.Notice" %>
<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
	int index =1;
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>




.layout{
   max-width: 600px;
   margin: 0 auto;
}
h2{
	margin: 0;
	padding: 50px;
	
}
.qna{
    list-style: none;
    margin: 0;
    padding: 50px;
    
}
.qna > li{
  padding: 0;
  box-sizing: border-box;
}
.qna > li:nth-child(n+2){ /* 아이템 구분 점선 */
  border-top: 1px dashed #aaa;
}
.qna input {
  display: none;
}

.qna label { /* 제목 - 클릭 영역 */
  font-weight: bold;
  color: #000;
  margin: 20px 0 0;
  cursor: pointer;
}
.qna label::before { /* 제목 앞 화살표 */
  display: block;
  content: "";
  width: 0;
  height: 0;
  border: 8px solid transparent;
  border-left: 8px solid #a00;
  margin: 2px 0 0 8px;
  float: left;
}
.qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
  border: 8px solid transparent;
  border-top: 8px solid #a00;
  border-bottom: 0;
  margin: 8px 4px 0;
}

.qna div { /* 내용 영역 - 기본 감춤 상태 */
  display: none;
  color: #666;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 30px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}
.qna input:checked + label + div { /* 내용 영역 펼침 */
  display: block;
}

.noticefaq_title{
	border-bottom: .3rem solid black;
	text-align: center;
}

.faqlistall{
	
	align: center;
	padding: 200px 300px 300px 300px;
}
</style>
</head>

<body>
	
	<body>
	<jsp:include page="/views/main/menubar_sun.jsp"></jsp:include>
	<c:if test="${loginUser.userId == 'admin@naver.com' }">
			<jsp:include page="/views/admin/adminform.jsp"></jsp:include>
			</c:if> 
	<div id="wrap">
	<div class="faqlistall">
		
		<div class="noticefaq_title">
	
		<h2>FAQ 자주묻는 질문</h2>
		</div>
		
			<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
			<div align= "right" style="width:900px;">
				
				<a href="<%= contextPath %>/faqenrollform.no" class="btn btn-success">글작성</a>
				
			</div>	
		<%} %>
	
	<%for(Notice n : list) { %>
    <ul class="qna">
        <li>
            <input type="checkbox" id="qna-<%=index%>">
            <label for="qna-<%=index++%>"><%= n.getAlertCategory()+" "+" "+" "+n.getAlertTitle() %></label>
            <div>
                <p><%= n.getAlertContent() %>   
                <% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
                                <a href="<%=contextPath %>/faqupdateForm.no?nno=<%=n.getAlertNo() %>" class="btn btn warning btn-sm">수정</a>
                                <a href="<%=contextPath %>/faqdelete.no?nno=<%=n.getAlertNo() %>" class="btn btn danger  btn-sm">삭제</a>
                <%} %>
                
                </p>
            </div>
        </li> 
    </ul>
    
    <%} %>
    
    		
		</div>    
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
    </div>
	<script>
	 const msg = "<%= alertMsg %>";
	 
	  if(msg !="null"){
		 alert(msg);
		 <% session.removeAttribute("alertMsg"); %>
	 } 
	
	</script>
	
</body>
</html>