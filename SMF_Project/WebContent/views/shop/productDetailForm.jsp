<%@ page import="com.smf.shop.model.vo.*, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	Product p = (Product) request.getAttribute("p");
	ArrayList<Stock> list = (ArrayList<Stock>) request.getAttribute("list");
	Stock s = (Stock) request.getAttribute("s");
	Product_Detail pd = (Product_Detail) request.getAttribute("pd");
	Product_Img pi = (Product_Img) request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/shop/css/productDetail.css">
<style>
    *{
        box-sizing: border-box;
    }

    body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3,
    h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
        margin: 0;
        padding: 0;
    }
    a{ text-decoration: none; }
    ul li{ list-style: none; }
    
</style>
</head>
<body>
<!-- 	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 	   	<div class="modal-dialog" role="document"> -->
<!-- 	       	<div class="modal-content"> -->
<!-- 	           	<div class="modal-header"> -->
<!-- 	      	     	<h5 class="modal-title" id="exampleModalLabel">사이즈 선택</h5> -->
<!-- 	            </div> -->
<!-- 	          	<div class="modal-body shoeSize"> -->
<!--    					<input type="radio" id="" name="size" value="" class="modalSize"><label for="" class="btn"></label> -->
<!-- 	          	</div> -->
<!-- 	           <div class="modal-footer"> -->
<!-- 	               <button type="button" id="sizeBtn" class="btn">선택</button> -->
<!-- 	               <button type="button" id="closeBtn" class="btn" data-dismiss="modal">취소</button> -->
<!-- 	           </div> -->
<!-- 	       </div> -->
<!-- 	   </div> -->
<!-- 	</div> -->
    <div></div>
    <div class="content">
        <div class="contentHead">
            <div id="contentHeaderLeft" class="column mainImg">
                <button class="prevArrow"></button>
                <div class="mainImgList">
                	<c:forEach var="pi" items="${ list }">
	                	<div>
	                		<img src="${ pageContext.request.contextPath }${ pi.imgPath }${ pi.imgName }" alt="" style="width: 560px;">
	                	</div>
                	</c:forEach>
                </div>
                <button class="nextArrow"></button>
            </div>
            <div id="contentHeaderRight" class="column">
                <div id="productDetail">
                    <p class="detailBrand">${ p.brandName }</p>
                    <p class="detailName">${ p.productName }</p>
                    <!-- <p>알렌느 카펜터 디테일 트윌 데님 바이커 자켓 인디안 핑크</p> -->
                </div>
                <div id="productInfo">
                    <form action="">
                            <div class="categoryTitle productUnderline">
                                <div id="productInfoPrice">
                                    <div class="titleProduct">가격</div>
                                </div>
                                <div class="productInfoHalfR">
                                    <div class="detailPriceInfo">
                                        <div class="detailPrice">기업 가격</div>
                                        <div class="detailFullPrice"><%= p.getCompanyPrice() %>원</div>                                 
                                    </div>
                                    <div class="detailPriceInfo">
                                        <div class="detailPrice">리셀 가격</div>
                                        <div class="detailFullPrice">0원</div>                                 
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="categoryTitle productUnderline"">
                                    <div class="productInfoHalf">사이즈</div>
                                    <div class="productInfoRight productInfoHalfR">
                                        <!-- 사이즈 Modal-->
                                        <button id="testBtn" class="btn sizeOption" data-target="#testModal">옵션</button>
										<div class="modal fade" id="testModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">사이즈 선택</h5>
													</div>
													<div class="modal-body shoeSize">
<%-- 														<% for(int i = 0; i < list1.length; i++){ %> --%>
<%-- 														<c:forEach var="s" items="${ list1 }"> --%>		
															<input type="radio" id="" name="size" value=""
																class="modalSize"><label for="" class="btn"></label>
<%-- 														<% } %> --%>
<%-- 														</c:forEach> --%>
													</div>
													<div class="modal-footer">
														<button type="button" id="sizeBtn" class="btn">선택</button>
														<button type="button" id="closeBtn" class="btn"
															data-dismiss="modal">취소</button>
													</div>
												</div>
											</div>
										</div>
									</div>
                                </div>
                                <div class="categoryTitle productUnderline"">
                                    <div class="productInfoHalf">
                                        <button id="testBtn2">수량</button> <!-- 모달창으로. 누르면 해당 브랜드 재고, 리셀 재고 표시 -->
<!--                                         <div class="modal fade" id="testModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--                                             <div class="modal-dialog" role="document"> -->
<!--                                                 <div class="modal-content"> -->
<!--                                                     <div class="modal-header"> -->
<!--                                                         <h5 class="modal-title" id="exampleModalLabel2">상품 수량 선택</h5> -->
<!--                                                     </div>                                                     -->
<!--                                                     <div class="modal-body stock"> -->
                                                        
<!--                                                     </div>                                                     -->
<!--                                                     <div class="modal-footer"> -->
<!--                                                         <button type="button" id="sizeBtn" class="btn">선택</button> -->
<!--                                                         <button type="button" id="closeBtn" class="btn" data-dismiss="modal">취소</button> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                    </div>
                                    <div class="productInfoHalfR detailPriceInfo">
                                        <div class="detailPrice">총 가격</div>
                                        <div class="detailFullPrice">원</div>                                 
                                    </div>
                                </div>
                            </div>
                            <div>
                            	<c:choose>
	                                <c:when test="${ s.stock != 0 }"> <!-- 재고가 있을때 -->
	                                    <button type="submit" class="buyButton" style="background-color: rgb(239, 98, 83);color: rgb(255, 255, 255);">구매하기</button>
	                                </c:when>
	                                <c:otherwise>
	                                    <button type="submit" class="buyButton" style="background-color: rgb(211, 211, 211);color: rgb(255, 255, 255); cursor: not-allowed;">일시 품절</button>
	                                </c:otherwise>                            	
                            	</c:choose>
                                <a href="" class="interestProduct">
                                    <svg width="13" height="15">
                                        <path d="M0,0 L13,0 L13,15 L6.5,9.5 L0,15 L0,10 Z" fill="none" stroke="#000000" stroke-width="1" />
                                    </svg>
                                    <span class="btnText">관심상품</span>
                                    <span class="wishCount">${ wl.productName }</span>
                                </a>
                            </div>
                        <div class="deliveryTitle1">
                    </form>
                        <p class="deliveryTitle1_1">배송 정보</p>
                        <div>
                            <div class="deliveryFlex"><!-- flex용 -->
                                <div style="width: 40px; height: 40px; margin-right: 14px;">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" style="width: 40px; height: 40px;">
                                </div>
                                <div>
                                    <p class="deliveryText1">
                                        <span class="deliveryText1_1">브랜드배송</span>
                                        <span class="deliveryText1_2">무료</span>
                                    </p>
                                    <p class="subText">입점한 브랜드에서 직접 택배 배송</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="productDetailItemContent">
            <div class="otherProductArea"> <!-- 상품상세정보 -->
                
            </div>
            <div class="PDIC2 otherProductArea"> <!-- 교환 및 반품안내 -->
                <div class="PDIC2_0">
                    <div class="PDIC2_1">거래조건에 관한 정보</div>
                    <div class="PDIC2_2">
                        <ul class="PDICDetails">
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">재화등의 배송방법에 관한 정보</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>배송방식 및 출고일 등은 상품 상세페이지 참조</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">주문 이후 예상되는 배송기간</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>주문일로부터 평균 3일 이내에 발송 (천재지변 또는 상품 수급 상황, 택배사 사정 등에 따라 지연될 수 있습니다.)</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">제품하자·오배송 등에 따른 청약철회 등의 경우 청약철회 등을 할 수 있는 기간 및 통신판매업자가 부담하는 반품비용 등에 관한 정보</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>전자상거래등에서의소비자보호에관한법률 등에 의한 제품의 하자 또는 오배송 등으로 인한 청약철회의 경우에는 상품 수령 후 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회를 할 수 있으며, 반품 비용은 통신판매업자가 부담합니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">제품하자가 아닌 소비자의 단순변심, 착오구매에 따른 청약철회 등의 경우 청약철회 등을 할 수 있는 기간 및 소비자가 부담하는 반품비용 등에 관한 정보</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>편도 6,000 원 (최초 배송비가 무료인 경우 왕복으로 부과될 수 있습니다.)</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">제품하자가 아닌 소비자의 단순변심, 착오구매에 따른 청약철회가 불가능한 경우 그 구체적 사유와 근거</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>전자상거래등에서의 소비자보호에관한법률 등에 의한 청약철회 제한 사유에 해당하는 경우 및 기타 객관적으로 이에 준하는 것으로 인정되는 경우 청약철회가 제한될 수 있습니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">재화 등의 교환·반품·보증 조건 및 품질보증기준</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>소비자분쟁해결기준(공정거래위원회 고시) 및 관계법령에 따릅니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">대금을 환불받기 위한 방법과 환불이 지연될 경우 지연에 따른 배상금을 지급받을 수 있다는 사실 및 배상금 지급의 구체적 조건 및 절차준</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>주문 취소 및 대금의 환불은 마이페이지에서 신청할 수 있으며, 전자상거래 등에서의 소비자보호에 관한 법률에 따라 소비자의 청약철회 후 판매자가 재화 등을 반환 받은 날로부터 3영업일 이내에 지급받은 대금의 환급을 정당한 사유 없이 지연하는 때에는 소비자는 지연기간에 대해서 연 15%의 지연배상금을 판매자에게 청구할 수 있습니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">소비자피해보상의 처리, 재화 등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>소비자분쟁해결기준(공정거래위원회 고시) 및 관계법령에 따릅니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">거래에 관한 약관의 내용 또는 확인할 수 있는 방법</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>페이지 하단의 이용약관 링크를 통해 확인할 수 있습니다.</li>
                                </ul>
                            </li>                            
                        </ul>
                    </div>
                </div>
                <div class="PDIC2_0">
                    <div class="PDIC2_1">교환 및 반품 안내</div>
                    <div class="PDIC2_2">
                        <ul class="PDICDetails">
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">교환/반품 접수 방법 및 기간</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>• 구매자 단순 변심으로 인한 교환/반품 가능 기간은 상품 수령일로부터 7일 이내이며 배송비는 구매자가 부담합니다.</li>
                                    <li>• 상품이 표시/광고내용과 다르거나 제품의 하자의 경우 상품 수령일로부터 3개월 이내, 또는 사실을 알게된 날 (알 수 있었던 날)부터 30일 이내에 신청 가능하며 배송비는 판매자가 부담합니다.</li>
                                    <li>• 교환/반품 시 먼저 판매자와 사유, 택배사, 배송비, 반품 주소 등을 협의하신 후 반품 상품을 발송해주세요.</li>
                                    <li>• 동일 상품 내 추가 금액이 없는 옵션만 교환 가능합니다.</li>
                                    <li>• 출고 이후 교환/반품/환불 요청 시 상품 회수 후 처리됩니다.</li>
                                    <li>• 교환/반품 접수 안내 : 구해줘패션 > MY > 구매내역 > 종료 > 주문상세 > 반품 신청 또는 교환신청에서 내용 작성 후 제출</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">교환/반품 비용</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>• 반품 배송비: 6,000원</li>
                                    <li>• 교환 배송비: 6,000원</li>
                                    <li>• 최초 배송비가 무료일 경우, 왕복 배송비(반품 배송비+최초 배송비)가 부과됩니다.</li>
                                    <li>• 교환/반품 비용 및 지불 방식은 상품 및 교환/반품 사유에 따라 상이할 수 있으므로 반품/교환 접수 시 최종 내용을 확인하시기 바랍니다.</li>
                                    <li>• 제주/도서산간 지역은 추가 운임이 발생할 수 있습니다.</li>
                                </ul>
                            </li>
                            <li class="PDICDetail">
                                <div class="PDICDetailContent1">
                                    <span class="PDICDetailContent1_1">교환/반품 불가 사유</span>
                                </div>
                                <ul class="PDICDetailContent2">
                                    <li>• 구매회원의 단순변심으로 인한 교환/반품 요청이 상품 등을 수령한 날로부터 7일을 경과한 경우• 구매회원의 귀책사유로 상품이 멸실·훼손된 경우(다만, 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외함)</li>
                                    <li>• 구매회원의 사용 또는 일부 소비 및 시간이 지나 다시 판매하기 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
                                    <li>• 복제가 가능한 재화 등의 포장을 훼손한 경우</li>
                                    <li>• 택 제거, 포장 박스 훼손, 구성품 누락, 사용 흔적, 사은품 누락 등이 있을 경우</li>
                                    <li>• 개별적으로 주문제작되는 상품으로 재판매가 불가능한 경우</li>
                                    <li>• 세트 상품 중 일부 상품만 보낸 경우</li>
                                    <li>• 교환/반품 접수 없이 상품을 임의로 반송했을 경우</li>
                                    <li>• 기타 관련 법령이 정하는 청약철회 제한사유에 해당하는 경우</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>                
            </div>
            <div class="otherProductArea"> <!-- 스타일 -->
                <h2 class="feedTitle">
                    <span class="feedTitle1">스타일</span>
                    <span class="feedTitle2">3</span>
                </h2>
                <div class="feedContent">
                    <div class="feedContent1">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
										  	<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
										</svg>
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                    <div class="feedContent1" style="left: 307px;">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        svg
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                    <div class="feedContent1">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        svg
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                    <div class="feedContent1">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        svg
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                    <div class="feedContent1">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        svg
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                    <div class="feedContent1">
                        <a href="">
                            <div class="feedContent2">
                                <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="productSocialImg">
                            </div>
                            <div class="feedContent3">
                                <div class="feedContent3_1">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/a_debcc71138bf44cebfe3e83661b3f3cb.png" alt="" class="feedContent3_1_1"><!-- 프로필사진 -->
                                    <p class="feedContent3_1_2">fashion69</p><!-- 스타일 아이디 -->
                                    <span class="feedContent3_1_3"><!-- 좋아요 -->
                                        svg
                                        <span>4</span>
                                    </span>
                                </div>
                                <p class="textBox">#블루밍챌린지 #팔라스 #팔라스바시티자켓 #데일리룩 #나투시 #palace #조던1시카고 #스타일챌린지 #오오티디</p>
                            </div>
                        </a>
                    </div>
                </div><!-- *n -->
            </div>
            <div class="otherProductArea"> <!-- 동일브랜드 다른 상품 -->
                <h3 class="moreTitle">
                    <span class="moreTitle1">jordan</span>
                    <span class="moreTitle2">의 다른 상품</span>
                </h3>
                <div class="moreContent">
                    <div class="moreContent1"> <!-- grid 5*2 -->
                        <!-- content -->
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>
                        <div class="moreContent1_1">
                            <a href="">
                                <div class="moreContentImg">
                                    <img src="${ pageContext.request.contextPath }/resources/shop/symbols/p_a5578cd8bd72480d83719612c9e74282.webp" alt="" class="moreContentImg1">
                                </div>
                                <div class="moreContentInfo">
                                    <div class="moreContentInfo1">jordan</div>
                                    <div class="moreContentInfo2">Jordan 1 Retro High OG White Cement</div>
                                    <div class="moreContentInfo3">185,000원</div>
                                </div>
                            </a>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $( document ).ready( function() {
            $('.mainImgList').slick({
                dots:true,
                speed:300,
                prevArrow:$('.prevArrow'),
                nextArrow:$('.nextArrow')
            });            
        } );

		$('#testBtn').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
		});

        $('#testBtn2').click(function(e){
			e.preventDefault();
			$('#testModal2').modal("show");
		});

        $('#sizeBtn').click(function() {
            $('#testModal').modal("hide");
            $('.sizeOption').text($("input[type='radio'][name='size']:checked").val());
        });

        $('#closeBtn').click(function() {
            $('#testModal').modal("hide");
        });
        
        $('#sizeBtn2').click(function() {
            $('#testModal2').modal("hide");
            $('.detailFullPrice').text((("input[type='radio'][name='size2']:checked").val()*$("input[type='number']").val()));
        });
        
        $('#closeBtn2').click(function() {
            $('#testModal2').modal("hide");
        });
        
        // $('input[type="checkbox"]').change(function() {
        //     $(this).addClass('btn-outline-primary');
        // });

        $('input[type="radio"]').change(function() {
            console.log(this);
            
            if ($(this).is(':checked')) {
                $('input[type="radio"]').next().removeClass('btn-outline-primary');
                $(this).next().addClass('btn-outline-primary');
            } else {
            }
        });
        
        $('#testBtn').click(function() {
        	$.ajax({
        		url: "${ pageContext.request.contextPath }/pSize.sh",
        		dataType: 'json',
        		data: {productName : '${ p.productName }'},
        		success: function(data){
        			
//         			let data = JSON.parse(data);
//         			let sizeInput = $('.shoeSize').children('input')
        			let sizeInput = $('.shoeSize').text()
        			console.log(data);
        			console.log(sizeInput);
       			 	for(let i = 0; i < data.length; i++) {
	  //<input type="radio" id="" name="size" value="" class="modalSize"><label for="" class="btn"></label>
       			 		let item = data[i].size;
       			 		console.log(item);
	   			      	
	   			     	sizeInput.attr('id', item)
	                    sizeInput.val(item)
	                    sizeInput.siblings('label').text(item)
	                    sizeInput.siblings('label').attr('for', item)
	        			
       			    }
        			
//         			let s = data[0].size
        			
                    
//         			let currInput = $('.shoeSize').children('input')
                    
//                     currInput.attr('id', s)
//                     currInput.val(s)
//                     currInput.siblings('label').text(s)
//                     currInput.siblings('label').attr('for', s)
        			
        		}
        	});
        });
        
//         $('#testBtn2').click(function() {
//         	$.ajax({
//         		url: "${ pageContext.request.contextPath }/pCount.sh",
//         		dataType: 'json',
//         		data: { productName=${ p.productName },
//         				size=$(".sizeOption").val()
//         				},
//         		success: function(data){
//         			<div class="modal fade" id="testModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
//                     <div class="modal-dialog" role="document">
//                         <div class="modal-content">
//                             <div class="modal-header">
//                                 <h5 class="modal-title" id="exampleModalLabel2">상품 수량 선택</h5>
//                             </div>                                                    
//                             <div class="modal-body size">
//                            		브랜드상품<input type="number" min="1" max="${ s.stock }[0]"/>
//                         		리셀상품<input type="number" min="1" max="${ s.stock }[1]"/>
//                         	</div>
//                             <div class="modal-footer">
//                                 <button type="button" id="sizeBtn2" class="btn">선택</button>
//                                 <button type="button" id="closeBtn2" class="btn" data-dismiss="modal">취소</button>
//                             </div>
//                         </div>
//                     </div>
//                 </div>
//         		}
//         	});
//         });
        </script>
</body>
</html>