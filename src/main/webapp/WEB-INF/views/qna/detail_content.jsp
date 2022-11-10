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
	width: 80%;
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

.tabmenu input[type="radio"] {
	display: none;
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

#detaillabel{
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
	width: 70vw;
	padding: 0px;
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

.options #itemName:focus{
	outline : none;
}

#procode{
	display : none;
}

/* QNA css*/
a {
	text-decoration: none;
	color: inherit;
}

.qna_wrap {
	width: 70%;
	margin : 0 auto;
}

.qna_title {
	margin-bottom: 30px;
	text-align : left;
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
}

.btn_wrap a{
	display: inline-block;
	text-align: center;
	margin-left: 10px;
	min-width: 80px;
	padding: 10px;
	border: 1px solid #21A5B5;
	border-radius: 2px;
	font-size: 14px;
	color : #21A5B5;
}

.insert{
	text-align: left;
	margin-top : 5px;
}

#ibtn{
	background : #21A5B5;
	padding : 5px;
	margin-top : 3px;
	border: 1px solid #21A5B5;
	color : white;
	left : 0px;
} 

#inittext{
	margin-top: 15px;
	border-radius : 5px;
	border : 1px solid #21A5B5;
	width : 100%;
	height: 6em;
}

#inittext:focus{
	outline : 1px solid #21A5B5;
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
	font-weight: bolder;
	padding: 10px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 18px;
}

.qna_content .info {
	padding: 10px;
	border-bottom: 1px solid #21A5B5;
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
	padding: 50px 5px 100px 5px;
	border-bottom: 1px solid #21A5B5;
	line-height: 160%;
	font-size: 18px;
	text-align: left;
}

.tabmenu>div h4, .tabmenu>div p{
	font-size: 15px;
	text-align: left;
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
				<div class="options"><!-- 옵션시작 -->
				<form action="${pageContext.request.contextPath}/NowBuyController" method="post" id="now-buy">
				
					<h2>
						<input type="text" value="${detailVO.name}" id="itemName" name="itemName">
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
									id="cost"><label for="discount"></label> <input type="text"
									value="${detailVO.discount}" name="discount" id="discount"><span
									id="discount-span">%</span></td>
							</tr>
							<tr>
								<th><label>판매가격 </label></th>
								<td><input type="text"
									value="<fmt:formatNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}" pattern="#,###" />"
									id="price"> <span>원</span></td>
							</tr>
							<tr id = "procode">
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
										<td>
											<select name="color" id="select_color"
												data-size="10" class="form-control opt_select_color">
												<option value="선택없음">-선택없음-</option>
											</select>
										</td>
									</tr>
								</c:when>
								<c:otherwise> 
									<tr>
										<th>옵션선택(색상)</th>
										<td>
											<select name="color" id="select_color"
												data-size="10" class="form-control opt_select_color">
												<option value="선택없음">-선택없음-</option>
												<c:forEach var="vo2" items="${selectOptionSize}">
													<c:forTokens var="vo3" items="${vo2.color}" delims=",">
														<option value="${vo3}">${vo3}</option>
													</c:forTokens>
												</c:forEach>
											</select>
										</td>
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
					<div id="selectoption">
					
					</div>
					<input type="hidden" name="productId" id="proid" value="${detailVO.id}">

					<!--장바구니/구매하기 버튼-->
					<div class="datail_top_btns">
						<input type="submit" value="장바구니" id="btn1" /> 
						<input type="submit" value="구매하기" id="btn2" />
					</div>
					<input type="hidden" name="pic1" id="pic1" value="${detailVO.pic1}" /> 
					<input type="hidden" value="${detailVO.price}" id="cost1" name="price">
					<input type="hidden" name="salePrice" id="salePrice" value= "<fmt:parseNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}"/>" />
				</form>
				</div><!-- 옵션 끝 -->
			</div><!-- 디테일-탑 -->
			<hr width="100%" color="black" size="1">
			<!--탭-->
			<div class="tabmenu">
				<a href="${pageContext.request.contextPath}/detail/${detailVO.id}"><label for="tab1">상세정보</label></a> 
				<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=1"><label for="tab2">리뷰</label></a>
				<a href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}#detaillabel"><label for="tab3" id="detaillabel">상품문의</label></a>
				<div id="content1"></div>
				<div id="content2"></div>
				<div id="content3">
					<div class="qna_wrap">
						<div class="qna_title">
							<strong>Q&A</strong>
							<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
						</div>
						<div class="qna_content_wrap">
							<div class="qna_content">
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
								<input type="hidden" name="qnaCategory" id="qnaCategory"
									value="${qnaVO.qnaCategory}">
							</div>
						</div>
						<div class="comment" id="comment"></div>
						
						<c:choose>
							<c:when test="${user.admin == 1}">
								<div class="insert" id="insert">
									<textarea id="inittext"></textarea>
									<button id="ibtn">등록</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="insert" id="insert" style="display:none">
									<textarea id="inittext"></textarea>
									<button id="ibtn">등록</button>
								</div>
							</c:otherwise>
						</c:choose>

						<!--버튼-->
						<div class="btn_wrap">
							<a
								href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}#detaillabel"
								class="on" id="return">목록으로</a>

							<c:choose>
								<c:when test="${qnaVO.ownerId eq user.id || user.admin == 1}">
									<a href="#" id="modify">수정</a>
								</c:when>
								<c:otherwise>
									<a href="#" id="modify" style="display:none">수정</a>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${qnaVO.ownerId eq user.id || user.admin == 1}">
									<a href="#" id="del">삭제</a>
								</c:when>
								<c:otherwise>
									<a href="#" id="del" style="display:none">삭제</a>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
		$(document).ready(function() {

			var move_product_qna = '${move_product_qna}';
			if (move_product_qna) {
				$('#tab3').click();
			}
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

		//댓글달기
    	const commentMain = document.getElementById("comment");
    	
    	let commentList = [];
    	let originList;
    	
    	window.addEventListener('DOMContentLoaded', (e) => {
    		initialize();
    	});
    	
    	function initialize(){
    		fetch("${pageContext.request.contextPath}/inner_comment/${qnaVO.id}")
    		.then(response => response.json())
    		.then(data => {
    			originList = data;
    			for(const obj of data) {
    				if(obj.orderId === 0){
    					commentList.push(obj);
    				}else{
    					for(const comp of data){
    						if(comp.id == obj.orderId){
    							if(comp.innerList == null){
    								comp.innerList = [];
    							}
    							comp.innerList.push(obj);
    							break;
    						}
    					}
    				}
    			}
    			
    			for(const obj of commentList) {
    				makeCommentList(0,obj);
    			}
    			
    		}).catch(err => {
    			console.log(err);
    		});
    	}
    	
    	function makeCommentList(num, item){
    		const mainDiv = document.createElement("div");
    		mainDiv.style.borderTop = "1px solid #ddd";
    		mainDiv.style.borderBottom = "1px solid #ddd";
    		mainDiv.style.padding = "15px";
    		mainDiv.style.display = "flex";
    		
    		let lPad = (40*num) + 5;
    		mainDiv.style.paddingLeft = lPad + "px";
    		
    		const subDiv1 = document.createElement("div");
    		subDiv1.style.flex = "1";
    		
    		const h4 = document.createElement("h4");
    		h4.innerText = item.owner;
    		h4.style.color = "gray";
    		const p = document.createElement("p");
    		
    		let content = (num > 0)?"↳":"";
    		p.innerText = content + item.content;
    		
    		const subDiv2 = document.createElement("div");
    		subDiv1.style.width = "100px";
    		subDiv1.style.flexDirection = "column";
    		
    		const initButton = document.createElement("button")
    		initButton.innerText = "답글";
    		initButton.style.border = "none";
    		initButton.style.color = "#21A5B5";
    		initButton.style.background = "none";
    		initButton.style.cursor = "pointer";
    		
    		subDiv1.append(h4);
    		subDiv1.append(p);
    		
    		subDiv2.append(initButton);
    		
    		mainDiv.append(subDiv1);
    		mainDiv.append(subDiv2);
    		
    		//'댓글'버튼 눌렀을 때 - 전송/취소버튼
    		commentMain.append(mainDiv);
    		
    		initButton.addEventListener("click",function(){
    			const writeDiv = document.createElement("div");
    			writeDiv.classList.add("insert");
    			
    			const writeArea = document.createElement("textarea");
    			const wbtn = document.createElement("button");
    			wbtn.innerText = "댓글";
    			wbtn.style.border = "none";
    			wbtn.style.color = "#21A5B5";
    			wbtn.style.background = "none";
    			wbtn.style.marginLeft = "10px";
    			wbtn.style.cursor = "pointer";
    			writeArea.style.width = "900px";
    			writeArea.style.height = "90px";
    		
    			
    			wbtn.addEventListener("click",function(){
    				let str = writeArea.value;
    				
    				const sendObj = {
    					root : ${qnaVO.id},
    					ownerId : ${user.id},
    					owner : "${user.username}",
    					title : "${qnaVO.title}",
    					content : str,
    					password : "${qnaVO.password}",
    					orderId : item.id
    				}
    				
    				fetch("${pageContext.request.contextPath}/inner_comment/", {
    					method: "POST",
    					headers: {
    						"Content-Type": "application/json",
    					},
    					body: JSON.stringify(sendObj)
    				})
    				.then((response) => response.json())
    				.then((data) => {
    					commentList = [];
    					originList = null;
    					document.getElementById("comment").textContent = "";
    					initialize();
    				});
    				
    			});
    			
    			const cbtn = document.createElement("button");
    			cbtn.innerText = "취소";
    			cbtn.style.border = "none";
    			cbtn.style.color = "#21A5B5";
    			cbtn.style.background = "none";
    			cbtn.style.marginLeft = "10px";
    			cbtn.style.cursor = "pointer";
    			
    			cbtn.addEventListener("click",function(){
    				writeDiv.remove();
    			});
    			
    			writeDiv.append(writeArea);
    			writeDiv.append(wbtn);
    			writeDiv.append(cbtn);
    			
    			mainDiv.after(writeDiv);
    			
    			
    		});
    		
    		if(item.innerList != null){
    			for(const innerItem of item.innerList){
    				makeCommentList(num+1,innerItem);
    			}
    		}

    	}
    	
    	document.getElementById("ibtn").addEventListener("click",function(){
    		let str = document.getElementById("inittext").value;
    		
    		const sendObj = {
    			root : ${qnaVO.id},
    			ownerId : ${user.id},
    			owner : "${user.username}",
    			title : "${qnaVO.title}",
    			content : str,
    			password : "${qnaVO.password}",
    			orderId : 0
    		}
    		
    		fetch("${pageContext.request.contextPath}/inner_comment/", {
    			method: "POST",
    			headers: {
    				"Content-Type": "application/json",
    			},
    			body: JSON.stringify(sendObj)
    		})
    		.then((response) => response.json())
    		.then((data) => {
    			makeCommentList(0, sendObj);
    			$('#inittext').val('');
    		})
    		.catch(err => {
    			console.log(err);
    		});
    	});

    	// 장바구니 이동
    	$("#btn1").click(function(e) {
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

    		$.ajax({
    			url : "${pageContext.request.contextPath}/detailcart",
    			type : "post",
    			data : data,
    			success : function(result) {
    				if(result ==1){
    					if(confirm("장바구니에 담으시겠습니까?")){
    						alert("장바구니에 담았습니다.");
    						$("#select_count").val("1");
    						if(confirm("장바구니로 이동하시겠습니까?")){
    							cancelButton:'다음에'
    							location.href = "${pageContext.request.contextPath}/cart/${user.userid}";
    						}
    					}
    				} else{
    					alert("로그인 후 이용해주세요.");
    					$("#select_count").val("1");
    					location.href="${pageContext.request.contextPath}/loginpage";
    				}
    				},
    				error : function() {
    				alert("장바구니에 담을 수 없습니다.");
    			}
    		});
    	});
    	
    	// 구매하기 이동
    	document.getElementById("btn2").addEventListener("click",function(e){
    		e.preventDefault();
    		if("${sessionScope.user.userid}" == "") {
    			alert("로그인 후 이용해주세요.");
    			location.href="${pageContext.request.contextPath}/loginpage";
    		} else {
    			if(confirm("바로 구매하시겠습니까?")){
    				document.getElementById("now-buy").submit();
    			}
    		}
    	});
    	
    	
    	// 선택한상품 div창
    	document.querySelector("select[name='count']").addEventListener("change", function(){
    		let size = document.getElementById("select_size").value;
    		let color = document.getElementById("select_color").value;
    		let count = document.getElementById("select_count").value;
    		
    		//html 추가로 생성 작업
    		$('.optionSize').remove();
    		var html = '';
    		html += '<div class="optionSize">상품명 : ${detailVO.name}<div>';
    		html += '<div class="optionSize">사이즈 : '+ size +'</div>';
    		html += '<div class="optionSize">색상 : '+ color +'</div>';
    		html += '<div class="optionSize">수량 : '+ count +'</div>';
    		
    		$('#selectoption').append(html);
    		
    		 $(".optionSize").css("width", 500);
    		
    	});
    	
    	// 사이즈선택 시 색상select창
    	$( "#select_size" ).change(function() {
    		  $('#select_color').empty();
    		  let option = $("<option value='선택없음'>-선택없음-</option>");                
    		  $('#select_color').append(option);
    		$.ajax({
    			url : "${pageContext.request.contextPath}/colorbyidandsize",
    			type : "post",
    			data : {id: $("#proid").val(), size: $("#select_size").val()},
    			success : function(result) {
    				result.forEach(function(item) {
    					let option = $("<option value='"+item+"'>"+item+"</option>");                
    					$('#select_color').append(option);
    				});
    			},
    			error : function() {
    				alert("죄송합니다. 구매하실 수 없습니다.");
    			}
    		});	  
    	});
    	
    	//색상선택 시 상품코드 정해짐
    	$( "#select_color" ).change(function() {
    		$.ajax({
    			url : "${pageContext.request.contextPath}/pronumbysizeandcolor",
    			type : "post",
    			data : {id: $("#proid").val(), size: $("#select_size").val(), color: $("#select_color").val()},
    			success : function(result) {
    				console.log(result);
    				$("#code").val(result).prop("selected", true);
    			},
    			error : function() {
    				alert("죄송합니다. 구매하실 수 없습니다.");
    			}
    		});	  
    	});
    	
    	
    	//목록이동,수정,삭제 버튼	
    	window.onload = function(){
    		let modify = document.getElementById("modify");
    		modify.addEventListener('click', () => {
    			location.href = "${pageContext.request.contextPath}/detail_update/${qnaVO.id}/${detailVO.id}#detaillabel";
    		});
    	}
    	
    	document.getElementById("del").addEventListener("click",function(){
    		let result = confirm("정말로 삭제하시겠습니까?");
    		if(result){
    			location.href="${pageContext.request.contextPath}/detail_remove/${qnaVO.id}/${detailVO.id}#detaillabel";
    		}
    	});

	</script>

</body>
</html>