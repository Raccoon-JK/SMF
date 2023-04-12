<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<div id="mypage_menu">
    <a href="<%=contextPath%>/mypagemain.me" id="mypage_mainBtn">마이 페이지</a>
    <ul>
        <span>내 정보</span>
        <li><a href="<%=contextPath%>/mypageinfo.me">프로필 정보</a></li>
        <li><a href="<%=contextPath%>/address.me">주소록</a></li>
        <li><a>스타일</a></li>
        <li><a>포인트</a></li>
        <li><a href="<%=contextPath%>/mypageaccountscard.me">계좌 및 카드 관리</a></li>
        <li><a>신고 내역</a></li>
    </ul>
    <ul>
        <span>쇼핑정보</span>
        <li><a href="<%=contextPath%>/mypagbuyhistory.me">구매 내역</a></li>
        <li><a href="<%=contextPath%>/mypagsalehistory.me">판매 내역</a></li>
        <li><a href="<%=contextPath%>/mypagewishlist.me">관심 상품 / 장바구니</a></li>
    </ul>
</div>