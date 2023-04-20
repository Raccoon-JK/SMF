<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
.wrapadmin {
   box-sizing: border-box;
    border: 5px solid #ebebeb;
 }
 .left-side-bar{
  box-sizing: border-box;
    border: 5px solid #ebebeb;
 }

.status-ico{
	box-sizing: border-box;
    border: 5px solid #ebebeb;
}
a {
    color: black;
    text-decoration: none;
    border-bottom: .2rem solid #ebebeb;
}

.left-side-bar > ul ul {
    display: none;
    position: absolute;
    top: 0;
    left: 100%;
    background-color:white;
}


.left-side-bar {
    background-color: white;
    height: 100%;
    width: 180px;
    position: fixed;
    left: -155px;
    transition: left .3s;
    z-index: 1550;
}

.left-side-bar > .status-ico {
    text-align: right;
    padding: 10px;
}

.left-side-bar > ul li {
    position: relative;
}

.left-side-bar ul {
    font-weight: bold;
    text-align: center;
    padding: 0;
}

.left-side-bar ul > li > a {
    display: block;
    padding: 10px 60px;
    white-space: nowrap;
}

.left-side-bar:hover {
    left: 0;
}

.left-side-bar ul > li:hover ul {
    display: block;
  
}

.left-side-bar ul > li:hover > a {
    color: white;
    background-color: black;
}

.left-side-bar > .status-ico > span:last-child {
    display: none;
}

.left-side-bar:hover > .status-ico > span:last-child {
    display: block;
}

.left-side-bar:hover > .status-ico > span:first-child {
    display: none;
}
</style>
<body>

    <div class="left-side-bar">
        <div class="status-ico">
            <span>▶</span>
            <span>▼</span>
        </div>

        <ul class="wrapadmin">
            <li>
                <a href="#">회원관리</a>
                <ul>
                    <li><a href="#">신고접수</a></li>
                    <li><a href="<%=contextPath %>/member.list">회원정보 조회</a></li>
                    <li><a href="<%=contextPath %>/blacklist.no">블랙리스트 관리</a></li>
                </ul>
            </li>
            <li>
                <a href="#">공지사항</a>
                <ul>
                    <li><a href="<%=contextPath%>/list.no">공지사항</a></li>
                </ul>
            </li>
            <li>
                <a href="#">결제관리</a>
                <ul>
                    <li><a href="#">주문관리</a></li>
                </ul>
            </li>
            <li>
                <a href="#">고객문의</a>
                <ul>
                    <li><a href="<%=contextPath%>/Faqlist.no">FAQ관리</a></li>
                    <li><a href="<%=contextPath%>/suggestlist.no">판매제안서 목록</a></li>
                </ul>
            </li>
            
        </ul>
        
    </div>


        
    
    
</body>
</html>