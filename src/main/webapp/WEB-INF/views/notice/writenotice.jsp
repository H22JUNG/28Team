<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style>
main {
	display: flex;
	justify-content: center;
	padding: 50px;
}

.container {
	margin: 0 auto;
	width: 60%;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.container .head {
	display: flex;
}

.container .head h1 {
	flex: 1;
}

.container .head nav {
	display: flex;
	align-items: center;
}

.container .head nav ul {
	display: flex;
	gap: 5px;
}

.title {
	border-top: 3px solid #D9D9D9;
	padding: 10px;
	border-bottom: 2px solid #D9D9D9;
}

.title>input[type="text"] {
	border: 0;
}

.info {
	border-top: 1px solid #D9D9D9;
	border-bottom: 1px solid #D9D9D9;
	padding: 10px;
}

.title, .info {
	display: flex;
	gap: 30px;
}

.title span, .info span {
	width: 50px;
	font-weight: bold;
}

.content {
	padding: 50px 20px;
	min-height: 50vh;
}

.content #content {
	width: 100%;
	height: 100%;
	border: 0;
}

#golist {
	display: inline-block;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
	cursor: pointer;
}

.prev, .next {
	border: 1px solid #D9D9D9;
	display: flex;
	gap: 10px;
	align-items: center;
}

.prev span, .next span {
	display: inline-block;
	border-right: 1px solid #D9D9D9;
	padding: 10px;
	cursor: pointer;
}

.prev p, .next p {
	cursor: pointer;
}

.prev p:hover, .next p:hover {
	text-decoration: underline;
}

.update {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	padding: 10px 0;
}

.update button {
	background-color: white;
	border: 1px solid #CACACA;
	color: #21A5B5;
	cursor: pointer;
	outline: none;
	padding: 8px 10px;
	font-size: 15px;
}

.update button:active {
	background-color: #eaf7fb;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<form action="${pageContext.request.contextPath}/insertNotice"
		method="post">
		<main>
			<div class="container">
				<div class="head">
					<h1>공지사항</h1>
					<nav>
						<ul>
							<li><a href="${pageContext.request.contextPath}/">홈</a></li>
							<li>〉</li>
							<li>공지사항</li>
						</ul>
					</nav>
				</div>
				<div class="content-box">
					<div class="title">
						<span>제목</span><input type="text" name="title" id="title"
							value="${notice.title}" />
					</div>
					<div class="content">
						<textarea rows="" cols="" id="content" name="content"
							onkeydown="resize" onkeyup="resize">${notice.content}</textarea>
					</div>

					<div class="buttons">
						<c:if test="${admin != null}">
							<div class="update">
								<button id="update">글쓰기</button>
							</div>
						</c:if>
					</div>
				</div>

				<div class="controll">
					<div class="prev">
						<span>이전 페이지</span>
						<p>
							<a
								href="${pageContext.request.contextPath}/notice/${prevnotice.no}">${prevnotice.title}</a>
						</p>
					</div>
					<div class="next">
						<span>다음 페이지</span>
						<p>
							<a
								href="${pageContext.request.contextPath}/notice/${nextnotice.no}">${nextnotice.title}</a>
						</p>
					</div>
				</div>
			</div>
		</main>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
		document.getElementById("golist").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/notice";
		});

		function resize() {
			let textarea = document.querySelector('#content');

			if (textarea.scrollHeight > document.querySelector(".content").offsetHeight) {
				textarea.style.height = 'auto';
				let height = textarea.scrollHeight; // 높이
				textarea.style.height = `${height + 8}px`;
			}
		};

		
		
	</script>
</body>
</html>