<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	@font-face {
	font-family: 'DeogonPrincess';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/DeogonPrincess.woff2') format('woff2');
	font-weight: normal;
	font-style: normal;
	}
	@font-face {
    font-family: 'HSGyeoulNoonkott20';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/HSGyeoulNoonkott20.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body {
		display : flex;
 		justify-content : center;
  		align-items : center;
	}
	#container {
		display : flex;
 		justify-content : center;
  		
	}
	#container img {
		position: absolute;
		padding-top: 60px;
		width: 900px;
		height: 700px;
		opacity: 0.3;
	}
	#text {
		font-family: 'HSGyeoulNoonkott20';
		font-size: 30px;
		position: absolute;
		padding-top: 250px;
	}
	#a-tag-container {
		display: flex;
		justify-content: space-between;
	}
	#a-tag-container a {
		text-decoration: none;
	}
	#a-tag-container a:first-child {
		color: red;
	}
	#a-tag-container a:last-child {
		color: blue;
	}
</style>
<body>
	<div id="container">
		<img src="${pageContext.request.contextPath}/image/error404.jpg" alt="">
		<div id="text">
			<h1>잘못된 경로입니다.</h1>
			<div id="a-tag-container">
				<a href="#" id="back">뒤로가기</a>
				<a href="${pageContext.request.contextPath}/">홈으로 이동</a>
			</div>
		</div>
	</div>
	<script>
		document.getElementById("back").addEventListener("click", function() {
			window.history.back();
		});
	</script>
</body>
</html>