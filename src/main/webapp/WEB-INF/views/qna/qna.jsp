<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	text-align: right;
	font-size: 0;
	right: 0;
}

.btn_wrap a {
	display: inline-block;
	text-align: center;
	margin-left: 10px;
	min-width: 80px;
	padding: 10px;
	border: 1px solid #21A5B5;
	border-radius: 2px;
	font-size: 14px;
}

.btn_wrap a.on {
	background: #21A5B5;
	color: #fff;
}

.qna_list {
	width: 100%;
	border-top: 3px solid #21A5B5;
}

.qna_list>th, td {
	border-bottom: 1px solid #ddd;
}

/*.top th {
	border-bottom: 2px solid #999;
	font-size: 15px;
}*/

.qna_list {
	border-bottom: 3px solid #21A5B5;
	 border-collapse: collapse
}

.qna_list tr>td {
	text-align: center;
}

.qna_list .num, .count {
	width: 5%;
}

.qna_list .writer {
	width: 10%;
}

.qna_list .category, .date {
	width: 15%;
}

.qna_list .title {
	width: 50%;
}

.qna_list tbody .title {
	text-align: left;
	padding-left: 30px;
}

.qna_list th, td {
	padding: 15px 0;
}

.top tr{
	border-bottom: 1px solid #21A5B5;
}
/*페이지번호*/
.qna_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.qna_page a {
	display: inline-block;
	width: 32px;
	box-sizing: border-box;
	height: 32px;
	border: 1px solid #ddd;
	border-left: 0;
	vertical-align: middle;
	line-height: 100%;
}

.qna_page a.btn {
	font-size: 12px;
	padding-top: 10px;
	letter-spacing: -1px;
}

.qna_page a.page {
	font-size: 14px;
	padding-top: 9px;
}

.qna_page a:first-child {
	border-left: 1px solid #ddd;
}

.qna_page a {
	color: #21A5B5;
}

.qna_page a.page.on {
	border-color: #21A5B5;
	background: #21A5B5;
	color: #fff;
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
				<div class="qna_list_wrap">
					<table class="qna_list">
						<thead class="top">
							<tr>
								<th class="num">NO</th>
								<th class="category">문의유형</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="date">작성일</th>
								<th class="count">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${list}">
								<tr>
									<td class="num">${vo.id}</td>
									<td class="category">${vo.qnaCategory}</td>
									<td class="title">
										<c:if test="${Comme}">
											<c:forEach var="i" begin="1" end="${vo.getIndent()}">
               									&nbsp;&nbsp;&nbsp;
              								</c:forEach>
                             					↳
             							</c:if> 
             							<a href="${pageContext.request.contextPath}/qna/${vo.id}">${vo.title}</a>
									</td>
									<td class="writer">${vo.owner}</td>
									<td class="date">${vo.createDate}</td>
									<td class="count">${vo.hits}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!--버튼-->
				<div class="btn_wrap">
					<c:if test="${user != null}">
						<a href="${pageContext.request.contextPath}/write" class="on">문의하기</a>
					</c:if>
				</div>

				<!--페이지번호-->
				<div class="qna_page">
					<c:choose>
						<c:when test="${1 == page.startPage}">
							<a href="#" class="btn first"><<</a> 
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna?page=${page.startPage - 1}"><<</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${1 == page.nowPage}">
							<a href="#" class="btn prev"><</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna?page=${page.nowPage - 1}"><</a>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<c:choose>
							<c:when test="${page.nowPage eq i}">
								<a href="#" class="page on">${i}</a> 
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/qna?page=${i}" class="page">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${page.totalPage == page.nowPage}">
							<a href="#" class="btn next">></a> 
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna?page=${page.nowPage + 1}">></a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPage < page.endPage+page.cntPerBlock}">
							<a href="#" class="btn last">>></a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna?page=${page.endPage + 1}">>></a>
						</c:otherwise>
					</c:choose>									
				</div>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
</html>