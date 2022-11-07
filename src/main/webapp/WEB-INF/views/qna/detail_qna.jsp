<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detailVO.name}</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style type="text/css">
/*main*/
main {
	display: flex;
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	justify-content: center;
	align-items: center;
	padding: 20px;
	max-width: 100%;
}

main .mypage-container {
	display: flex;
	flex-direction: column;
	width: 100%;
	justify-content: center;
	align-items: center;
}

table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

img {
	border: 0;
}

label, img, input, select, textarea, button {
	vertical-align: middle;
}

a {
	text-decoration: none;
}

select {
	height: 32px;
	font-size: 13px;
	color: #373737;
	border: 1px solid #e9e9e9;
	background: #fff;
	border-radius: 5px;
}

input[type=number] {
	width: 100%;
	height: 30px;
	font-size: 13px;
	color: #373737;
	border: 1px solid #e9e9e9;
	background: #fff;
	text-indent: 20px;
	border-radius: 5px;
	transition: all 0.5s;
	vertical-align: middle;
}

input::-webkit-input-placeholder {
	color: #b5b5b5;
	font-size: 12px;
	line-height: 100%;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.detail_top {
	display: flex;
}

.options {
	padding: 0 0 0 100px;
	box-sizing: border-box;
	width: 600px;
}

/*사진슬라이드 - 상세페이지 윗부분 좌측*/
#wrapper {
	position: relative;
	width: 600px;
	margin: 50px auto;
	height: 400px;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
	overflow: hidden;
}

#slider-wrap {
	width: 600px;
	height: 400px;
	positioin: relative;
}

#slider-wrap ul#slider {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
	height: 400px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 50px;
}

/*사진 슬라이드 버튼*/
.btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background-color: none;
	color: #9E9E9E;
	z-index: 100;
	font-size: 20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-moz-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	-ms-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.btns:hover {
	color: black;
}

#next {
	right: 15px;
	border-radius: 7px 0px 0px 7px;
}

#previous {
	left: 15px;
	border-radius: 0px 7px 7px 7px;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*사진슬라이드 바*/
#pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#pagination-wrap ul {
	width: 100%;
}

#pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

/*사진슬라이드 애니메이션*/
#slider-wrap ul, #pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

/*옵션부분 - 상세페이지 윗부분 우*/
.detail_top table {
	border: none;
}

.detail_top h2 #itemName {
	margin: 15px 0 15px;
	width: 100%;
	border: none;
	font-size: 25px;
	font-weight: bold;
	color: #232323;
	line-height: 26px;
	padding: 0 0 20px;
	border-bottom: 2px solid #333;
}

.detail_top table th, td {
	padding: 10px 0;
	font-size: 15px;
	color: #444;
	text-align: left;
}

.detail_top table td.price {
	font-size: 22px;
}

.detail_top table td input, .detail_top table td {
	border: none;
}

.detail_top table td input:focus {
	outline: none;
}

/*옵션선택*/
.detail_top table select {
	width: 30%;
	border: 1px solid #c6c6c6;
	box-sizing: border-box;
	padding-left: 10px;
}

.detail_top table select::-ms-expand {
	display: none;
}

.detail_top table select:focus {
	outline: 2px solid #21A5B5;
	border: 1px solid #21A5B5;
}

/*옵션버튼*/
.detail_top .datail_top_btns {
	text-align: center;
	padding: 25px 0 0 0;
}

.detail_top .datail_top_btns>input {
	display: inline-block;
	width: 136px;
	height: 50px;
	font-size: 17px;
	color: #fff;
	border-radius: 5px;
	line-height: 50px;
}

.detail_top .datail_top_btns>input#btn1 {
	background: white;
	border: 1px solid #21A5B5;
	color: #21A5B5;
	margin-right: 10px;
}

.detail_top .datail_top_btns>input#btn2 {
	background: #21A5B5;
	border: 1px solid #21A5B5;
}

.detail_top .datail_top_btns>#btn1:hover {
	border: 1px solid #257f8a;
	color: #257f8a;
	font-weight: 400;
}

.detail_top .datail_top_btns>#btn2:hover {
	background-color: #257f8a;
	border: 1px solid #257f8a;
}

/*탭 메뉴*/
.tabmenu {
	font-size: 0;
	text-align: center;
}

.tabmenu label {
	display: inline-block;
	width: 33%;
	padding: 15px 0;
	color: #444;
	font-weight: 800;
	background: white;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
}

#detaillabel {
	color: #21A5B5;
}

.tabmenu label:nth-of-type(2) {
	width: 34%;
}

.tabmenu label:hover {
	color: #21A5B5;
}

/*탭의 내용부분*/
.tabmenu>div {
	display: none;
	font-size: 14px;
	padding: 20px;
	display: block;
}

hr {
	margin-top: 20px;
}

/*상세정보 내용*/
#content1 img {
	width: 70%;
	padding: 0px;
}

#content2 {
	width: 70vw;
	padding: 0px;
}

#content3 {
	margin: auto;
	width: 70%;
}

#delivery {
	margin-top: 20px;
}

details {
	margin-left: 15%;
}

summary {
	font-size: 13px;
	cursor: pointer;
	list-style: none;
	font-weight: 600;
	padding: 10px 0 0 0;
	text-align: left;
}

.summary1, .summary2, .summary3, .summary4 {
	width: 60%;
	background: #fafafa;
	font-size: 10px;
	line-height: 25px;
	margin: 10px 0;
	text-align: left;
}

/* go-btn */
.go-btn {
	position: fixed;
	width: 40px;
	bottom: 20px;
	right: 25px;
	z-index: 2;
	cursor: pointer;
}

.go-btn span {
	display: block;
	color: #fff;
	background: #f1f3f5;
	text-align: center;
	border-radius: 50%;
	width: 36px;
	height: 34px;
	line-height: 36px;
	font-size: 22px;
	padding-bottom: 40px;
}

.go-btn i {
	color: #ddd;
}

input {
	width: 50px;
}

#discount {
	width: 30px;
	padding: 0px;
	margin: 0px;
	color: #21A5B5;
	font-size: 23px;
	font-weight: bold;
}

#discount-span {
	color: #21A5B5;
	font-size: 23px;
	font-weight: bold;
}

@media screen and (max-width: 700px) {
	.main {
		width: 70%
	}
}

@media screen and (max-width: 500px) {
	.main {
		width: 50%
	}
}

#cost {
	text-decoration: line-through;
	width: 65px;
}

.selected_option {
	background: #f1f3f5;
	width: 500px;
	height: 100px;
	border: 1px solid black;
}

.options #itemName:focus {
	outline: none;
}

#procode {
	display: none;
}

/* QNA css*/
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
	margin-top: 5px;
	background: #21A5B5;
	color: white;
	border: 1px solid #21A5B5;
	border-radius: 5px;
}

.qna_list {
	width: 100%;
	border-top: 3px solid #21A5B5;
	border-bottom: 2px solid #21A5B5;
}

.qna_list>th, td {
	border-bottom: 1px solid #ddd;
}

.top th {
	border-bottom: 2px solid #21A5B5;
	font-size: 15px;
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
	background-color: #d3d3d3;
	position : fixed;
	top : 30%;
	left : 33%;
	width : 27.5%;
	opacity : 80%;
	text-align: center;
	display : none;
}

#modal #modalfont{
	padding-top: 20px;
}

#modal>#content{
	width: 350px;
	height : 100px;
	margin : 15px auto;
	padding: 15px;
	background-color: #fff;
}

#modal .close{
	position : absolute;
	top: 4px;
	right : 5px;
	font-size: 20px;
	border: 0;
	background-color: #d3d3d3;
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
			<!--상세페이지 상단(사진슬라이드+옵션부분)-->
			<div class="detail_top">
				<!--상세페이지 윗부분의 좌측(사진슬라이드)-->
				<div id="wrapper">
					<div id="slider-wrap">
						<ul id="slider">
							<li><img src="${detailVO.pic1}" alt=""></li>
							<li><img src="${detailVO.pic2}" alt=""></li>
							<li><img src="${detailVO.pic3}" alt=""></li>
							<c:if test="${detailVO.pic4 != null}">
								<li><img src="${detailVO.pic4}" alt=""></li>
							</c:if>
						</ul>

						<!--사진슬라이드 버튼-->
						<div class="btns" id="next">
							<i class="fa fa-chevron-right"></i>
						</div>
						<div class="btns" id="previous">
							<i class="fa fa-chevron-left"></i>
						</div>
						<div id="pagination-wrap">
							<ul></ul>
						</div>
					</div>
				</div>

				<!--상세페이지 상단의 우측(옵션부분)-->
				<div class="go-btn" onclick="window.scrollTo(0, 0);">
					<span><i class="fa fa-chevron-up"></i></span>
				</div>
				<div class="options">
					<!-- 옵션시작 -->
					<form action="${pageContext.request.contextPath}/NowBuyController"
						method="post" id="now-buy">

						<h2>
							<input type="text" value="${detailVO.name}" id="itemName"
								name="itemName">
						</h2>
						<table id="productTable">
							<colgroup>
								<!--이름쪽은 변하지 않고, 옵션쪽은 유동적이게-->
								<col style="width: 173px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label>가격 </label></th>
									<td><input type="text"
										value="<fmt:formatNumber value="${detailVO.price}" pattern="#,###" />원"
										id="cost"><label for="discount"></label> <input
										type="text" value="${detailVO.discount}" name="discount"
										id="discount"><span id="discount-span">%</span></td>
								</tr>
								<tr>
									<th><label>판매가격 </label></th>
									<td><input type="text"
										value="<fmt:formatNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}" pattern="#,###" />"
										id="price"> <span>원</span></td>
								</tr>
								<tr id="procode">
									<th><label>상품코드 </label></th>
									<td><select name="proNum" id="code">
											<c:forEach var="vo" items="${detailOptionVO}">
												<c:forTokens var="vo1" items="${vo.proNum}" delims=",">
													<option value="${vo1}">${vo1}</option>
												</c:forTokens>
											</c:forEach>
									</select></td>
									<td><input type="hidden" value="${detailVO.id}" id="id"></td>
								</tr>
								<tr>
									<th>배송비</th>
									<td><input type="text" value="2,500"><span>원</span></td>
								</tr>
								<tr>
									<th><label>적립금 </label></th>
									<td><input type="text"
										value="<fmt:formatNumber value="${(detailVO.price - (detailVO.price * (detailVO.discount/100))) * 0.05}" pattern="#,###" />"
										id="save"><span>원</span></td>
								</tr>

								<c:if test="${detailOptionVO[1].size != null}">
									<tr>
										<th>옵션선택(사이즈)</th>
										<td><select name="size" id="select_size"
											class="form-control opt_select_size">
												<option value="선택없음">-선택없음-</option>
												<c:forEach var="vo2" items="${selectOptionSize}">
													<c:forTokens var="vo3" items="${vo2.size}" delims=",">
														<option value="${vo3}">${vo3}</option>
													</c:forTokens>
												</c:forEach>
										</select></td>
									</tr>
								</c:if>

								<c:if test="${detailOptionVO[1].color != null}">
									<c:choose>
										<c:when test="${detailOptionVO[1].size != null}">
											<tr>
												<th>옵션선택(색상)</th>
												<td><select name="color" id="select_color"
													data-size="10" class="form-control opt_select_color">
														<option value="선택없음">-선택없음-</option>
												</select></td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<th>옵션선택(색상)</th>
												<td><select name="color" id="select_color"
													data-size="10" class="form-control opt_select_color">
														<option value="선택없음">-선택없음-</option>
														<c:forEach var="vo2" items="${selectOptionSize}">
															<c:forTokens var="vo3" items="${vo2.color}" delims=",">
																<option value="${vo3}">${vo3}</option>
															</c:forTokens>
														</c:forEach>
												</select></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:if>

								<tr>
									<th><label>구매수량</label></th>
									<td><select name="count" id="select_count"
										class="form-control">
											<c:forEach begin="1" end="${detailOptionVO[0].stock}"
												var="count">
												<option>${count}</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>
						</table>
						<div id="selectoption"></div>
						<input type="hidden" name="productId" id="proid"
							value="${detailVO.id}">

						<!--장바구니/구매하기 버튼-->
						<div class="datail_top_btns">
							<input type="submit" value="장바구니" id="btn1" /> <input
								type="submit" value="구매하기" id="btn2" />
						</div>
						<input type="hidden" name="pic1" id="pic1"
							value="${detailVO.pic1}" /> <input type="hidden"
							value="${detailVO.price}" id="cost1" name="price"> <input
							type="hidden" name="salePrice" id="salePrice"
							value="<fmt:parseNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}"/>" />
					</form>
				</div>
				<!-- 옵션 끝 -->
			</div>
			<!-- 디테일-탑 -->
			<hr width="100%" color="black" size="1">
			<!--탭-->
			<div class="tabmenu">
				<a href="${pageContext.request.contextPath}/detail/${detailVO.id}"><label
					for="tab1">상세정보</label></a> <a
					href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=1"><label
					for="tab2">리뷰</label></a> <a
					href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}"><label
					for="tab3" id="detaillabel">상품문의</label></a>
				<div id="content1"></div>
				<div id="content2"></div>
				<div id="content3">
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
										<!-- code와 상세페이지id가 같으면 -->
										<c:forEach var="vo" items="${qnaVO1}">
											<c:if test="${vo.code eq detailVO.id}">
												<tr>
													<td class="num">${vo.id}</td>
													<td class="category">${vo.qnaCategory}</td>
													<td class="title">
													 <a href="${pageContext.request.contextPath}/detail_qna/${vo.id}/${detailVO.id}">
													<%--<a href="#link" onclick="event.preventDefault();movetitlefn('${vo.id}', '${vo.ownerId}', '${vo.password}')">--%>
															${vo.title} 
															<c:if test="${vo.replyCount ne 0}">
																<small><b>(&nbsp;${vo.replyCount}&nbsp;)</b></small>
															</c:if>
													</a>
													</td>
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
											</c:if>
										</c:forEach>
										<!-- code와 상세페이지id가 같지않으면 -->
										<c:forEach var="vo" items="${qnaVO1}">
											<c:if test="${vo.code} eq ${datailVO.id}">
												<td>
													<p>등록된 글이 없습니다.</p>
												</td>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
								<!-- 패스워드 모달창 -->
								<%-- <div id="modal">
									<div id="modalfont">
										<h4>비밀글 입니다.</h4>
										<h5>작성자와 관리자만 열람하실 수 있습니다.</h5>
									</div>
									<div id="content">
										<input type="button" value="X" class="close" id="btnClose" />
										<label>비밀번호</label> <input type="password" maxlength="4"
											id="password" name="password" /> <input type="button"
											value="확인" id="btnCheck" />
									</div>
								</div>--%>
							</div>


							<!--버튼-->
							<div class="btn_wrap">
								<c:if test="${qnaVO.ownerId eq userVO.id}">
									<a
										href="${pageContext.request.contextPath}/detail_write/${detailVO.id}?code=${detailVO.id}"
										class="on">문의하기</a>
								</c:if>
							</div>

							<!--페이지번호-->
							<div class="qna_page">
								<c:choose>
									<c:when test="${1 == page.nowPage}">
										<a href="#" class="btn prev"><</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}?page=${page.nowPage - 1}"><</a>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${page.startPage}"
									end="${page.endPage}">
									<c:choose>
										<c:when test="${page.nowPage eq i}">
											<a href="#" class="page on">${i}</a>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}?page=${i}"
												class="page">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${page.totalPage == page.nowPage}">
										<a href="#" class="btn next">></a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}?page=${page.nowPage + 1}">></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
		// 페이지 스크롤	
		$(document).ready(function() {
			$('html, body').animate({
				scrollTop : $('#content3').offset().top
			}, 'default');
		});

		// 사진슬라이드   //컬러&색상&재고에 조건 배열값으로 넣었더니 컬러색상이 null이 있으면 슬라이드 안됨.
		var slideWrapper = document.getElementById('slider-wrap');
		var slideIndex = 0;
		var slides = document.querySelectorAll('#slider-wrap ul li');
		var totalSlides = slides.length;
		var sliderWidth = slideWrapper.clientWidth;
		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';
		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}

		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#pagination-wrap ul').appendChild(li);
		})

		function pagination() {
			var dots = document.querySelectorAll('#pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();
		var autoSlider = setInterval(function() {
			plusSlides(1);
		}, 3000);
		
		//패스워드 모달창
		<%--let thePassword = "";
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
		// 모달창 나오는 조건
		var movetitlefn = function(id, ownerId, pwd){
		  	if("${sessionScope.user.userid}" == "") {
		  		alert("로그인 후 이용해주세요.");
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
		}--%>

		// 장바구니 이동
		$("#btn1")
				.click(
						function(e) {
							e.preventDefault();
							var id = $("#id").val();
							var count = $("#select_count").val();
							var size = $("#select_size").val();
							var color = $("#select_color").val();
							var itemName = $("#itemName").val();
							var proNum = $("#code").val();
							var discount = $("#discount").val();
							var price = $("#cost1").val();
							var pic1 = $("#pic1").val();

							console.log("id : " + id);
							console.log("count : " + count);
							console.log("size : " + size);
							console.log("color : " + color);
							console.log("itemName : " + itemName);
							console.log("proNum : " + proNum);
							console.log("discount : " + discount);
							console.log("price : " + price);
							console.log("pic1 : " + pic1);

							var data = {
								id : id,
								count : count,
								size : size,
								color : color,
								itemName : itemName,
								proNum : proNum,
								discount : discount,
								price : price,
								pic1 : pic1

							};

							$
									.ajax({
										url : "${pageContext.request.contextPath}/detailcart",
										type : "post",
										data : data,
										success : function(result) {
											if (result == 1) {
												if (confirm("장바구니에 담으시겠습니까?")) {
													alert("장바구니에 담았습니다.");
													$("#select_count").val("1");
													if (confirm("장바구니로 이동하시겠습니까?")) {
														cancelButton: '다음에'
														location.href = "${pageContext.request.contextPath}/cart/${user.userid}";
													}
												}
											} else {
												alert("로그인 후 이용해주세요.");
												$("#select_count").val("1");
											}
										},
										error : function() {
											alert("장바구니에 담을 수 없습니다.");
										}
									});
						});

		// 구매하기 이동
		document.getElementById("btn2").addEventListener("click", function(e) {
			e.preventDefault();
			if ("${sessionScope.user.userid}" == "") {
				alert("로그인 후 이용해주세요.");
			} else {
				if (confirm("바로 구매하시겠습니까?")) {
					document.getElementById("now-buy").submit();
				}
			}
		});

		// 선택한상품 div창
		document
				.querySelector("select[name='count']")
				.addEventListener(
						"change",
						function() {
							let size = document.getElementById("select_size").value;
							let color = document.getElementById("select_color").value;
							let count = document.getElementById("select_count").value;

							//html 추가로 생성 작업
							$('.optionSize').remove();
							var html = '';
							html += '<div class="optionSize">상품명 : ${detailVO.name}<div>';
							html += '<div class="optionSize">사이즈 : ' + size
									+ '</div>';
							html += '<div class="optionSize">색상 : ' + color
									+ '</div>';
							html += '<div class="optionSize">수량 : ' + count
									+ '</div>';

							$('#selectoption').append(html);

							$(".optionSize").css("width", 500);

						});

		// 사이즈선택 시 색상select창
		$("#select_size")
				.change(
						function() {
							$('#select_color').empty();
							let option = $("<option value='선택없음'>-선택없음-</option>");
							$('#select_color').append(option);
							$
									.ajax({
										url : "${pageContext.request.contextPath}/colorbyidandsize",
										type : "post",
										data : {
											id : $("#proid").val(),
											size : $("#select_size").val()
										},
										success : function(result) {
											result
													.forEach(function(item) {
														let option = $("<option value='"+item+"'>"
																+ item
																+ "</option>");
														$('#select_color')
																.append(option);
													});
										},
										error : function() {
											alert("죄송합니다. 구매하실 수 없습니다.");
										}
									});
						});

		//색상선택 시 상품코드 정해짐
		$("#select_color")
				.change(
						function() {
							$
									.ajax({
										url : "${pageContext.request.contextPath}/pronumbysizeandcolor",
										type : "post",
										data : {
											id : $("#proid").val(),
											size : $("#select_size").val(),
											color : $("#select_color").val()
										},
										success : function(result) {
											console.log(result);
											$("#code").val(result).prop(
													"selected", true);
										},
										error : function() {
											alert("죄송합니다. 구매하실 수 없습니다.");
										}
									});
						});
	</script>

</body>
</html>