<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style>
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
	min-width: 500px;
}

main .mypage-container {
	display: flex;
	flex-direction: column;
	width: 70%;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: inherit;
}

.qna_wrap {
	width: 100%;
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
	text-align: left;
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
	border-radius: 5px;
	font-size: 14px;
	color: #21A5B5
}

.btn_wrap a.on {
	background: #21A5B5;
	color: #fff;
}

.qna_content {
	width: 100%;
	border-top: 2px solid #21A5B5;
}

.qna_content .title {
	padding: 20px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 20px;
}

.qna_content .info {
	padding: 15px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.qna_content .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.qna_content .info dl:first-child {
	padding-left: 0;
}

.qna_content .info dl::before {
	content: "";
	position: absolute;
	top: 6px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.qna_content .info dl:first-child:before {
	display: none;
}

.qna_content .info dl dt {
	display: inline-block;
	font-size: 14px;
}

.qna_content .info dl dd {
	display: inline-block;
	font-size: 14px;
	margin-left: 10px;
	color: #777;
}

.qna_content .cont {
	padding: 15px;
	border-bottom: 1px solid #21A5B5;
	line-height: 160%;
	font-size: 14px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		<div class="mypage-container">
			<div class="qna_wrap">
				<div class="qna_title">
					<strong>Q&A</strong>
					<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<div class="qna_content_wrap">
					<div class="qna_content">
						<c:choose>
							<c:when test="${qnacommentVO.getIndent()>0}">
								<div class="title">${qnacommentVO.title}</div>
								<div class="info">
									<dl>
										<dt>NO.</dt>
										<dd>${qnacommentVO.id}</dd>
									</dl>
									<dl>
										<dt>작성자</dt>
										<dd>${qnacommentVO.owner}</dd>
									</dl>
									<dl>
										<dt>작성일</dt>
										<dd>${qnacommentVO.createDate}</dd>
									</dl>
									<dl>
										<dt>조회</dt>
										<dd>${qnacommentVO.hits}</dd>
									</dl>
								</div>
								<div class="cont">${qnacommentVO.content}</div>
								<div class="btn_wrap">
									<a href="${pageContext.request.contextPath}/qna" class="on"
										id="return">목록으로</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="title">${qnaVO.title}</div>
								<div class="info">
									<dl>
										<dt>NO.</dt>
										<dd>${qnaVO.id}</dd>
									</dl>
									<dl>
										<dt>작성자</dt>
										<dd>${qnaVO.owner}</dd>
									</dl>
									<dl>
										<dt>작성일</dt>
										<dd>${qnaVO.createDate}</dd>
									</dl>
									<dl>
										<dt>조회</dt>
										<dd>${qnaVO.hits}</dd>
									</dl>
								</div>
								<div class="cont">${qnaVO.content}</div>

								<!--버튼-->
								<div class="btn_wrap">
									<a href="${pageContext.request.contextPath}/qna" class="on"
										id="return">목록으로</a>

									<c:choose>
										<c:when test="${qnaVO.ownerId eq user.id || user.admin == 1}">
											<a href="#" id="modify">수정</a>
										</c:when>
										<c:otherwise>
											<a href="#" id="modify" style="display: none">수정</a>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${qnaVO.ownerId eq user.id || user.admin == 1}">
											<a href="#" id="del">삭제</a>
										</c:when>
										<c:otherwise>
											<a href="#" id="del" style="display: none">삭제</a>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${user.admin == 1}">
											<a class="btn-fill"
											href="${pageContext.request.contextPath}/reply?id=${qnaVO.id}"
											id="rep">답변</a>
										</c:when>
										<c:otherwise>
											<a class="btn-fill"
											href="${pageContext.request.contextPath}/reply?id=${qnaVO.id}"
											id="rep" style="display: none">답변</a>
										</c:otherwise>
									</c:choose>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>


			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
		document.getElementById("return").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/qna";
		});

		document
				.getElementById("modify")
				.addEventListener(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/update/${qnaVO.id}";
						})
		document
				.getElementById("del")
				.addEventListener(
						"click",
						function() {
							let result = confirm("정말로 삭제하시겠습니까?");
							if (result) {
								location.href = "${pageContext.request.contextPath}/remove/${qnaVO.id}";
							}
						});

		document.getElementById("rep").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/reply";
		});
	</script>
</body>
</html>