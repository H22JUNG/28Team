<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul, li {
	list-style-type: none;
}

a {
	text-decoration: none;
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
	background-color: #FFFAEE;
}

/* 헤더 */
header {
	background-color: #FFFAEE;
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

/* 마이페이지 */
main {
	background-color: #FFFAEE;
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
	width: 80%;
	justify-content: center;
	align-items: center;
}

/* 마이페이지 메뉴 */
main aside {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
	background-color: white;
	border-radius: 30px;
	margin: 20px;
	width: 300px;
}

main aside ul {
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 100%;
}

main aside ul li {
	padding: 15px 0 15px 0;
}

main aside .menu a {
	text-decoration: none;
	color: #000;
	margin: 20px 0 20px 0;
}

main aside .menu {
	border: 1px solid #F0F0F0;
	border-radius: 25px;
	width: 100%;
	padding: 10px;
	justify-content: space-between;
}

#sidemenulist h3 {
	text-align: center;
}

/* 내용 */
.content-box {
	width: 100%;
}

main section {
	flex: 1.2;
	height: 100%;
	padding: 30px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: white;
	border-radius: 30px;
	margin: 10px;
}
/* 본문 */
table {
	border-collapse: collapse;
}

th {
	color: black;
	padding: 10px 3px 10px 3px;
	border-bottom: 3px solid #616161;
	font-size : 14px;
}

#admin-email {
	margin-right: 50px;
}

td {
	border-bottom: 1px solid #616161;
	padding: 10px 3px 10px 3px;
	text-align: center;
	font-size : 14px;
}

.modify-btn {
	background: #21A5B5;
	padding: 5px;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}

#delete-btn{
	background: none;
	padding: 5px;
	border: 1px solid #21A5B5;
	color: #21A5B5;
	cursor: pointer;
	border-radius: 5px;
}

/* 컨텐츠 메뉴 */
.side-menu {
	display: flex;
}

.side-menu li {
	padding: 0 20px 0 20px;
}

.side-menu a {
	text-decoration: none;
	color: #21A5B5;
}

.admin-popup {
	display: none;
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
			<aside>
				<ul id="sidemenulist">
					<h3>관리자페이지</h3>
					<div class="menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpage/1?searchUser=&userInfo=">✔ 회원관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin_product_list" class="menu1">✔ 상품관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=1">✔ 주문관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-admin-list" class="menu1">✔
									관리자 정보수정</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="" id="admin-logout">✔ 로그아웃</a>
							</h4>
						</li>
					</div>
				</ul>
			</aside>
			<div class="content-box">
				<section>
					<ul class="side-menu">
						<li>
							<h4>
								<a href="">관리자 정보 수정</a>
							</h4>
						</li>
					</ul>
				</section>
				<section>
					<table>
						<thead>
							<tr>
								<th>관리자번호</th>
								<th>아이디</th>
								<th>관리자명</th>
								<th>연락처</th>
								<th>주소</th>
								<th id="admin-email">이메일</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.id}</td>
									<td>${vo.userid}</td>
									<td>${vo.username}</td>
									<td>${vo.tel}</td>
									<td>${vo.address}</td>
									<td>${vo.email}</td>
									<td><a
										href="${pageContext.request.contextPath}/admin_modify/${vo.id}"
										class="modify-btn">수정</a></td>
									<td>
									<a
										href="${pageContext.request.contextPath}/admin_delete/${vo.id}"
										id="delete-btn">삭제</a>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>

<script>
	//관리자 로그아웃
	document
			.getElementById("admin-logout")
			.addEventListener(
					"click",
					function() {
						let result = confirm("로그아웃 하시겠습니까?");
						if (result) {
							alert("로그아웃 되었습니다.");
							location.href = "${pageContext.request.contextPath}/admin-logout";
						}
					});
	
	//수정하기 버튼
	$(document).on('click', '#delete-btn', function() {
		let result = confirm("삭제하시겠습니까?")
		if (result){
			alert("해당 관리자가 삭제되었습니다.")
		}else{

		}
	})
</script>
</html>