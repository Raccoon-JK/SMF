<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
div {
    box-sizing: border-box;
    border: 1px solid red; 
 }



 body, ul{
    padding: 0;
    margin: 0;
    list-style: none;
}
li{
    padding :0;
    margin: 0;

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

body {
    height: 10000px;
}

.left-side-bar {
    background-color: white;
    height: 100%;
    width: 180px;
    position: fixed;
    left: -155px;
    transition: left .3s;
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
    padding: 10px;
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

        <ul>
            <li>
                <a href="#">회원관리</a>
                <ul>
                    <li><a href="#">신고접수</a></li>
                    <li><a href="#">회원정보 조회</a></li>
                    <li><a href="#">블랙리스트 관리</a></li>
                </ul>
            </li>
            <li>
                <a href="#">공지사항</a>
                <ul>
                    <li><a href="#">공지사항 등록</a></li>
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
                    <li><a href="#">실시간문의 (채팅)</a></li>
                    <li><a href="#">FAQ관리</a></li>
                    <li><a href="#">판매제안서 목록</a></li>
                </ul>
            </li>
            
        </ul>
    </div>
    

        
    
    
</body>
</html>