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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.notice_all{
	padding: 200px 300px 300px 300px;	
	}
	.notice_title{
		 border-bottom: .3rem solid black;
	
	}

	.list-area{
	border: 1px solid white;
	text-align:center;
	}
	
	.list-area>tbody>tr:hover{
		background: gray;
		cursor:pointer;
	}
	.list-area{
	 border-bottom: 5px solid #FFC107;
	 }
	 
	 .noticetable{
	 	padding : 10px 0px;
	 }
	 
	 th{
	 color:#fff;
	 background-color : #FFC107;
	 }
	 
	 
</style>
</head>

<body>
	
	<div class="outer">
	
	<jsp:include page="/views/main/menubar_sun.jsp"></jsp:include>
			<c:if test="${loginUser.userId == 'admin@naver.com' }">
			<jsp:include page="/views/admin/adminform.jsp"></jsp:include>
			</c:if> 
			

				
		<div class="notice_all">
	<div class= "notice_title">
		<h2 align="center"> 공지사항 리스트</h2>
	</div>
		
		<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
			<div align= "right">
			
				<a href="<%= contextPath %>/enrollform.no" class="btn btn-success">글작성</a>
				
			</div>	
		<%} %>
		
		<div class="noticetable">
		<table border ="3" class="list-area" align="center" >
			<thead>
				<tr>
					<th height="30" width="50" style="display: none;"> 번호</th>
					<th width="130" height="30"> 카테고리</th>
					<th width="500"> 제목</th>
					<th width="130">작성일 </th>
					
					
					
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
						<td height="40" style="display: none;"><%=n.getAlertNo()%></td>
						<td height="40"><%= n.getAlertCategory() %> </td>
						<td><%= n.getAlertTitle() %> </td>
						<td><%= n.getCreateDate() %> </td>
					</tr>
				<% } %>
			<% } %>
			</tbody>
		</table>
		</div>
		</div>
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
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