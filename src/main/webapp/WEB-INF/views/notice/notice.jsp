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
.container .head{
	display:flex;
}
.container .head h1{
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

.thead {
	display: flex;
	border-top: 3px solid #21A5B5;
	padding: 10px;
	gap: 20px;
}

.thead .th {
	text-align: center;
}

.thead .th:nth-child(1){
	flex: 1;
}
.thead .th:nth-child(2){
	flex: 7;
}
.thead .th:nth-child(3){
	flex: 1;
}
.thead .th:nth-child(4){
	flex: 1;
}

.important {
	background-color: #eaf7fb;
}

.tr {
	display: flex;
	border-top: 1px solid #CACACA;
	padding: 5px;
	gap: 20px;
}
.tr:last-child {
	border-bottom: 1px solid #CACACA;
}

.tr .td {
	text-align: center;
}

.tr .td:nth-child(1){
	flex: 1;
}
.tr .td:nth-child(2){
	text-align: left;
	flex: 7;
}
.tr .td:nth-child(3){
	flex: 1;
	font-size: 13px;
}
.tr .td:nth-child(4){
	flex: 1;
}

.tr, .th {
	display: flex;
	justify-content:center;
	align-items: center;
}

/* 글쓰기, 삭제 */
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

/* 페이징 */
.paging {
	display: flex;
	justify-content: center;
}

.paging div {
	border-top: 1px solid #CACACA;
	border-bottom: 1px solid #CACACA;
	border-left: 1px solid #CACACA;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 26px;
    height: 26px;
    cursor: default;
}
.paging div:last-child {
	border-right: 1px solid #CACACA;
}

.paging div a {
	display: block;
	width: 100%;
    height: 100%;
    display: flex;
	justify-content: center;
	align-items: center;
	color: #21A5B5;
	cursor: pointer;
}
.paging div>a:active {
	background-color: #eaf7fb;
}

/* 검색 */
.search-box {
	display: flex;
	align-items: center;
	gap: 10px;
}

input,select {
	border: 1px solid #d5d5d5;
    color: #353535;
    font-size: 12px;
    background-color: white;
    height: 24px;
	outline: none;
}
input[type="text"] {
	padding: 0 4px;
}
#search-btn {
	height: 24px;
	padding: 2px 8px;
	background-color: white;
	border: 1px solid #CACACA;
	color: #21A5B5;
	cursor: pointer;
	outline: none;
}
#search-btn:active {
	background-color: #eaf7fb;
}

</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
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
			<div class="table">
				<div class="thead">
					<div class="th">번호</div>
					<div class="th">제목</div>
					<div class="th">작성일</div>
					<div class="th">조회</div>
				</div>
				<c:forEach var="impvo" items="${impnotice}">
					<div class="tr important">
						<div class="td">[공지]</div>
						<div class="td"><a href="${pageContext.request.contextPath}/notice/${impvo.no}">${impvo.title}</a></div>
						<div class="td">${impvo.createDate}</div>
						<div class="td">${impvo.view}</div>
					</div>
				</c:forEach>
				<c:forEach var="vo" items="${notice}" varStatus="status">
					<div class="tr">
						<div class="td">${page.total - page.start - status.index}</div>
						<div class="td"><a href="${pageContext.request.contextPath}/notice/${vo.no}">${vo.title}</a></div>
						<div class="td">${vo.createDate}</div>
						<div class="td">${vo.view}</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${admin != null}">
			<div class="update">
				<button id="delete">삭제</button>
				<button id="write">글쓰기</button>
			</div>
			</c:if>
			<div class="paging">
				<c:choose>
					<c:when test="${page.nowPage == 1}">
						<div>〈〈</div>
					</c:when>
					<c:when test="${page.nowBlock == 1}">
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.startPage}">〈〈</a></div>			
					</c:when>
					<c:when test="${page.nowPage == page.startPage}">
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage - page.cntPerBlock}">〈〈</a></div>			
					</c:when>
					<c:otherwise>
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage - page.cntPerBlock + (page.endPage - page.nowPage)}">〈〈</a></div>			
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${page.nowPage == 1}">
						<div>〈</div>					
					</c:when>
					<c:otherwise>
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage - 1}">〈</a></div>					
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
					<c:choose>
						<c:when test="${i == page.nowPage}">
							<div class="pagebox">${i}</div>
						</c:when>
						<c:otherwise>
							<div class="pagebox"><a href="${pageContext.request.contextPath}/notice?page=${i}">${i}</a></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page.nowPage == page.totalPage}">
						<div>〉</div>					
					</c:when>
					<c:otherwise>
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage + 1}">〉</a></div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.nowPage == page.totalPage}">
						<div>〉〉</div>					
					</c:when>
					<c:when test="${page.nowBlock == page.totalBlock}">
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.endPage}">〉〉</a></div>
					</c:when>
					<c:when test="${page.nowPage == page.endPage}">
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage + page.cntPerBlock}">〉〉</a></div>
					</c:when>
					<c:otherwise>
						<div><a href="${pageContext.request.contextPath}/notice?page=${page.nowPage + page.cntPerBlock - (page.nowPage - page.startPage)}">〉〉</a></div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="search-box">
			<select name="option" id="option">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="keyword">제목+내용</option>
			</select>
			<input type="text" name="search" id="search" value="${page.search}"/>
			<button id="search-btn">검색</button>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		const pagebox = document.querySelectorAll(".pagebox");
		for (var i = 0; i < pagebox.length; i++) {
			if(pagebox[i].innerText == ${page.nowPage}) {
				pagebox[i].style.backgroundColor = "#eaf7fb";
			}			
		}
		
		const option = document.getElementById("option");
		for (var i = 0; i < option.length; i++) {
			if(option.options[i].value == '${page.option}') {
				option.options[i].selected = true;
			}
		}
		
		document.getElementById("search-btn").addEventListener("click", function(){
			const selected = option.options[option.selectedIndex].value;
			const search = document.getElementById("search").value;
			location.href="${pageContext.request.contextPath}/notice?option="+selected+"&search="+search;
		});
		
		if('${page.search}' != null && '${page.option}' != null) {
			const paging = document.querySelectorAll(".paging div a");
			for (var i = 0; i < paging.length; i++) {
				let str = paging[i].getAttribute('href')+'&option='+'${page.option}'+'&search='+'${page.search}';
				paging[i].setAttribute('href',str);
			}
		};
		
		document.getElementById("write").addEventListener("click",function() {
			location.href="${pageContext.request.contextPath}/writenotice";
		});
	</script>
</body>
</html>