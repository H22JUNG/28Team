<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 14px;
	background : none;
}

.btn_wrap button.on {
	background: #000;
	color: #fff;
}

.qna_write {
	border-top: 2px solid #000;
}

.qna_write .title, .qna_write .info {
	padding: 15px;
}

.qna_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
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
	width: 130px;
}

.qna_write .title {
	border-top: 1px dashed #ddd;
	font-size: 0;
}

.qna_write .title dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.qna_write .title select {
	width: 200px;
	padding: 10px;
}

.qna_write .title dt, .qna_write .title dd, .qna_write .info dt,
	.qna_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 14px;
}

.qna_write .title dt, .qna_write .info dt {
	width: 100px;
}

.qna_write .info dd {
	width: calc(100% - 100px);
}

.qna_info .title input[type="text"], .qna_write .info input[type="text"],
	.qna_write .title input[type="password"] {
	padding: 10px;
	box-sizing: border-box;
}
/* .qna_write .title input[type="text"]{width: 80%;} */
.qna_write .title dl {
	font-size: 0;
}

.qna_write .cont {
	border-bottom: 1px solid #000;
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
					<form:form modelAttribute="qnaVO" action="${pageContext.request.contextPath}/inner_update" method="post">
					<%--<form action="${pageContext.request.contextPath}/update" method ="post"> --%>
						<div class="title">
							<dl>
								<dt>문의유형</dt>
								<dd>
									<form:hidden path="id"/>
									<form:select path="qnaCategory">
										<form:options items="${categoryList}"/>
									</form:select>
									<%-- <select name="quest_select" id="">
									<c:forEach var="vo" items="${categoryList}">
										<option value="${vo}">${vo}</option>
									</c:forEach>
									</select>--%>
								</dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<form:textarea path="password" maxlength="4"/>
									<%-- <input type="password" name="" id="" placeholder="패스워드 입력"
										value="${qnaVO.password}" maxlength="4">--%>
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>제목</dt>
								<dd>
									<form:textarea path="title" id="title_d"/>
									<%-- <input type="text" name="" id="title_d" placeholder="제목 입력"
										value="${qnaVO.title}">--%>
								</dd>
							</dl>
							<dl>
								<dt>작성자</dt>
								<dd>
									${qnaVO.owner}
								</dd>
							</dl>
						</div>
						<div class="cont">
							<form:textarea path="content"/>
						</div>
						<!--버튼-->
					<div class="btn_wrap">
					<button class="on" id="btn1">수정완료</button>
					<button type="button" id="btn2">취소</button>
					</div>
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>
	
	<script type="text/javascript">
		document.getElementById("btn1").addEventListener("click",function() {
							alert("수정이 완료되었습니다.")
							location.href = "${pageContext.request.contextPath}/inner_update";
						});
		
		document.getElementById("btn2").addEventListener("click",function() {
			location.href = "${pageContext.request.contextPath}/inner_qna/${vo.id}";
		});
	</script>
</body>
</html>