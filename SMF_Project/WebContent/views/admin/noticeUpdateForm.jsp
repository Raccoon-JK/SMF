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
	
	.noticeupdate_all{
		padding: 200px 300px 100px 300px;
	}
	
	.notice_title{
		border-bottom: .3rem solid black;
		
	}
	.noticeupdatesub{
		padding-top : 40px;
	}

</style>
</head>
<body>
	
	<div class="outer">
	<jsp:include page="/views/common/menubar_sun.jsp"></jsp:include>
	<jsp:include page="adminform.jsp"></jsp:include>
		<div class="noticeupdate_all">
		<div class="notice_title">
		<h2 align="center">공지사항 수정</h2>
		</div>
		<div class="noticeupdatesub">
		<form id="update-form" action="<%= contextPath %>/update.no" method="post">
			<input type="hidden" name="nno" value="<%= n.getAlertNo() %>">
			<table align="center">
				<tr>
					<th width="100">카테고리</th>
					<td width="350"><input type="text" name="category" required></td>
				</tr>
				
				<tr>	
					<th width="50">제목</th>
					<td width="350"><input type="text" name="title" required></td>
				</tr>
				
				
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea name="content" rows="10" style="resize:none" required></textarea>					
					</td>
				</tr>
				
			</table>
			<br><br>
			<div align="center">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-warning" onclick="history.back();" >뒤로가기</button>				
			</div>
		</form>
		</div>
		 
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