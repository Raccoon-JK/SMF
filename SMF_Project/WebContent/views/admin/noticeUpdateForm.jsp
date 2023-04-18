<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smf.admin.model.vo.Notice" %>
<%
	String contextPath = request.getContextPath();


	Notice n = (Notice) request.getAttribute("n");
	
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#update-form>table{border : 1px solid white;}
	#update-form input, #update-form textarea{
		width : 100%;
		box-sizing : border-box;
	}
</style>
</head>
<body>
	
	<div class="outer">
	<jsp:include page="adminform.jsp"></jsp:include>
		<br>
		<h2 align="center">공지사항 수정</h2>
		<br>
		
		<form id="update-form" action="<%= contextPath %>/update.no" method="post">
			<input type="hidden" name="nno" value="<%= n.getAlertNo() %>">
			<table align="center">
				<tr>
					<th width="50">카테고리</th>
					<td width="350"><input type="text" name="category" required><%=n.getAlertCategory() %></td>
					
					<th width="50">제목</th>
					<td width="350"><input type="text" name="title" required><%=n.getAlertTitle() %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<textarea name="content" rows="10" style="resize:none" required><%= n.getAlertContent() %></textarea>
					</td>
				</tr>
			</table>
			<br><br>
			<div align="center">
				<button type="submit">수정하기</button>
				<button type="button" onclick="history.back();" >뒤로가기</button>				
			</div>
		</form>
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