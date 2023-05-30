<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dressroom</title>
<link rel="icon" href="data:,">
<link rel="stylesheet" href="<%= contextPath %>/resources/dressroom/css/dressroomMain.css">
</head>
<body>
<jsp:include page="/views/main/menubar_sun.jsp" />
	<section id="main">

		<div class="container">
			<section id="leftbox" class="leftbox">
				<!-- 여러 이미지가 동시에 존재할 수 있도록 수정 -->
			</section>
		</div>

		<section id="itemListbox">
			<button id="backButton">카테고리 가기</button>
		  <section id="itemListboxList">
			<section class="container2">
				<div class="rightbox" >
					<input type="hidden" name="" value="가디건">
					<img id="img1" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/AMI de Coeur Oversize Intarsia Cardigan Black_1.png">
						<div class="itemObjectInformation">가디건</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="긴팔 티셔츠">
					<img id="img2" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike x Peaceminusone LS T_Shirt White _DR0098_100__1.png">
						<div class="itemObjectInformation">긴팔 티셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반팔 티셔츠">
					<img id="img3" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Stussy Fuzzy Dice T_Shirt Black_1.png">
						<div class="itemObjectInformation">반팔 티셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="셔츠">
					<img id="img4" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Ader Error x Zara Striped Poplin Shirt Stripe_1.png">
						<div class="itemObjectInformation">셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="후드">
					<img id="img5" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Ader Error Verif Logo Hoodie Navy_1.png">
						<div class="itemObjectInformation">후드</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스웨트셔츠">
					<img id="img6" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/IAB Studio x Yonex Sweatshirt Green_1.png">
						<div class="itemObjectInformation">스웨트셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="슬리브리스">
					<img id="img7" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike x Pigalle NRG Reversible Tank Jersey Court Purple_1.png">
						<div class="itemObjectInformation">슬리브리스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="원피스">
					<img id="img8" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Nike x Jacquemus NRG Short Sleeve Polo Dress Dark Obsidian _ Asia_1.png">
						<div class="itemObjectInformation">원피스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="니트">
					<img id="img9" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectInformation">니트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 상의">
					<img id="img10" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Nike Swoosh Medium Support Zip Front Sports Bra Black_1.png">
						<div class="itemObjectInformation">기타 상의</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="바지">
					<img id="img11" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Our Legacy Third Cut Digital Denim Print_1.png">
						<div class="itemObjectInformation">바지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반바지">
					<img id="img12" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike x Stussy Water Shorts Habanero Red_1.png">
						<div class="itemObjectInformation">반바지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스커트">
					<img id="img13" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Thom Browne Ripstop Mesh 4_Bar Dropped Back Pleated Mini Skirt Medium Grey_1.png">
						<div class="itemObjectInformation">스커트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="레깅스">
					<img id="img14" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Nike NSW Essential Mid Rise Swoosh Leggings Black _ US_EU_1.png">
						<div class="itemObjectInformation">레깅스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 하의">
					<img id="img15" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Supreme Cargo Denim Overalls Washed Blue _ 22FW_1.png">
						<div class="itemObjectInformation">기타 하의</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="자켓">
					<img id="img16" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Thisisneverthat x Grateful Dead Lightning Trucker Jacket Washed Blue_1.png">
						<div class="itemObjectInformation">자켓</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="코트">
					<img id="img17" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ S Max Mara Poldo Wool Coat Camel_1.png">
						<div class="itemObjectInformation">코트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="아노락">
					<img id="img18" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/The North Face White Label New Dalton Anorak White_1.png">
						<div class="itemObjectInformation">아노락</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="패딩">
					<img id="img19" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Stussy Ripstop Down Puffer Jacket Rose _ 22FW_1.png">
						<div class="itemObjectInformation">패딩</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 아우터">
					<img id="img20" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Burberry Reversible Icon Stripe Wool Cape Black_1.png">
						<div class="itemObjectInformation">기타 아우터</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="프리미엄가방">
					<img id="img21" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Chanel Small Flap Bag with Top Handle Grained Calfskin & Gold Black_1.png">
						<div class="itemObjectInformation">프리미엄가방</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="미니백">
					<img id="img22" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/COS Quilted Micro Bag Off White_1.png">
						<div class="itemObjectInformation">미니백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="백팩">
					<img id="img23" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Supreme Backpack Silver _ 22SS_1.png">
						<div class="itemObjectInformation">백팩</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="숄더백">
					<img id="img24" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Louis Vuitton Alma BB Monogram_1.png">
						<div class="itemObjectInformation">숄더백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="토트백">
					<img id="img25" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Bao Bao Issey Miyake Lucent Tote Bag White_1.png">
						<div class="itemObjectInformation">토트백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="크로스백">
					<img id="img26" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Prada Re_Nylon and Saffiano Leather Shoulder Bag Black_1.png">
						<div class="itemObjectInformation">크로스백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="클러치">
					<img id="img27" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Thom Browne Pebble Grain Leather Hot Air Balloon Applique Small Document Holder Dark Grey_1.png">
						<div class="itemObjectInformation">클러치</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="더플백">
					<img id="img28" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike Brasilia 9_5 Training Duffle Bag Large 95L Black_1.png">
						<div class="itemObjectInformation">더플백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="에코백">
					<img id="img29" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Maison Kitsune Tricolor Fox Tote Bag Navy_1.png">
						<div class="itemObjectInformation">에코백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="캐리어">
					<img id="img30" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Palace x Rimowa Original Cabin Aluminium Suitcase Desert_1.png">
						<div class="itemObjectInformation">캐리어</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 가방">
					<img id="img31" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Malbon Golf M Bucket Classic Stand Bag Ivory_1.png">
						<div class="itemObjectInformation">기타 가방</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반지갑">
					<img id="img32" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Dior Bi_Fold Card Holder Beige & Black Dior Oblique Jacquard_1.png">
						<div class="itemObjectInformation">반지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="장지갑">
					<img id="img33" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Dior Saddle Wallet Blue Dior Oblique Jacquard_1.png">
						<div class="itemObjectInformation">장지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="카드 지갑">
					<img id="img34" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Louis Vuitton Envelope Business Card Holder Monogram_1.png">
						<div class="itemObjectInformation">카드 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="체인 지갑">
					<img id="img35" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Vivienne Westwood Re_Vegan Grain Purse with Chain Black_1.png">
						<div class="itemObjectInformation">체인 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 지갑">
					<img id="img36" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Chanel Zipped Coin Purse Lambskin Resin & Gold Black_1.png">
						<div class="itemObjectInformation">기타 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="프리미엄시계">
					<img id="img37" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Rolex Submariner Date 126613LB_1.png">
						<div class="itemObjectInformation">프리미엄시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="전자 시계">
					<img id="img38" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Casio G_Shock x Supreme x The North Face DW_6900 White_1.png">
						<div class="itemObjectInformation">전자 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="가죽 시계">
					<img id="img39" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Cartier Tank Must Watch Large Quartz Steel Calfskin Black_1.png">
						<div class="itemObjectInformation">가죽 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="메탈 시계">
					<img id="img40" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Breitling Navitimer B01 Chronograph 43 Steel Silver Metal_1.png">
						<div class="itemObjectInformation">메탈 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 시계">
					<img id="img41" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Swatch x Omega Bioceramic MoonSwatch Mission To Venus_1.png">
						<div class="itemObjectInformation">기타 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="귀걸이">
					<img id="img42" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Van Cleef & Arpels Sweet Alhambra Earrings Yellow Gold Onyx_1.png">
						<div class="itemObjectInformation">귀걸이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="목걸이">
					<img id="img43" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Human Made Five Heart Necklace Silver_1.png">
						<div class="itemObjectInformation">목걸이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="팔찌">
					<img id="img44" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Peaceminusone Turquoise Bracelet _1 Turquoise Brass_1.png">
						<div class="itemObjectInformation">팔찌</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반지">
					<img id="img45" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Hermes Small Chaine D_Ancre Enchainee Ring Rose Gold_1.png">
						<div class="itemObjectInformation">반지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 주얼리">
					<img id="img46" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Ferragamo Vara Hair Clip Black Gold_1.png">
						<div class="itemObjectInformation">기타 주얼리</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="비니">
					<img id="img47" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Stone Island N10B5 Beanie Melange Grey _ 22FW_1.png">
						<div class="itemObjectInformation">비니</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="버킷햇">
					<img id="img48" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike Dri_Fit Reversible Golf Bucket Hat White_1.png">
						<div class="itemObjectInformation">버킷햇</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="볼캡">
					<img id="img49" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Supreme Pigment Print S Logo 6_Panel Indigo _ 22FW_1.png">
						<div class="itemObjectInformation">볼캡</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 모자">
					<img id="img50" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Nike ACG Warm AW84 Cap Light Stone_1.png">
						<div class="itemObjectInformation">기타 모자</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="벨트">
					<img id="img51" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Montblanc Horseshoe Buckle 30mm Reversible Leather Belt Black Brown_1.png">
						<div class="itemObjectInformation">벨트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="아이웨어">
					<img id="img52" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Maison Margiela x Gentle Monster MM006 Black Black_1.png">
						<div class="itemObjectInformation">아이웨어</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="머플러">
					<img id="img53" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Kapital Flannel Bandana Pattern Reversible Kesa Muffler Purple Sax_1.png">
						<div class="itemObjectInformation">머플러</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스카프">
					<img id="img54" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Hermes Cliquetis Twilly Marine Blanc Marron Glace_1.png">
						<div class="itemObjectInformation">스카프</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="키링">
					<img id="img55" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Jellycat Bartholomew Bear Bag Charm Brown_1.png">
						<div class="itemObjectInformation">키링</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="넥타이">
					<img id="img56" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Prada Re_Nylon Gabardine Tie Black_1.png">
						<div class="itemObjectInformation">넥타이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="장갑">
					<img id="img57" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Paloma Wool Kala Knitted Gloves Ecru_1.png">
						<div class="itemObjectInformation">장갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 패션잡화">
					<img id="img58" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Supreme Hanes Boxer Briefs Black _4 Pack__1.png">
						<div class="itemObjectInformation">기타 패션잡화</div>
				</div>			
			</section>

			<section class="container3">
				<div class="rightbox" >
					<input type="hidden" name="" value="스니커즈">
					<img id="img59" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Adidas Samba Vegan White Black_1.png">
						<div class="itemObjectInformation">스니커즈</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="플랫">
					<img id="img60" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Miu Miu Leather Ballerinas Black_1.png">
						<div class="itemObjectInformation">플랫</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="로퍼">
					<img id="img61" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Miu Miu Leather Penny Loafers Black_1.png">
						<div class="itemObjectInformation">로퍼</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="더비/레이스업">
					<img id="img62" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Paraboot Michael Lisse Marron_1.png">
						<div class="itemObjectInformation">더비/레이스업</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="샌들/슬리퍼">
					<img id="img63" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/Adidas Yeezy Slide Bone 2022_1.png">
						<div class="itemObjectInformation">샌들/슬리퍼</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="힐/펌프스">
					<img id="img64" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ Dior J_adior Slingback Pumps Technical Fabric Black_1.png">
						<div class="itemObjectInformation">힐/펌프스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="부츠">
					<img id="img65" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/_W_ UGG Classic Short II Boots Chestnut_1.png">
						<div class="itemObjectInformation">부츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 신발">
					<img id="img66" class="itemObject"
						src="<%= contextPath %>/resources/dressroom/image/G_Fore Perforated G_Drive Golf Shoes Twilight_1.png">
						<div class="itemObjectInformation">기타 신발</div>
				</div>
			</section>

		</section>
		
	   </section>
	</section>

	<section id="selectbox">
    <div><h3>코디에 사용된 제품</h3></div>
    <div id="selectboxList">
		<div id="selectboxListInformation"></div>
    </div>
    
  </section>
  <jsp:include page="/views/common/footer.jsp" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
	 $(function(){
            var previousContent;

            // 클릭 이벤트 핸들러 등록 함수
            function itemHandlers() {
                $(".rightbox").click(function(){
					 var className = $(this).parent('section').attr('class')
                    // Ajax 요청 이전의 내용을 저장
                    previousContent = $("#itemListboxList").html();

                    // Ajax 요청 보내기
                    var catName = $(this).children('input[type="hidden"]').val();
					$.ajax({
						url : "<%= contextPath %>//dressroomCategory.me",
                        type : "get",
                        data : {"categoryName" : catName},
                        dataType : "JSON",
                        success : function(data){
							var str = '';
							if( className == 'container3'){
								str += '<section class="container3">' 
							}else{
								str += '<section class="container2">' 
							}
								$(data).each(function(index, item){
								var imgId = "img"+index;
								str += '<div class="rightboxSelectList">'
                                           +'<img id="'+imgId+'_'+item.imgNo+'" class="itemObject" src="/SMF_Project'+item.imgPath+item.imgName+'"/>'
										   +'<div class="itemObjectInformationName">'+item.productName+'</div>'
										   +'<div class="itemObjectInformation">'+item.companyPrice.toLocaleString()+'원</div>'
                                       +'</div>'
								});
								str += '</section>';
								
                            // Ajax 요청 성공 시 처리
                            $("#itemListboxList").html(str);

                            // 뒤로 가기 버튼 보이기
                            $("#backButton").show();

                            // 다시 클릭 이벤트 핸들러 등록
                            //listBackHandlers();
							$("#itemListboxList").off("mousedown", ".itemObject", makeCopyDragEvent);
                           
							makeCopyDragEvent();
                        }
                    });
                });
            }

            // 뒤로 가기 버튼 숨기기
            $("#backButton").hide();

            // 페이지 로딩 시 클릭 이벤트 핸들러 등록
            itemHandlers();
			

            $("#backButton").click(function() {
                // 이전에 저장한 내용을 출력
                $("#itemListboxList").html(previousContent);

                // 뒤로 가기 버튼 숨기기
                $("#backButton").hide();

				$("#itemListboxList").off("mousedown", ".itemObject", makeCopyDragEvent);
				
                // 다시 클릭 이벤트 핸들러 등록
                itemHandlers();
            });
        });
		
	</script>


 <script src="<%= contextPath %>/resources/dressroom/javascript/dressroomMainJs.js"></script>
</body>
</html>