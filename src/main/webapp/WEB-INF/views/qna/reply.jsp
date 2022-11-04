<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul, li {
	list-style-type: none;
}

body {
	background:
		url("${pageContext.request.contextPath}/image/KakaoTalk_20221013_170149504.webp")
		0% 300% fixed;
	background-size: cover;
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	z-index: 0;
}

/* 헤더 */
header {
	background-color: white;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-width: 1200px;
}

header .header-top {
	display: flex;
	width: 100%;
	justify-content: flex-end;
}

header .header-top .logo img {
	width: 265px;
}

header .header-top .logo {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

header .header-top .side {
	position: absolute;
}

header .header-top .side ul {
	display: flex;
	gap: 10px;
	margin: 10px;
}

/* 카테고리 */
header .category {
	padding: 10px 20px;
	width: 100%;
}

header .category ul {
	display: flex;
	gap: 30px;
}

header .category ul li {
	display: flex;
	justify-content: center;
	align-items: center;
}

header .category ul li:first-child {
	background: #FFECC8;
	border-radius: 10px;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	padding: 5px 15px 7px;
	gap: 10px;
}

/*main*/
main {
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	min-width: 1200px;
}

main .mypage-container {
	display: flex;
	flex-direction: column;
	width: 80%;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: inherit;
}

.qna_wrap {
	width: 1000px;
	margin: 100px auto;
}

.qna_title {
	margin-bottom: 30px;
}

.qna_title strong {
	font-size: 30px;
}

.qna_title p {
	margin-top: 5px;
	font-size: 14px;
}

.btn_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
	right: 0;
}

.btn_wrap button {
	display: inline-block;
	text-align: center;
	margin-left: 10px;
	min-width: 80px;
	padding: 10px;
	border: 1px solid #21A5B5;
	border-radius: 5px;
	font-size: 14px;
	background: none;
	color : #21A5B5;
}

.btn_wrap button.on {
	background: #21A5B5;
	color: #fff;
}

.qna_write {
	border-top: 2px solid #21A5B5;
}

.qna_write .title, .qna_write .info, .qna_write .password {
	padding: 15px;
}

.qna_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.qna_write .info dl {
	display: inline-block;
	vertical-align: middle;
	margin-right: 100px;
}

.qna_wrap .info #title_d {
	width: 435px;
}

.qna_wrap .info #owner_d {
	width: 120px;
}

.qna_write .title, .qna_write .password{
	border-top: 1px dashed #ddd;
	font-size: 0;
}

.qna_write .title dl, .qna_write .password dl{
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.qna_write .title dt, .qna_write .title dd, .qna_write .info dt,
	.qna_write .info dd, .qna_write .password dt,
	.qna_write .password dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 14px;
}

.qna_write .title dt, .qna_write .info dt, .qna_write .password dt {
	width: 100px;
}

.qna_write .info dd {
	width: calc(100% - 100px);
}

/* .qna_write .title input[type="text"]{width: 80%;} */
.qna_write .title dl, .qna_write .password dl {
	font-size: 0;
}

.qna_write .cont {
	border-bottom: 1px solid #21A5B5;
}

.qna_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}
</style>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png"
					alt=""></a>
			</div>
			<div class="side">
				<ul>
					<li><a href=""><img src="" alt="">검색</a></li>
					<li><a href=""><img src="" alt="">장바구니</a></li>
					<li><a href="${pageContext.request.contextPath}/loginpage">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				</ul>
			</div>
		</div>
		<nav class="category">
			<ul>
				<li>Category</li>
				<li>가구</li>
				<li>패브릭</li>
				<li>수납용품</li>
				<li>생활용품</li>
				<li>공지사항</li>
				<li>Q&A</li>
				<li>이벤트</li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="mypage-container">
			<div class="qna_wrap">
				<div class="qna_title">
					<strong>Q&A</strong>
					<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<div class="qna_write_wrap">
					<div class="qna_write">
					<form:form modelAttribute="qnaVO" action="${pageContext.request.contextPath}/reply/good" method="post">
						<div class="title">
							<dl>
								<dt>작성자</dt>
								<dd>
									관리자
								</dd>
							</dl>
						</div>
						<div class="password">
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<input type="password" name="password" id="" value="${qnaVO.password}"/>
									<input type="hidden" name="root" id="root" value="${qnaVO.id}">
									<input type="hidden" name="qnaCategory" id="qnaCategory" value="${qnaVO.qnaCategory}">
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>제목</dt>
								<dd>
									Re: ${qnaVO.title}
									<input type="hidden" name="title" id="" value="Re: ${qnaVO.title}"/>
								</dd>
							</dl>
						</div>
						<div class="cont">
							<form:textarea path="content"/>
						</div>
					<div class="btn_wrap">
						<button class="on" id="acc">답변등록</button>
						<button type="button" id="cancel">취소</button>
					</div>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>

	<script type="text/javascript">
	
		document
				.getElementById("acc")
				.addEventListener(
						"click",
						function() {
							let result = confirm("게시글을 등록하시겠습니까?");
							if (result == true) {
								confirm("등록되었습니다.");
								location.href = "${pageContext.request.contextPath}/reply/good";
							}
		});
		
		document
		.getElementById("cancel")
		.addEventListener(
				"click",
				function() {
					let result = confirm("게시글 작성을 취소하시겠습니까?");
					if (result == true) {
						confirm("취소되었습니다.");
						location.href = "${pageContext.request.contextPath}/qna";
					}
	});
		
	</script>
</body>
</html>