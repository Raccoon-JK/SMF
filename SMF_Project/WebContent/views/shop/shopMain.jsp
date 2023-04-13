<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://unpkg.com/infinite-scroll@4/dist/infinite-scroll.pkgd.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="<%= contextPath %>/resources/shop/css/shop-styles.css" type="text/css">
</head>
<style>
    #navibar{
        height: 86px;
    }
    *,
    :after,
    :before {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-tap-highlight-color: transparent;
    }
    li{
        list-style: none;
    }
    ul{
        margin: 0;
    }
    a{
        text-decoration: none;
    }
    .tab{
        display: flex;
        align-items: center;
        height: 44px;
        padding-top: 2px;
        font-size: 16px;
        color: #222;
        cursor: pointer;
        border-bottom: 2px solid #222;
        font-weight: 700;
    }
</style>

<body>
    <div id="navibar"></div>
<%--     <jsp:include page="/views/main/menubar_shop.jsp" /> --%>
    <div>
        <div id="searchbox">
            <div id="search">
                <input id="searchMain" type="text" placeholder="브랜드, 모델명, 모델번호 등" onfocus="this.placeholder = ''" onblur="this.placeholder = '브랜드, 모델명, 모델번호 등'">
                <img src="<%= contextPath %>/resources/shop/symbols/x.png" id="deleteBtn">
            </div>
        </div>
        <div id="category">
            <ul id="categoryUl">
                <li class="categoryLi">전체</li>
                <li class="categoryLi">럭셔리</li>
                <li class="categoryLi">신발</li>
                <li class="categoryLi">아우터</li>
                <li class="categoryLi">상의</li>
                <li class="categoryLi">하의</li>
                <li class="categoryLi">가방</li>
                <li class="categoryLi">지갑</li>
                <li class="categoryLi">시계</li>
                <li class="categoryLi">패션잡화</li>
            </ul>
            <div>
                <ul id="weatherCategory">
                    <li>
                        <img src="<%= contextPath %>/resources/shop/symbols/맑음.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="<%= contextPath %>/resources/shop/symbols/흐림.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="<%= contextPath %>/resources/shop/symbols/비.png" alt="" class="weather">
                    </li>
                    <li>
                        <img src="<%= contextPath %>/resources/shop/symbols/눈.png" alt="" class="weather">
                    </li>
                    <li class="temper">
                        <img src="<%= contextPath %>/resources/shop/symbols/기온.png" alt="" class="weather">
                        <div class="temperature">현재 기온</div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="body">
            <aside id="mainFilter">
                <div id="filter">
                    <div class="aside1">
                        <div>
                            <span>필터</span>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">카테고리</span>
                                <span class="subTitle" id="subTitle1">모든 카테고리</span>
                            </div>
                            <div class="titleBtn">
                                <img src="<%= contextPath %>/resources/shop/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="<%= contextPath %>/resources/shop/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                              		<div class="filterCheckDiv">
                              			<input type="checkbox" id="shoe" value="신발"><label for="shoe" class="filterText filterMain">신발</label><br>
                               		</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="sneakers" value="스니커즈"><label for="sneakers" class="filterText">스니커즈</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="flat" value="플랫"><label for="flat" class="filterText">플랫</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="loafer" value="로퍼"><label for="loafer" class="filterText">로퍼</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="derby/laceup" value="더비/레이스업"><label for="derby/laceup" class="filterText">더비/레이스업</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="sandal/slipper" value="샌들/슬리퍼"><label for="sandal/slipper" class="filterText">샌들/슬리퍼</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="heel/pumps" value="힐/펌프스"><label for="heel/pumps" class="filterText">힐/펌프스</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="boots" value="부츠"><label for="boots" class="filterText">부츠</label><br></li>
                                        <li class="menu menu2"><input type="checkbox" name="shoe" id="otherShoe" value="기타 신발"><label for="otherShoe" class="filterText">기타 신발</label><br></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
	                                    <input type="checkbox" id="outer" value="아우터"><label for="outer" class="filterText filterMain">아우터</label><br>
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="outer" id="jacket" value="자켓"><label for="jacket" class="filterText">자켓</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="outer" id="coat" value="코트"><label for="coat" class="filterText">코트</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="outer" id="anorak" value="아노락"><label for="anorak" class="filterText">아노락</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="outer" id="padding" value="패딩"><label for="padding" class="filterText">패딩</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="outer" id="otherOuter" value="기타 아우터"><label for="otherOuter" class="filterText">기타 아우터</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
	                                    <input type="checkbox" id="top" value="상의"><label for="top" class="filterText filterMain">상의</label><br>
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="top" id="cardigan" value="가디건"><label for="cardigan" class="filterText">가디건</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="longSleeve" value="긴팔 티셔츠"><label for="longSleeve" class="filterText">긴팔 티셔츠</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="shortSleeve" value="반팔 티셔츠"><label for="shortSleeve" class="filterText">반팔 티셔츠</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="shirt" value="셔츠"><label for="shirt" class="filterText">셔츠</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="hood" value="후드"><label for="hood" class="filterText">후드</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="hoodZipUp" value="후드집업"><label for="hoodZipUp" class="filterText">후드집업</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="sweatShirt" value="스웨트셔츠"><label for="sweatShirt" class="filterText">스웨트셔츠</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="sleeveLess" value="슬리브리스"><label for="sleeveLess" class="filterText">슬리브리스</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="onepiece" value="원피스"><label for="onepiece" class="filterText">원피스</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="knit" value="니트"><label for="knit" class="filterText">니트</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="top" id="otherTop" value="기타 상의"><label for="otherTop" class="filterText">기타 상의</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
                                    	<input type="checkbox" id="bottom" value="하의"><label for="bottom" class="filterText filterMain">하의</label><br>                                	
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="bottom" id="pants" value="바지"><label for="pants" class="filterText">바지</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bottom" id="shorts" value="반바지"><label for="shorts" class="filterText">반바지</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bottom" id="skirt" value="스커트"><label for="skirt" class="filterText">스커트</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bottom" id="leggings" value="레깅스"><label for="leggings" class="filterText">레깅스</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bottom" id="otherBottom" value="기타 하의"><label for="otherBottom" class="filterText">기타 하의</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
                                    	<input type="checkbox" id="bag" value="가방"><label for="bag" class="filterText filterMain">가방</label><br>                                	
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="premiumBag" value="프리미엄가방"><label for="premiumBag" class="filterText">프리미엄가방</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="miniBag" value="미니백"><label for="miniBag" class="filterText">미니백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="backpack" value="백팩"><label for="backpack" class="filterText">백팩</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="shoulderBag" value="숄더백"><label for="shoulderBag" class="filterText">숄더백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="toteBag" value="토트백"><label for="toteBag" class="filterText">토트백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="crossBag" value="크로스백"><label for="crossBag" class="filterText">크로스백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="clutch" value="클러치"><label for="clutch" class="filterText">클러치</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="duffelBag" value="더플백"><label for="duffelBag" class="filterText">더플백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="ecoBag" value="에코백"><label for="ecoBag" class="filterText">에코백</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="carrier" value="캐리어"><label for="carrier" class="filterText">캐리어</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="bag" id="otherBag" value="기타 가방"><label for="otherBag" class="filterText">기타 가방</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
                                    	<input type="checkbox" id="wallet" value="지갑"><label for="wallet" class="filterText filterMain">지갑</label><br>                                	
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="wallet" id="halfWallet" value="반지갑"><label for="halfWallet" class="filterText">반지갑</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="wallet" id="longWallet" value="장지갑"><label for="longWallet" class="filterText">장지갑</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="wallet" id="cardWallet" value="카드 지갑"><label for="cardWallet" class="filterText">카드 지갑</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="wallet" id="chainWallet" value="체인 지갑"><label for="chainWallet" class="filterText">체인 지갑</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="wallet" id="otherWallet" value="기타 지갑"><label for="otherWallet" class="filterText">기타 지갑</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                	<div class="filterCheckDiv">
	                                    <input type="checkbox" id="watch" value="시계"><label for="watch" class="filterText filterMain">시계</label><br>
                                	</div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="watch" id="premiumWatch" value="프리미엄시계"><label for="premiumWatch" class="filterText">프리미엄시계</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="watch" id="electronicWatch" value="전자 시계"><label for="electronicWatch" class="filterText">전자 시계</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="watch" id="leatherWatch" value="가죽 시계"><label for="leatherWatch" class="filterText">가죽 시계</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="watch" id="metalWatch" value="메탈 시계"><label for="metalWatch" class="filterText">메탈 시계</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="watch" id="otherWatch" value="기타 시계"><label for="otherWatch" class="filterText">기타 시계</label></input></li>
                                    </ul>
                                </li>
                                <li class="menu">
                                    <div class="filterCheckDiv">
                                        <input type="checkbox" id="accessory" value="패션잡화"><label for="accessory" class="filterText filterMain">패션잡화</label>                                	
                                    </div>
                                    <ul class="filterCheckUl filterDetail">
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="earring" value="귀걸이"><label for="earring" class="filterText">귀걸이</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="necklace" value="목걸이"><label for="necklace" class="filterText">목걸이</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="bracelet" value="팔찌"><label for="bracelet" class="filterText">팔찌</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="ring" value="반지"><label for="ring" class="filterText">반지</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="otherJewelry" value="기타 주얼리"><label for="otherJewelry" class="filterText">기타 주얼리</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="beanie" value="비니"><label for="beanie" class="filterText">비니</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="bucketHat" value="버킷햇"><label for="bucketHat" class="filterText">버킷햇</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="ballcap" value="볼캡"><label for="ballcap" class="filterText">볼캡</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="otherCap" value="기타 모자"><label for="otherCap" class="filterText">기타 모자</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="belt" value="벨트"><label for="belt" class="filterText">벨트</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="eyewear" value="아이웨어"><label for="eyewear" class="filterText">아이웨어</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="muffler" value="머플러"><label for="muffler" class="filterText">머플러</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="scarf" value="스카프"><label for="scarf" class="filterText">스카프</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="keyring" value="키링"><label for="keyring" class="filterText">키링</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="tie" value="넥타이"><label for="tie" class="filterText">넥타이</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="glove" value="장갑"><label for="glove" class="filterText">장갑</label></input></li>
                                        <li class="menu menu2"><input type="checkbox" name="accessory" id="otherAccessory" value="기타 패션잡화"><label for="otherAccessory" class="filterText">기타 패션잡화</label></input></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- $('.titleFilter').each(function(index, e) {
                        $(e).click(function() {
                            $(this).children().children('.titleBtn').children('.filterPlus').css('display', 'none');
                            $(this).next().css('display','block');
                            $(this).parent().parent().find('.subTitle').css('display','none');
                            $(this).parent().parent().parent().find('.filterCheck').css('display','block');
                        });
                    }); -->
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">성별</span>
                                <span class="subTitle" id="subTitle2">모든 성별</span>
                            </div>
                            <div class="titleBtn">
                                <img src="<%= contextPath %>/resources/shop/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="<%= contextPath %>/resources/shop/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck2" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <input type="checkbox" value="남성"><label for="" class="filterText">남성</label><br>
                                </li>
                                <li class="menu">
                                    <input type="checkbox" value="여성"><label for="" class="filterText">여성</label><br>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">브랜드</span>
                                <span class="subTitle" id="subTitle1">모든 브랜드</span>
                            </div>
                            <div class="titleBtn">
                                <img src="<%= contextPath %>/resources/shop/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="<%= contextPath %>/resources/shop/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <input type="checkbox" value=""><label for="" class="filterText"></label><br><!-- 브랜드 종류 -->
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">사이즈</span>
                                <span class="subTitle" id="subTitle1">모든 사이즈</span>
                            </div>
                            <div class="titleBtn">
                                <img src="<%= contextPath %>/resources/shop/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="<%= contextPath %>/resources/shop/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">                    
                                <li class="menu">
                                    <p class="filterText" style="margin-top: 0px;">신발</p>
                                    <div>
                                        <div id="columnMenu">
                                            <a href="" class="columnMenu">215</a>
                                            <a href="" class="columnMenu">220</a>
                                            <a href="" class="columnMenu">225</a>
                                            <a href="" class="columnMenu">230</a>
                                            <a href="" class="columnMenu">235</a>
                                            <a href="" class="columnMenu">240</a>
                                            <a href="" class="columnMenu">245</a>
                                            <a href="" class="columnMenu">250</a>
                                            <a href="" class="columnMenu">255</a>
                                            <a href="" class="columnMenu">260</a>
                                            <a href="" class="columnMenu">265</a>
                                            <a href="" class="columnMenu">270</a>
                                            <a href="" class="columnMenu">275</a>
                                            <a href="" class="columnMenu">280</a>
                                            <a href="" class="columnMenu">285</a>
                                            <a href="" class="columnMenu">290</a>
                                            <a href="" class="columnMenu">295</a>
                                            <a href="" class="columnMenu">300</a>
                                            <a href="" class="columnMenu">305</a>
                                            <a href="" class="columnMenu">310</a>
                                            <a href="" class="columnMenu">315</a>
                                            <a href="" class="columnMenu">320</a>
                                            <a href="" class="columnMenu">325</a>
                                            <a href="" class="columnMenu">330</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="menu">
                                    <p class="filterText">의류</p>
                                    <div class="clothMenu">
                                        <div id="columnMenu">
                                            <a href="" class="columnMenu freeCloth">Free</a>
                                        </div>
                                    </div>
                                    <div class="clothMenu">
                                        <div id="columnMenu" class="">
                                            <a href="" class="columnMenu clothSize">XXS</a>
                                            <a href="" class="columnMenu clothSize">XS</a>
                                            <a href="" class="columnMenu clothSize">S</a>
                                            <a href="" class="columnMenu clothSize">M</a>
                                            <a href="" class="columnMenu clothSize">L</a>
                                            <a href="" class="columnMenu clothSize">XL</a>
                                            <a href="" class="columnMenu clothSize">XXL</a>
                                            <a href="" class="columnMenu clothSize">XXXL</a>
                                        </div>
                                    </div>
                                    <div class="clothMenu">
                                        <div id="columnMenu">
                                            <a href="" class="columnMenu">28</a>
                                            <a href="" class="columnMenu">29</a>
                                            <a href="" class="columnMenu">30</a>
                                            <a href="" class="columnMenu">31</a>
                                            <a href="" class="columnMenu">32</a>
                                            <a href="" class="columnMenu">33</a>
                                            <a href="" class="columnMenu">34</a>
                                            <a href="" class="columnMenu">35</a>
                                            <a href="" class="columnMenu">36</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="contentFilter">
                        <div class="titleFilter">
                            <div class="titleBox">
                                <span class="mainTitle">혜택/가격</span>
                                <span class="subTitle" id="subTitle1">모든 혜택/가격</span>
                            </div>
                            <div class="titleBtn">
                                <img src="<%= contextPath %>/resources/shop/symbols/+.png" alt="" class="filterPM filterPlus">
                                <img src="<%= contextPath %>/resources/shop/symbols/-.png" alt="" class="filterPM filterMinus" style="display: none;">
                            </div>
                        </div>
                        <div class="filterCheck" id="filterCheck1" style="display: none;">
                            <ul class="filterCheckUl">
                                <li class="menu">
                                    <span class="filterText">혜택</span><br>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="무료배송"><label for="" class="filterText">무료배송</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="할인"><label for="" class="filterText">할인</label><br>
                                    </div>
                                </li>
                                <li class="menu" style="margin-top: 10px;">
                                    <span class="filterText">가격</span><br>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="10만원 이하"><label for="" class="filterText">10만원 이하</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="10-30만원"><label for="" class="filterText">10-30만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="30-50만원"><label for="" class="filterText">30-50만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="50-100만원"><label for="" class="filterText">50-100만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="100-300만원"><label for="" class="filterText">100-300만원</label><br>
                                    </div>
                                    <div class="priceFilter">
                                        <input type="checkbox" value="300만원 이상"><label for="" class="filterText">300만원 이상</label><br>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </aside>
            <div id="mainContent">
                <div id="showFilter">
                    <div>상품</div> <!-- 총 상품 개수 -->
                    <div><< < 1 2 3 4 5 6 7 8 9 10 > >></div> <!-- 페이징 바. 위치 고민 -->
                    <div>필터</div> <!-- 필터 기능 -->
                </div>
                <div id="content" class="contentContainer">
                	<c:forEach var="p" items="${ list }">
	                	<div class="postItem">
	                        <a href="${ pageContext.request.contextPath }/productDetail.sh?productName=${ p.productName }">
	                            <div>
	                                <img src="${ pageContext.request.contextPath }${ p.imgPath }${ p.imgName }" alt="" class="productImg">
	                            </div>
	                            <div class="productInner">
	                                <div class="productBrand">${ p.brandName }</div>
	                                <div class="productName">${ p.productName }</div>
	                                <div class="productPrice">${ p.companyPrice }원</div>
	                            </div>
	                        </a>
	                        <div class="productWish">
	                            <div class="interestWish">
	                                <svg width="13" height="15">
	                                    <path d="M0,0 L13,0 L13,15 L6.5,9.5 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
	                                </svg>
	                                <div class="wishText">${ p.wishListCount }</div>
	                            </div>
	                            <div class="interestWish">
	                                <svg width="15" height="15">
	                                    <rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />
	                                    <path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>
	                                    <line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />
	                                    <line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />
	                                </svg>
                                	<div class="wishText">${ p.postProductTagCount }</div>
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script>
        
        $('#deleteBtn').click(function() {
            $('#searchMain').val("");
        });

        $('.categoryLi').click(function() {
            $('.categoryLi').removeClass('tab');
            $(this).addClass('tab');
        });
        
        $('.titleFilter').each(function(index, e) {
            $(e).click(function() {       
                
                let filterPlus = $(this).children('.titleBtn').children('.filterPlus');
                let subTitle = $(this).find('.subTitle');
                let filterCheck = $(this).parent().find('.filterCheck');
                
                if (filterPlus.css('display') === 'block') {
                    filterPlus.css('display', 'none');
                    filterPlus.next().css('display','block');
                    subTitle.css('display','none');
                    filterCheck.css('display','block');
                } else {
                    filterPlus.css('display', 'block');
                    filterPlus.next().css('display','none');
                    subTitle.css('display','block');
                    filterCheck.css('display','none');
                }
            });
        });

        $('.filterCheckDiv').each(function(index, e) {
            $(e).change(function(){
                if($(this).children().is(":checked")) {
                    $(this).siblings(".filterDetail").css("display", "block");
                } else {
                    $(this).siblings(".filterDetail").css("display", "none");
                }
            });            
        });

        let filterData = {
            sortBy: 'price',
            order: 'asc'
        };

//         $('input[type="checkbox"]').change(function() {
//         	console.log(this);
//             if ($(this).is(':checked')) {
//                 $.ajax({
<%--                 url: "<%=contextPath%>/pCatFilter.sh", --%>
//                 dataType: 'json',
//                 data: { category },
//                 success: function(product, stock, wishlist, postProductTag) { // 매개변수 이게 맞나..?       
//                     let product = response.~~; // product, wishlist등 데이터가져오기
//                     let str = "";
//                     for(let i = 0; i < data.length; i++) {
// 						str +=  '<div class="postItem">'
//                             +   '<a href="">'
//                             +       '<div>'
//                             +           '<img src="' + product.filePath + '"alt ="" class ="productImg">'
// 							+       '</div>'
//                             +       '<div class="productInner">'
//                             +           '<div class="productBrand">'+ product.brand +'</div>'
//                             +           '<div class="productName">'+ product.name +'</div>'
//                             +           '<div class="productPrice">'+ product.price +'</div>'
//                             +   '</a>'
//                             +   '<div class="productWish">'
//                             +       '<div class="interestWish">'
//                             +           '<svg width="13" height="15">'
//                             +               '<path d="M0,0 L13,0 L13,15 L6.5,9.5 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />'
//                             +           '</svg>'
//                             +           '<div class="wishText">' + WISHLIST개수 + '</div>'
//                             +       '</div>'
//                             +       '<div class="interestWish">'
//                             +          '<svg width="15" height="15">'
//                             +              '<rect x="0" y="0" width="15" height="15" fill="#fff" stroke="#000" stroke-width="1" />'
//                             +              '<path d="M6.5 9.2c-1.88-1.85-3.67-3.44-3.67-4.84 0-1.28 1.04-1.76 1.79-1.76 0.44 0 1.39 0.17 1.92 1.5 0.53-1.32 1.49-1.48 1.92-1.48 0.85 0 1.76 0.54 1.76 1.72 0 1.69-2.13 3.59-4.5 6.01m1.92-8.63c-0.7 0-1.42 0.33-1.84 1.02-0.42-0.72-1.15-1.06-1.88-1.06-1.05 0-2.08 0.72-2.08 2.04 0 1.54 1.84 3.11 4 5.24 2.16-2.13 4-3.71 4-5.24 0-1.33-1.03-2.05-2.09-2.05" fill="#000" stroke="#000" stroke-width="0"/>'
//                             +              '<line x1="2" y1="11" x2="13" y2="11" stroke="#000" stroke-width="1" />'
//                             +              '<line x1="2" y1="13" x2="10.5" y2="13" stroke="#000" stroke-width="1" />'
//                             +          '</svg>'
//                             +          '<div class="wishText">' + POST_PRODUCTTAG개수 + '</div>'
//                             +       '</div>'
//                             +    '</div>'
// 							+ '</div>'
// 					}
// 					$("#content").html(str);
//                 },
//                 error: function() {
//                     alert('상품 목록을 가져오는데 실패하였습니다.');
//                 }
//                 });
//             } else {
//                 // 체크박스가 체크 해제될 때 필요한 처리
//             } 
//         });

        $('.filterCheckUl').on('click', 'input[name="outer"]', function() {
            var selectedFilters = [];
            $('input[name="outer"]:checked').each(function() {
                selectedFilters.push($(this).val());
            });

            $.ajax({
                url: '/getProducts',
                type: 'POST',
                dataType: 'json',
                data: { category: 'outer', filters: selectedFilters },
                success: function(data) {
                // 응답받은 데이터를 가지고 상품 목록 생성 및 렌더링
                },
                error: function() {
                alert('상품 목록을 가져오는데 실패하였습니다.');
                }
            });
        });
        // $.ajax({
        //     url: "<%=contextPath%>/pCatFilter.sh",
        //     data: filterData,
        //     success: function(data) {
        //         // 반환된 JSON 데이터를 처리
        //         // ...
        // },
        // error: function() {
        //     console.error(error);
        // }
        // });

        // 무한스크롤
        // $('.contentContainer').infiniteScroll({
        //     path: '.pagination__next',
        //     append: '.postItem',
        //     history: false,
        // });

        // $('.titleFilter').each(function(index, e) {
        //     $(e).click(function() {
        //         $(this).children('.titleBtn').children('.filterPlus').css('display', 'none');
        //         $(this).children('.titleBtn').children('.filterPlus').next().css('display','block');
        //         $(this).find('.subTitle').css('display','none');
        //         $(this).parent().find('.filterCheck').css('display','block');
        //     });
        // });
        
        // $('.filterMinus').each(function(index, e) {
        //     $(e).click(function() {
        //         $(this).css('display', 'none');
        //         $(this).parent().find('.filterPlus').css('display', 'block');
        //         $(this).parent().parent().find('.subTitle').css('display','block');
        //         $(this).parent().parent().parent().find('.filterCheck').css('display','none');
        //     });
        // });
    </script>
</body>

</html>