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

/*main*/
main {
	background-color: white;
	position: relative;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
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
	width: 95%;
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
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 14px;
}

.btn_wrap a.on {
	background: #000;
	color: #fff;
}

.qna_list {
	width: 100%;
	border-top: 2px solid #000;
}

.qna_list>th, td {
	border-bottom: 1px solid #ddd;
}

.top th {
	border-bottom: 2px solid #999;
	font-size: 15px;
}

.qna_list {
	border-bottom: 2px solid #000;
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

.qna_page a.page.on {
	border-color: #000;
	background: #000;
	color: #fff;
}
</style>
</head>
<body>
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
							<c:forEach var="vo" items="${qnaVO1}">
								<tr>
									<td class="num">${vo.id}</td>
									<td class="category">${vo.qnaCategory}</td>
									<td class="title">
										<a href="${pageContext.request.contextPath}/inner_qna/${vo.id}">
											${vo.title} 
											<%-- <c:if test="${vo.reply_count ne 0}">--%>
												<small><b>(&nbsp;<c:out value="${vo.replyCount}"/>&nbsp;)</b></small>
											<%-- </c:if>--%>
										</a>
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
					<%-- <c:if test="${qnaVO.ownerId eq userVO.id}"> --%>
					<a href="${pageContext.request.contextPath}/inner_write" class="on">문의하기</a>
					<%-- </c:if> --%>
				</div>

				<!--페이지번호-->
				<div class="qna_page">
					<a href="#" class="btn first"><<</a> <a href="#" class="btn prev"><</a>
					<a href="#" class="page on">1</a> <a href="#" class="page">2</a> <a
						href="#" class="page">3</a> <a href="#" class="page">4</a> <a
						href="#" class="page">5</a> <a href="#" class="btn next">></a> <a
						href="#" class="btn last">>></a>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">

	</script>
</body>
</html>