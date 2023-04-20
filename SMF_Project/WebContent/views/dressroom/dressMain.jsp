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
<link rel="stylesheet" href="/SMF_Project/resources/dressroom/css/dressroomMain.css">
</head>
<body>
<%-- <jsp:include page="/views/common/menubar_sun.jsp" /> --%>
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
						src="/SMF_Project/resources/dressroom/image/AMI de Coeur Oversize Intarsia Sweater Black Red_1.png">
						<div class="itemObjectName">가디건</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="긴팔 티셔츠">
					<img id="img2" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Stussy Basic Stussy Hoodie Ash Heather 2023_1.png">
						<div class="itemObjectName">긴팔 티셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반팔 티셔츠">
					<img id="img3" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">반팔 티셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="셔츠">
					<img id="img4" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="후드">
					<img id="img5" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">후드</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스웨트셔츠">
					<img id="img6" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">스웨트셔츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="슬리브리스">
					<img id="img7" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">슬리브리스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="원피스">
					<img id="img8" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">원피스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="니트">
					<img id="img9" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">니트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 상의">
					<img id="img10" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/AMI de Coeur Oversize Intarsia Sweater Black Red_1.png">
						<div class="itemObjectName">기타 상의</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="바지">
					<img id="img11" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Stussy Basic Stussy Hoodie Ash Heather 2023_1.png">
						<div class="itemObjectName">바지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반바지">
					<img id="img12" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">반바지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스커트">
					<img id="img13" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">스커트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="레깅스">
					<img id="img14" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">레깅스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 하의">
					<img id="img15" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 하의</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="자켓">
					<img id="img16" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">자켓</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="코트">
					<img id="img17" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">코트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="아노락">
					<img id="img18" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">아노락</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="패딩">
					<img id="img19" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">패딩</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 아우터">
					<img id="img20" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 아우터</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="프리미엄가방">
					<img id="img21" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Stussy Basic Stussy Hoodie Ash Heather 2023_1.png">
						<div class="itemObjectName">프리미엄가방</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="미니백">
					<img id="img22" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">미니백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="백팩">
					<img id="img23" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">백팩</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="숄더백">
					<img id="img24" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">숄더백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="토트백">
					<img id="img25" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">토트백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="크로스백">
					<img id="img26" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">크로스백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="클러치">
					<img id="img27" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">클러치</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="더플백">
					<img id="img28" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">더플백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="에코백">
					<img id="img29" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">에코백</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="캐리어">
					<img id="img30" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">캐리어</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 가방">
					<img id="img31" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 가방</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반지갑">
					<img id="img32" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">반지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="장지갑">
					<img id="img33" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">장지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="카드 지갑">
					<img id="img34" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">카드 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="체인 지갑">
					<img id="img35" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">체인 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 지갑">
					<img id="img36" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 지갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="프리미엄시계">
					<img id="img37" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">프리미엄시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="전자 시계">
					<img id="img38" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">전자 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="가죽 시계">
					<img id="img39" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">가죽 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="메탈 시계">
					<img id="img40" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">메탈 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 시계">
					<img id="img41" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 시계</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="귀걸이">
					<img id="img42" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">귀걸이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="목걸이">
					<img id="img43" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">목걸이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="팔찌">
					<img id="img44" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">팔찌</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="반지">
					<img id="img45" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">반지</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 주얼리">
					<img id="img46" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 주얼리</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="비니">
					<img id="img47" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">비니</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="버킷햇">
					<img id="img48" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">버킷햇</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="볼캡">
					<img id="img49" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">볼캡</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 모자">
					<img id="img50" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 모자</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="벨트">
					<img id="img51" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">벨트</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="아이웨어">
					<img id="img52" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">아이웨어</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="머플러">
					<img id="img53" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">머플러</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="스카프">
					<img id="img54" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">스카프</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="키링">
					<img id="img55" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">키링</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="넥타이">
					<img id="img56" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">넥타이</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="장갑">
					<img id="img57" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">장갑</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 패션잡화">
					<img id="img58" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 패션잡화</div>
				</div>			
			</section>

			<section class="container3">
				<div class="rightbox" >
					<input type="hidden" name="" value="스니커즈">
					<img id="img59" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Stussy Basic Stussy Hoodie Ash Heather 2023_1.png">
						<div class="itemObjectName">스니커즈</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="플랫">
					<img id="img60" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">플랫</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="로퍼">
					<img id="img61" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">로퍼</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="더비/레이스업">
					<img id="img62" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">더비/레이스업</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="샌들/슬리퍼">
					<img id="img63" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">샌들/슬리퍼</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="힐/펌프스">
					<img id="img64" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">힐/펌프스</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="부츠">
					<img id="img65" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">부츠</div>
				</div>
				<div class="rightbox" >
					<input type="hidden" name="" value="기타 신발">
					<img id="img66" class="itemObject"
						src="/SMF_Project/resources/dressroom/image/Ader Error x Zara Patchwork Oversize Knit Sweater Multicolor_1.png">
						<div class="itemObjectName">기타 신발</div>
				</div>
			</section>

		</section>
		
	   </section>
	</section>

	<section id="selectbox">
    <div><h3>코디에 사용된 제품</h3></div>
    <div id="selectboxList">
    </div>
    
  </section>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
	 $(function(){
            var previousContent;

            // 클릭 이벤트 핸들러 등록 함수
            function listBackHandlers() {
                $(".rightbox").click(function(){
					 var className = $(this).parent('section').attr('class')
					 console.log(className)
                    // Ajax 요청 이전의 내용을 저장
                    previousContent = $("#itemListboxList").html();

                    // Ajax 요청 보내기
                    var catName = $(this).children('input[type="hidden"]').val();
					$.ajax({
						url : "<%= contextPath %>/dressroomCategory.me",
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
                                           +'<img id="'+imgId+'" class="itemObject" src="/SMF_Project'+item.imgPath+item.imgName+'"/>'
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
            listBackHandlers();
			

            $("#backButton").click(function() {
                // 이전에 저장한 내용을 출력
                $("#itemListboxList").html(previousContent);

                // 뒤로 가기 버튼 숨기기
                $("#backButton").hide();

				$("#itemListboxList").off("mousedown", ".itemObject", makeCopyDragEvent);
				
                // 다시 클릭 이벤트 핸들러 등록
                listBackHandlers();
            });
        });
		
	</script>


 <script src="/SMF_Project/resources/dressroom/javascript/dressroomMainJs.js"></script>
</body>
</html>