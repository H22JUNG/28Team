<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<style type="text/css">
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
	width: 80%;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: inherit;
}

.qna_wrap {
	display: flex;
	flex-direction: column;
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

.qna_list {
	border-bottom: 3px solid #21A5B5;
	 border-collapse: collapse
}

.qna_list tr>td {
	text-align: center;
}

.qna_list .writer {
	width: 10%;
}

.qna_list .category, .date {
	width: 18%;
}

.qna_list .title {
	width: 47%;
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
}

.qna_page a {
	display: inline-block;
	width: 32px;
	box-sizing: border-box;
	height: 32px;
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

.qna_page a {
	color: #21A5B5;
}

.qna_page a.page.on {
	border-color: #21A5B5;
	background: #21A5B5;
	color: #fff;
}

#modal{
	background-color: white;
	position : fixed;
	top : 30%;
	left : 33%;
	width : 22%;
	height : 16%;
	opacity : 80%;
	text-align: center;
	display : none;
	border : 1px solid #cccccc;
	padding-top: 20px;
	box-sizing: content-box;
}

#content{
	width : 80%;
	height : 15%;
	margin : 15px auto;
	padding: 10px;
	background-color: #fff;
	box-sizing: content-box;
}

#modal .close{
	position : absolute;
	top: 4px;
	right : 5px;
	font-size: 20px;
	border: 0;
	background-color: white;
}

#modal #btnCheck{
	background-color: white;
	color: #21A5B5;
	border : 1px solid #21A5B5;
	border-radius : 10px;
	width : 50px;
}

#password{
	border : 1px solid #21A5B5;
	border-radius : 5px;
	width : 30%;
}

#password:focus{
	outline: 1px solid #21A5B5;
}

#modal .close:hover, #modal .close:focus{
	color : #21A5B5;
	cursor: pointer;
}

#modal #btnCheck:hover{
	background-color: #21A5B5;
	color : white;
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
										<!-- 답변일경우 -->
										<c:if test="${vo.getIndent()>0 }">
											<c:forEach var="i" begin="1" end="${vo.getIndent()}">
               									&nbsp;&nbsp;&nbsp;
              								</c:forEach>
                             					<img alt="" src="https://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif">
             							</c:if> 
             							
             							<!-- 본인이 아니면 모달창(패스워드) -->
             							<a href="#link" onclick="event.preventDefault();movetitlefn('${vo.id}', '${vo.ownerId}', '${vo.password}')">${vo.title}</a>
             								
										</td>
									
									<!-- 작성자명 ** -->
									<c:choose>
										<c:when test="${vo.indent > 0}">
											<td class="writer">${vo.owner}</td>
										</c:when>
										<c:otherwise>
											<td class="writer">${fn:substring(vo.owner,0,fn:length(vo.owner)-2)}**</td>
										</c:otherwise>
									</c:choose>
									<td class="date">${vo.createDate}</td>
									<td class="count">${vo.hits}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 패스워드 모달창 -->
					<div id="modal">
						<div id="modalfont">
						<h4>비밀글 입니다.</h4>
             			<h5>작성자와 관리자만 열람하실 수 있습니다.</h5>
             			
             			<div id="content">
             				<input type="button" value="X" class="close" id="btnClose"/>
             				<label>비밀번호</label>
             				<input type="password" maxlength="4" id="password" name="password"/>
             				<input type="button" value="확인" id="btnCheck"/>
             			</div>
             			</div>
             		</div>					
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
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>

<script type="text/javascript">
//패스워드 모달창
let thePassword = "";
let theId="";
$(function(){
	
	var btnCheck = document.getElementById('btnCheck');
	var btnClose = document.getElementById('btnClose');

	// modal 창을 감춤
	var closeRtn = function(){
	  var modal = document.getElementById('modal');
	  modal.style.display = 'none';
	  thePassword = "";
	  theId="";
	}


	let checkPass = function(){
		if( thePassword !== "" && thePassword ===$("#password").val() ){
			location.href = '${pageContext.request.contextPath}/qna/'+theId;
		} else {
			alert("비밀번호가 올바르지 않습니다.");
		}
		closeRtn();
	}
	
	btnCheck.onclick = checkPass;
	btnClose.onclick = closeRtn;
	
	
});

var movetitlefn = function(id, ownerId, pwd){
  	if("${sessionScope.user.userid}" == "") {
  		alert("로그인 후 이용해주세요.");
  		location.href="${pageContext.request.contextPath}/loginpage";
  	} else {
  		if(ownerId === '${user.id}' || '${user.admin}' === '1'){
  			location.href = '${pageContext.request.contextPath}/qna/'+id;	
  		} else{
	  		var modal = document.getElementById('modal');
	  	    modal.style.display = 'block';
	  	    thePassword = pwd;
	  	    theId = id 
  		}
  	} 
}

</script>
</body>
</html>