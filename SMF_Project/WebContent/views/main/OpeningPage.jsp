<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OpeningPage</title>
<style>
.opening {
	background-image: url("resources/main/closet1.webp");
	background-size: cover;
	position: fixed;
	width: auto;
	height: 100vh;
	top: 0;
	left: 0;
	right: 0;
	z-index: 100001;
}

.video_frame {
	width: 730px;
	height: 410px;
	background-color: gray;
	position: absolute;
	top: 80px;
	left: 430px;
}

.opening_title {
	width: 400px;
	height: 105px;
	position: absolute;
	bottom: 374px;
	left: 760px;
	background-color: rgb(198, 202, 196);
	border: inset 5px;
	text-align: center;
}

.opening_button {
	background-color: rgb(135, 98, 75);
	width: 280px;
	height: 95px;
	position: absolute;
	bottom: 193px;
	left: 450px;
	border-radius: 10px;
	border: inset 5px;
	border-color: rgb(216, 156, 107) rgb(78, 52, 38);
	color: rgb(234, 214, 158);
	font-size: 30px;
	font-weight: bolder;
	color: rgb(234, 214, 158);
	border-color: rgb(216, 156, 107) rgb(78, 52, 38);
	color: rgb(234, 214, 158);
}

::-webkit-scrollbar {
	display: none;
}

video {
	max-width: 100%;
	max-height: 100%;
	autoplay: autoplay;
}

.show_check {
	position: absolute;
	top: 30px;
	left: 50px;
}
</style>
</head>
<body>
	<div class="opening">
		<div class="video_frame">
			<video id="myVideo" autoplay controls>
				<source src="resources/main/Wildlife.webm" type="video/webm">
			</video>
		</div>
		<div class="opening_title">
			구해줘패션 (로고삽입 예정)
		</div>
		<button class="opening_button" id="closeBtn">시작하기</button>
		<div class="show_check">
			<input type="checkbox" id="dontShowAgain"> <label
				for="dontShowAgain">하루 동안 다시 보지 않기</label>
		</div>
	</div>

</body>
</html>