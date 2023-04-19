<%@ page import="java.util.ArrayList, com.smf.admin.model.vo.Notice" %>
<%@ page import="com.smf.shop.model.vo.Stock" %>
<%@ page import="com.smf.member.model.vo.Member" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Stock> list = (ArrayList<Stock>) request.getAttribute("list");

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
		<h2 align="center"> 판매 제안서 목록</h2>
		
		
		<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
			<div align= "right" style="width:800px;">
			
				
			</div>	
		<%} %>
		<table border ="1" class="list-area" align="center" >
			<thead>
				<tr>
					<th>글번호 </th>
					<th width="120">판매제안서 목록 </th>
					<th width="400">판매제안서 상품이름</th>
					<th width="100">작성자 </th>
					<th width="100">날짜 </th>
					<th width="100">처리 상태 </th>
					
					
					
				</tr>
			</thead>
			<tbody>
				<%if(list.isEmpty()) { %>
					<tr>
						<td colspan="5">판매제안서가 없습니다</td>
					</tr>
				
				<%} else { %>
				<% for(Stock s : list) { %>
					<tr onclick="moveNotice(<%=s.getStockNo()%>)">
						<td><%= s.getStockNo() %> </td>
						<td> 판매제안서 목록 </td>
						<td><%= s.getProductName() %> </td>
						<td><%= s.getUserId() %> </td>
						<td><%= s.getSuggestDate() %> </td>
						<td><% if(s.getStatus().equals("0")) { %>
						판매대기
						<% }else {%>
						판매중<%} %>
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
			
			location.href = "<%= contextPath%>/suggestdetail.no?nno="+nno;
			
		});
	})
	</script>
	
</body>
</html>