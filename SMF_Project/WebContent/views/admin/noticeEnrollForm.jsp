<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smf.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#enroll-form input, #enroll-form textarea{
		width : 100%;
		box-sizing : border-box;
	}

.noticeenroll_all{
		padding: 200px 300px 300px 300px;	
}

.notice_title{
		 border-bottom: .3rem solid black;
	
	}
.noticeenrollsub{
	padding-top : 40px;
}
</style>
<body>
	<div class="outer">
			<jsp:include page="/views/main/menubar_sun.jsp"></jsp:include>
			<jsp:include page="adminform.jsp"></jsp:include>
		<div class="noticeenroll_all">
			<div class="notice_title">
		<h2 align="center">공지사항 작성하기</h2>
			</div>
		
		<div class="noticeenrollsub">
		<form id="enroll-form" action="<%=contextPath%>/insert.no" method="post">
			
			
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
				<button type="submit" class="btn btn-primary ">등록</button>
				<button type="button" class="btn btn-warning " onclick="history.back();" >뒤로가기</button>				
			</div>
		
		</form>
		</div>
		</div>
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
	 </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


