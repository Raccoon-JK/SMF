/**
 * 
 */

      const $topBtn = document.querySelector(".moveTopBtn");
      

	   // 버튼 클릭 시 맨 위로 이동
	   $topBtn.onclick = () => {
	   window.scrollTo({ top: 0 });  
	   };
	
	   // 피드 이미지 슬라이드
	
	   var swiper = new Swiper(".mySwiper", {
	       cssMode: true,
	       navigation: {
	         nextEl: ".swiper-button-next",
	         prevEl: ".swiper-button-prev",
	       },
	       pagination: {
	         el: ".swiper-pagination",
	       },
	       mousewheel: true,
	       keyboard: true,
	     });
	
	   // 팔로우 버튼 클릭시 변경
	
	   const fb = document.querySelectorAll('#follow-btn');
	
	   fb.forEach(button => {
	       button.addEventListener('click', () => {
	       if (button.style.backgroundColor === 'black') {
	           // 배경색을 원래대로 되돌리는 코드 작성
	           button.style.backgroundColor = 'white';
	           button.style.color = 'black';
	       } else {
	           // 배경색을 변경하는 코드 작성
	           button.style.backgroundColor = 'black';
	           button.style.color = 'white';
	       }
	       });
	   });
	
	 
	   // 모달 컨트롤
	
	     // 모달창 열기
	     function openModal(id) {
	       document.getElementById(id).style.display = "flex";
	       document.body.style.overflow ="hidden"; // 모달창 열릴때 스크롤 작동 못하게
	     }
	     
	     // 모달창 닫기
	     function closeModal(id) {
	       document.getElementById(id).style.display = "none";
	       document.body.style.overflow ="scroll"; // 모달창 닫힐때 스크롤 정상 작동
	       
	     }
	
	     // 모달창 외부 클릭 이벤트 처리
	     window.onclick = function(event) {
	       if (event.target.classList.contains("modal")) {
	         closeModal(event.target.id);
	       }
	     }
      
      
