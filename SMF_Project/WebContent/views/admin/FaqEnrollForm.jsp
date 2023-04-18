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

</style>
<body>
	<div class="outer">
			<jsp:include page="adminform.jsp"></jsp:include>
		<br>
		<h2 align="center">FAQ 작성하기</h2>
		<br>
		<form id="enroll-form" action="<%=contextPath%>/faqinsert.no" method="post">
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
				<button type="submit">등록</button>
				<button type="button" onclick="history.back();" >뒤로가기</button>				
			</div>
		</form>
	 </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


