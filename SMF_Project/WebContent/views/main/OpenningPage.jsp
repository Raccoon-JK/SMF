<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OpenningPage</title>
<style>
.openning{
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
	width: 715px;
	height: 510px;
	background-color: gray;
	position: absolute;
	top: 80px;
	left: 430px;
}
</style>
</head>
<body>
<div class="openning">
	<div class="video_frame"></div>
</div>
</body>
</html>