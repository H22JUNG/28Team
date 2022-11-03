<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detailVO.name}</title>
<script src="../js/jquery-3.6.1.min.js?ver123"></script>
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
	min-width: 1200px;
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

.detail_top h2 #itemName{
	margin: 15px 0 15px;
	width : 100%;
	border : none;
	font-size: 25px;
	font-weight : bold;
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

.tabmenu label:nth-of-type(2) {
	width: 34%;
}

.tabmenu label:hover {
	color: #21A5B5;
}

/*탭의 내용부분*/
.tabmenu>div {
	display: none;
	font-size: 60px;
	padding: 20px;
	min-height: 300px;
	display: block;
}
/* 
.tabmenu #tab1:checked ~ #content1, .tabmenu #tab2:checked ~ #content2,
	.tabmenu #tab3:checked ~ #content3 {
	display: block;
} */

hr {
	margin-top: 20px;
}

/*상세정보 내용*/
#content1 img {
	width: 70%;
}

/* 리뷰 */
#content2 {
	width: 70vw;
}

#content3 {
	width: 70%;
}

#delivery{
	margin-top : 20px;
}

details{
	margin-left : 15%;
}

summary {
	font-size: 13px;
	cursor: pointer;
	list-style: none;
	font-weight: 600;
	padding : 10px 0 0 0;
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

.options #name:focus{
	outline : none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
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
							<tr>
								<th><label>상품코드 </label></th>
								<%-- <td><input type="hidden" name="proNum" value="${detailOptionVO.proNum}"
										id="product_code"></td>--%>
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

							<%-- <c:if test="${detailOptionVO[1].size != null}">--%>
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
							<%-- </c:if>--%>

							<%--c:if test="${detailOptionVO[1].color != null}"--%>
								<tr>
									<th>옵션선택(색상)</th>
									<td>
										<select name="color" id="select_color"
											data-size="10" class="form-control opt_select_color">
											<option value="선택없음">-선택없음-</option>
										</select>
										</td>
								</tr>
							<%--/c:if--%>
								<!--tr>
									<th>옵션선택(색상)</th>
									<td><select name="opt_select_1" id="select_color" class="form-control opt_select_color">
													<option value="nochoice">-선택없음-</option>
													<option value="${optionVO.color}">${optionVO.color}</option>
											</select>
									</td>
								</tr-->
								
							<tr>
								<th><label>구매수량</label></th>
								<td><select name="count" id="select_count"
									class="form-control">
										<c:forEach begin="1" end="${detailOptionVO[1].stock}"
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
					<input type="hidden" name="pic1" id="pic1"
							value="${detailVO.pic1}" /> <input type="hidden"
							value="${detailVO.price}" id="cost1" name="price">
							<input type="hidden" name="salePrice" id="salePrice" value= "<fmt:parseNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}"/>" />
				</form>
				</div><!-- 옵션 끝 -->
			</div>
			<hr width="100%" color="black" size="1">
			<!--탭-->
			<div class="tabmenu">
				<input type="radio" name="tab" id="tab1" checked> <a href="#"><label for="tab1">상세정보</label></a>
				<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=1"><label for="tab2">리뷰</label></a>
				<input type="radio" name="tab" id="tab3"> <a href="#"><label for="tab3">상품문의</label></a>
				<div id="content1">
					<img src="${pageContext.request.contextPath}/image/detailHead.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/image/detailMain.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/image/detailMain2.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/image/detailEvent.png"
						alt=""> <img
						src="http://m.jgagu.co.kr/web/upload/jinyoung/sub/guide_banner_delivery_ipgum.png"
						alt="" id=delivery>
					<caption>
						<details>
							<summary>구매전 유의사항 +</summary>
							<div class="summary1">
								<p>✓ 사다리차 이용 또는 엘레베이터 이용료 등 설치현장의 특수성으로 인한 추가비용은 고객부담입니다.</p>
								<p>✓ 저층의 경우에도 입구 및 엘리베이터가 협소하여 물품이동이 어려운 경우 사다리차를 사용할 수
									있습니다.</p>
								<p>✓ 상품이 배송되기 전 설치를 원하시는 공간을 미리 확보 및 정돈 부탁드립니다.</p>
								<p>✓ 모니터 환경에 따라 실제 제품의 색상에 다소 차이가 있을 수 있습니다.</p>
							</div>
						</details>
						<details>
							<summary>CUSTOMER SERVICE +</summary>
							<div class="summary2">
								<p>✓ Call Center : 070-000-052</p>
								<p>✓ 상담시간 평일 AM 09:00 ~ PM 18:00</p>
								<p>✓ 점심시간 AM 12:00 ~ PM 13:00(점심시간 상담불가)</p>
							</div>
						</details>
						<details>
							<summary>교환 및 반품 안내 +</summary>
							<div class="summary3">
								<p>✓ 정상설치 완료 전, 고객 변심으로 인한 교환/반품 시에는 왕복배송비 + 고객부담금이 발생됩니다.</p>
								<p>✓ 조립 및 설치 이후에는 재판매가 불가능하므로, 교환/반품이 불가합니다.</p>
								<p>✓ 매트리스, 매트리스 커버 등의 제품은 위생 관리상 포장 개봉 이후에는 교환/반품이 불가합니다.</p>
								<p>✓ 교환/반품 주소 : 서울 금천구 가산디지털5로 484번지</p>
								<p>✓ 제주도 및 도서산간지역의 경우 배송비가 추가됩니다</p>
							</div>
						</details>
						<details>
							<summary>배송 안내 +</summary>
							<div class="summary2">
								<p>✓ 주문일로부터 평균 3-7일 이후 배송이 가능합니다.</p>
								<p>✓ 일요일 및 공휴일에는 배송이 불가능합니다.</p>
								<p>✓ 일부 제품은 주문제작 상품으로 배송기간이 다소 소요될 수 있습니다.</p>
								<p>✓ 주문폭주, 일시적 재고부족, 기상이변, 악천후, 천재지변 등에 의한 배송지연이 발생할 수 있습니다.</p>
							</div>
						</details>
					</caption>
				</div>
				<div id="content2">
				</div>
				<div id="content3">
					<jsp:include page="../views/qna/inner_qna.jsp" flush="true" />
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var move_product_qna = '${move_product_qna}';
		if ( move_product_qna ) {
			$('#tab3').click();	
		}
	});
		// 상품코드 선택
		$("#select_color option:eq(1)").prop("selected",true);
		$("#select_color option:eq(2)").prop("selected",true);
	
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
						}
					} else{
						alert("로그인 후 이용해주세요.");
						$("#select_count").val("1");
					}
					},
					error : function() {
					alert("장바구니에 담을 수 없습니다.");
				}
			});
		});
		
		document.getElementById("btn2").addEventListener("click",function(e){
			e.preventDefault();
			if("${sessionScope.user.userid}" == "") {
				alert("로그인 후 이용해주세요.");
			} else {
				document.getElementById("now-buy").submit();
			}
		});
		
		
		// 옵션 및 사이즈 중복 제거하기  **script 제일 하단에 위치해야함(옵션null일경우 로직에러나서 script멈춤)
// 		window.addEventListener("DOMContentLoaded", function(){
// 			let size = document.getElementById("select_size").value;
// 			const colorSelects = document.querySelectorAll("select[name='opt_select_1']");
			
// 			for (let cselect of colorSelects) {
				
// 				if(size != cselect.dataset.size){
// 					cselect.style.display = "none";
// 				}
// 			}
// 		});
		
		/*
		document.querySelector("select[name='opt_select_2']").addEventListener("change", function(){
			let size = document.getElementById("select_size").value;
			const colorSelects = document.querySelectorAll("select[name='opt_select_1']");
			
			for (let cselect of colorSelects) {
				if(size != cselect.dataset.size){
					cselect.style.display = "none";
				}else{
					cselect.style.display = "block";
				}
			}
			
		});
		*/
		
		
		document.querySelector("#select_count").addEventListener("change", function(){
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
		
		$( "#select_size" ).change(function() {
			  //alert( "Handler for .change() called." );
			  //console.log($("#proid").val(), $("#select_size").val());
			  $('#select_color').empty();
			  let option = $("<option value='선택없음'>-선택없음-</option>");                
			  $('#select_color').append(option);
			$.ajax({
				url : "${pageContext.request.contextPath}/colorbyidandsize",
				type : "post",
				data : {id: $("#proid").val(), size: $("#select_size").val()},
				success : function(result) {
					//console.log(result);
					result.forEach(function(item) {
						//console.log(item);
						let option = $("<option value='"+item+"'>"+item+"</option>");                
						$('#select_color').append(option);
					});
				},
				error : function() {
					alert("죄송합니다. 구매하실 수 없습니다.");
				}
			});	  
		});
		
		$( "#select_color" ).change(function() {
			  //alert( "Handler for .change() called." );
			  //console.log($("#select_size").val(), $("#select_color").val());
			$.ajax({
				url : "${pageContext.request.contextPath}/pronumbysizeandcolor",
				type : "post",
				data : {size: $("#select_size").val(), color: $("#select_color").val()},
				success : function(result) {
					console.log(result);
					$("#code").val(result).prop("selected", true);
				},
				error : function() {
					alert("죄송합니다. 구매하실 수 없습니다.");
				}
			});	  
		});

	</script>

</body>
</html>