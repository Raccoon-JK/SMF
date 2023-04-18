<%@ page import="java.util.ArrayList, com.smf.admin.model.vo.Notice" %>
<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");

%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.list-area{
	border: 1px solid white;
	text-align:center;
	}
	
	.list-area>tbody>tr:hover{
		background: gray;
		cursor:pointer;
	}
</style>
</head>

<body>
	
	<div class="outer">
	<jsp:include page="adminform.jsp"></jsp:include>
		<h2 align="center"> 공지사항 리스트</h2>
		
		
		<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
			<div align= "right" style="width:800px;">
			
				<a href="<%= contextPath %>/enrollform.no" class="btn btn-secondary">글작성</a>
				
			</div>	
		<%} %>
		<table border ="1" class="list-area" align="center" >
			<thead>
				<tr>
					<th>글번호 </th>
					<th width="100">글 카테고리</th>
					<th width="400">글 제목</th>
					<th width="100">작성일 </th>
					
					
					
				</tr>
			</thead>
			<tbody>
				<%if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">공지사항이 없습니다..</td>
					</tr>
				
				<%} else { %>
				<% for(Notice n : list) { %>
					<tr onclick="moveNotice(<%=n.getAlertNo()%>)">
						<td><%= n.getAlertNo() %></td>
						<td><%= n.getAlertCategory() %> </td>
						<td><%= n.getAlertTitle() %> </td>
						<td><%= n.getCreateDate() %> </td>
					</tr>
				<% } %>
			<% } %>
			</tbody>
		</table>
	</div>
	<script>
	function moveNotice(nno){
		

		<%-- location.href = "<%= contextPath %>/detail.no?nno="+nno; --%>
	}
		$(function(){
			
		$(".list-area>tbody>tr").click(function(){
			
			
			let nno = $(this).children().eq(0).text();
			
			location.href = "<%= contextPath%>/detail.no?nno="+nno;
			
		});
	})
	</script>
	
</body>
</html>