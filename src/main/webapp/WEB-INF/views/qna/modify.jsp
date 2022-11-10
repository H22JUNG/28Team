<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	border-radius: 2px;
	font-size: 14px;
	background : none;
	color : #21A5B5
}

.btn_wrap button.on {
	background: #21A5B5;
	color: #fff;
}

.qna_write {
	border-top: 2px solid #21A5B5;
}

.qna_write .title, .qna_write .info {
	padding: 15px;
}

.qna_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #21A5B5;
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

.qna_write .title select, .qna_write .info input,
	.qna_write .title input[type="password"] {
	padding: 10px;
	box-sizing: border-box;
}

.qna_write .title select:focus, .qna_write .info input:focus,
	.qna_write .title input[type="password"]:focus, .cont textarea:focus{
	outline: 2px solid #21A5B5;
	border: none;
	border-radius : 5px;
}
/* .qna_write .title input[type="text"]{width: 80%;} */
.qna_write .title dl {
	font-size: 0;
}

.qna_write .cont {
	border-bottom: 2px solid #21A5B5;
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
	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		<div class="mypage-container">
			<div class="qna_wrap">
				<div class="qna_title">
					<strong>Q&A</strong>
					<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<div class="qna_write_wrap">
					<div class="qna_write">
					<form:form modelAttribute="qnaVO" id="myform" action="${pageContext.request.contextPath}/update" method="post">
						<div class="title">
							<dl>
								<dt>문의유형</dt>
								<dd>
									<form:hidden path="id"/>
									<form:select path="qnaCategory">
										<form:options items="${categoryList}"/>
									</form:select>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<input type="password" name="password" id="" value="${qnaVO.password}" maxlength="4"/>
								</dd>
							</dl>
						</div>
						<div class="info">
							<dl>
								<dt>제목</dt>
								<dd>
									<form:input path="title" id="title_d"/>
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
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
 		document.getElementById("btn1").addEventListener("click",function() {
			if ( confirm("게시글을 수정하시겠습니까?") ) {
				$("#myform").submit();
			}				
		}); 
		
		document.getElementById("btn2").addEventListener("click",function() {
			if ( confirm("수정을 취소하시겠습니까?") ) {
			location.href = "${pageContext.request.contextPath}/qna/${qnaVO.id}";
			}
		});
	</script>
</body>
</html>