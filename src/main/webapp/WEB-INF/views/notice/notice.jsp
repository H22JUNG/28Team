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

.thead .index{
	flex: 1;
}
.thead .title{
	flex: 7;
}
.thead .create{
	flex: 1;
}
.thead .view{
	flex: 1;
}

.important {
	background-color: #eaf7fb;
	font-weight: bold;
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

.tr .index{
	flex: 1;
}
.tr .title{
	text-align: left;
	flex: 7;
}
.tr .create{
	flex: 1;
	font-size: 13px;
}
.tr .view{
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
.null {
	display: flex;
    justify-content: center;
    align-items: center;
    height: 300px;
    border-top: 1px solid #CACACA;
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
				<div class="thead" id="thead">
					<div class="th index">번호</div>
					<div class="th title">제목</div>
					<div class="th create">작성일</div>
					<div class="th view">조회</div>
				</div>
				<c:forEach var="impvo" items="${impnotice}">
					<div class="tr important">
						<div class="td index">[공지]</div>
						<div class="td title"><a href="${pageContext.request.contextPath}/notice/${impvo.no}">${impvo.title}</a></div>
						<div class="td create">${impvo.createDate}</div>
						<div class="td view">${impvo.view}</div>
					</div>
				</c:forEach>
				<c:forEach var="vo" items="${notice}" varStatus="status">
					<div class="tr vo">
						<div class="td index">${page.total - page.start - status.index}</div>
						<div class="td title"><a href="${pageContext.request.contextPath}/notice/${vo.no}">${vo.title}</a></div>
						<div class="td create">${vo.createDate}</div>
						<div class="td view">${vo.view}</div>
					</div>
				</c:forEach>
				<c:if test="${notice.size() == 0}">
					<div class="null">작성된 글이 없습니다.</div>
				</c:if>
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
	var impids = new Array();
	var ids = new Array();
	</script>	
	<c:forEach items="${impnotice}" var="impvo">
	<script type="text/javascript">
	impids.push("${impvo.id}");
	</script>
	</c:forEach>
	<c:forEach items="${notice}" var="vo">
	<script type="text/javascript">
	ids.push("${vo.id}");
	</script>
	</c:forEach>
	
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
			location.href="${pageContext.request.contextPath}/writeNotice";
		});
		
		document.getElementById("delete").addEventListener("click",function(){
			
			const selectbox = document.querySelectorAll(".idck");
			for (var i = 0; i < selectbox.length; i++) {
				selectbox[i].remove();				
			}
			
			const selectbtn = document.querySelectorAll(".selectDelete");
			for (var i = 0; i < selectbtn.length; i++) {
				selectbtn[i].remove();				
			}
			
			const thead = document.getElementById("thead");
				let input = document.createElement("input");
				input.setAttribute("type", "checkbox");
				input.setAttribute("name","select-all");
				input.setAttribute("id","select-all");
				input.setAttribute("class","idck");
				input.setAttribute("checked",true);
				input.setAttribute("onchange", "selectAll()");
				thead.prepend(input);
			
			
			const importantDiv = document.getElementsByClassName("important");
			
			
			for (let i = 0; i < importantDiv.length; i++) {
									
				let input = document.createElement("input");
				input.setAttribute("type", "checkbox");
				input.setAttribute("name", "id");
				input.setAttribute("class", "idck");
				input.setAttribute("checked", true);
				input.setAttribute("id","impid"+impids[i]);
				input.setAttribute("value", impids[i]);
				importantDiv[i].prepend(input);
			}
			
			const voDiv = document.getElementsByClassName("vo");
			for (let i = 0; i < voDiv.length; i++) {
				let input = document.createElement("input");
				input.setAttribute("type", "checkbox");
				input.setAttribute("name", "id");
				input.setAttribute("class", "idck");
				input.setAttribute("checked", true);
				input.setAttribute("id","id"+ids[i]);
				input.setAttribute("value", ids[i]);
				voDiv[i].prepend(input);
			}
			
			const button = document.createElement("button");
			button.setAttribute("id","selectDelete");
			button.setAttribute("class","selectDelete");
			button.innerText = "선택삭제"
			document.querySelector(".update").prepend(button);
			
			document.getElementById("selectDelete").addEventListener("click",function(){
				if(confirm("정말 삭제하시겠습니까?")) {
					const checked = document.querySelectorAll("input[name=id]");
					var str = "";
					for (var i = 0; i < checked.length; i++) {
						if(checked[i].checked) {
							str += "id=";
							str += checked[i].value;
							str += "&";
						}			
					}
					
					location.href = "${pageContext.request.contextPath}/deleteNotice?"+str.slice(0, -1);
				};
			});
		});
		
		function selectAll() {
			let cks = document.querySelectorAll("input[name='id']");
			if(document.querySelector("#select-all").checked) {
				for (var i = 0; i < cks.length; i++) {
					cks[i].checked = true;
				}
			} else {
				for (var i = 0; i < cks.length; i++) {
					cks[i].checked= false;
				}
			}
		};
		
		
	</script>
</body>
</html>