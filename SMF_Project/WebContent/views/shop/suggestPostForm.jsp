<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String) session.getAttribute("alertMsg");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>  
<link rel="stylesheet" href="<%= contextPath %>/resources/shop/css/suggest-styles.css" type="text/css">      
</head>
<body>
	<script>
		const msg = "<%=alertMsg%>";
		
		if(msg != "null"){ // 성공적으로 로그인이 되었습니다 / null
			alert(msg);
			// 알람창을 띄워준 후 session에 담긴 메세지는 지워줘야함
			// 안 그러면 menubar.jsp가 로딩될때마다 매번 alert함수가 실행됨
			<%session.removeAttribute("alertMsg");%>
		}
		
	</script>
	<div id="navibar">
	    <jsp:include page="/views/main/menubar_shop.jsp" />
    </div>
	<form action="<%= contextPath %>/suggest.sh" method="POST" id="productPostForm">
            <div id="itemDetail">
                <h2 style="text-align: center;">상품 제안서</h2>
                <table>
                    <tr>
                        <td>브랜드 명</td>
                        <td><input type="text" placeholder="브랜드 명 입력" name="brandName" value="${ bName }"></td>
                    </tr>
                    <tr>
                        <td>제품 명</td>
                        <td><input type="text" placeholder="제품 명 입력" name="productName" value="${ pName }"></td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" placeholder="희망가격 입력" name="price"></td>
                    </tr>
                    <tr>
                        <td>사이즈</td>
                        <td>
                            <select name="size" id="">
                                <option value="Free">Free</option>
                                <option value="XXS">XXS</option>
                                <option value="XS">XS</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                                <option value="XXL">XXL</option>
                                <option value="XXXL">XXXL</option>
                                <option value="215">215</option>
                                <option value="220">220</option>
                                <option value="225">225</option>
                                <option value="230">230</option>
                                <option value="235">235</option>
                                <option value="240">240</option>
                                <option value="245">245</option>
                                <option value="250">250</option>
                                <option value="255">255</option>
                                <option value="260">260</option>
                                <option value="265">265</option>
                                <option value="270">270</option>
                                <option value="275">275</option>
                                <option value="280">280</option>
                                <option value="285">285</option>
                                <option value="290">290</option>
                                <option value="295">295</option>
                                <option value="300">300</option>
                                <option value="305">305</option>
                                <option value="310">310</option>
                                <option value="315">315</option>
                                <option value="320">320</option>
                                <option value="325">325</option>
                                <option value="330">330</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                <option value="32">32</option>
                                <option value="33">33</option>
                                <option value="34">34</option>
                                <option value="35">35</option>
                                <option value="36">36</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td>
                            <input type="text" name="count" placeholder="총 수량 입력">
                        </td>
                    </tr>
                </table>
                <div style="width: 100px; margin: auto;">
                    <button type=submit id="submit">확인</button>
                    <button type="reset">취소</button>
                </div>
            </div>
        </form>
        
        <script>
        
        </script>
</body>
</html>