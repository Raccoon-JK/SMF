/**
 * 메인페이지 js
 */

/**
 * Swiper 1
 */

var swiper = new Swiper(".first", {
	spaceBetween: 30,
	loop: true,
	effect: "fade",
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
	pagination: {
		el: ".swiper-pagination",
		clickable: true,
	},
});


/**
 * Swiper 2
 */

var swiper = new Swiper(".second", {
	slidesPerView: 6,
	slidesPerGroup: 1,
	spaceBetween: 10,
	loop: true,
	loopedSlides: 1,
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	}
});

/**
 * 더보기 기능
 */
/*
$(function() {
	$.get("/product.pr")
		.done((data) => {
			data = JSON.parse(data);
			data.forEach((a, i) => {
				var template =
					`<a href=""> <div class="col-sm-4">
			          <img src="${data[i].image}" id="box2">
			          <div class="info_box">
			            <h6 class="brand">${data[i].brand}</h6>
			            <h5 class="name">${data[i].title}</h5>
			            <p>가격 : ${data[i].price}</p>
			          </div>
			        </div> </a>`;
				$(".row").append(template);
			})
		})
});
*/

var count = 1;

$('#more').click(function() {
	$.get("/product.pr")
		.done((data) => {
			console.log(data)
			data = JSON.parse(data);
			data.forEach((a, i) => {
				var template =
					`<a href=""> <div class="col-sm-4">
			          <img src="${data[i].image}" id="box2">
			          <div class="info_box">
			            <h6 class="brand">${data[i].brand}</h6>
			            <h5 class="name">${data[i].title}</h5>
			            <p>가격 : ${data[i].price}</p>
			          </div>
			        </div> </a>`;
				$(".row").append(template);
			})
		})
	count++;
	if (count == 3) {
		console.log("여기까지")
	}
});

