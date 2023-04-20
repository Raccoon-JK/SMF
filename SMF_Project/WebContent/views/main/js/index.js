/**
 * 메인페이지 js
 */

/**
 * 오프닝 js
 */

$('.opening_button').click(function() {
	$(".Openning").attr("hidden", true);
});

var video = document.getElementById("myVideo");
$(document).ready(function() {
	video.play();
});

function setCookie(name, value, days) {
	var expires = "";
	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toUTCString();
	}
	document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

function getCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ')
			c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) == 0)
			return c.substring(nameEQ.length, c.length);
	}
	return null;
}

var closeBtn = document.getElementById("closeBtn");
var dontShowAgain = document.getElementById("dontShowAgain");

closeBtn.onclick = function() {
	$(".Openning").attr("hidden", true);
}

dontShowAgain.onclick = function() {
	setCookie("dontShowAgain", "true", 1); // 1 day expiration
	$(".Openning").attr("hidden", true);
}

$(document).ready(function() {
	var dontShowAgain = getCookie("dontShowAgain");
	if (dontShowAgain) {
		$(".Openning").attr("hidden", true);
	} else {
		var video = document.getElementById("myVideo");
		video.play();
	}
});


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
 * 상품 페이지
 */

$(document).ready(function() {
	$.get("/SMF_Project/Product.pr")
		.done((data) => {
			data.forEach((a, i) => {
				var template =
					`<a class="product_container" href=""> <div class="col-sm-9">
			          <img src="${data[i].image}" id="box2">
			          <div class="info_box">
			            <h6 class="brand">${data[i].brand}</h6>
			            <p class="name">${data[i].title}</p>
			            <p>가격 : ${data[i].price} 원</p>
			          </div>
			        </div> </a>`;
				$(".row").append(template);
			})
		})
});


/**
 * 더보기 기능
 */

var count = 2;
var url2 = "http://localhost:8080/SMF_Project/MoreProduct.pr?currentCount="

$('#more').click(function() {
	$.get(url2.concat(count))
		.done((data) => {
			data.forEach((a, i) => {
				var template =
					`<a class="product_container" href=""> <div class="col-sm-9">
			          <img src="${data[i].image}" id="box2">
			          <div class="info_box">
			            <h6 class="brand">${data[i].brand}</h6>
			            <p class="name">${data[i].title}</p>
			            <p>가격 : ${data[i].price} 원</p>
			          </div>
			        </div> </a>`;
				$(".row").append(template);
			})
		})
	count += 1;
});


/**
 * 스타일 스와이퍼
 */

$(document).ready(function() {
	$.get("/SMF_Project/Style.st")
		.done((data) => {
			data.forEach((a, i) => {
				var template =
					`<div class="swiper-slide style"> 
						<div class="style-pro">
							<a><img src="${data[i].userImg}"></a>
						</div>
						<div class="style-main">
							<a><img src="${data[i].image}"></a>
						</div>
			          	<p class="userId">${data[i].id}</p>
			        </div>`;
				$(".row2").append(template);
			})
		})
});


/**
 * 알림 기능
 */

$(document).ready(function() {
	$.get("/SMF_Project/Notice.no")
		.done((data) => {
			if (data.length > 0) {
				data.forEach((a, i) => {
					var template = `<tr class="alarm-row"><td class="cell-padding">${data[i].title}</td></tr>`;
					$(".alarm-list").append(template);
					$(".red-dot").removeAttr("hidden");
				});
			} else {
				// 데이터가 없는 경우
				$(".no-alarm").removeAttr("hidden");
			}
		})
		.fail(() => {
			// 데이터를 받아오지 못한 경우
			$(".no-alarm").removeAttr("hidden");
		});
});


$('.view_more').click(function() {
	$(".red-dot").attr("hidden", true);
});


