<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@keyframes slide-right {
  from {
  	transform: translateX(0%);
  }

  to {
  }
}
@keyframes slide-left {
  from {
  }

  to {
    transform: translateX(0%);
  }
}
/* 메인페이지 */
main {
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	padding: 120px 80px 240px;
	gap: 20px;
	justify-content: center;
    display: flex;
}

/* 카테고리 메뉴바 */

@keyframes asideout {
	from {
		transform: translateX(-70%);
	}
	to {
		transform: translateX(0%);
	}
}
@keyframes asidein {
	from {
		transform: translateX(0);
	}
	to {
		transform: translateX(-70%);
	}
}

.asideout {
	animation: asideout 0.6s forwards;
}
.asidein {
	animation: asidein 0.6s forwards;
}

main aside {
    min-height: 100vh;
    background: #FFFFFF;
    border-width: 0px 1px 0px 0px;
    border-style: solid;
    border-color: #28BACE;
    box-shadow: 2px 0px 5px rgb(0 0 0 / 25%);
    padding: 50px 20px;
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
	z-index: 1;
	transform: translateX(-70%);
/* 	display: none; */
}

main aside .outer-cate {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

main aside .outer-cate>li {
	width: 100%;
	border-top: 1px solid #909090;
	min-height: 50px;
}

main aside .outer-cate>li:first-child {
	border-top: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	padding: 10px 10px 10px 0;
}

#aside-search {
	visibility: hidden;
	padding: 5px;
    outline: none;
    border: 1px solid #939393;
}

main aside .outer-cate>li:last-child {
	border-bottom: 1px solid #909090;
}

main aside .outer-cate>li>a {
	width: 100%;
	height: 100%;
	text-align: center;
	font-size: 20px;
	display: block;
	padding: 10px;
	min-height: 50px;
}

main aside .outer-cate>li img {
	width: 30px;
	height: 30px;
	opacity: 0.6;
	float: right;
}

main aside .outer-cate>li:hover>a img {
	filter: invert(60%) sepia(54%) saturate(587%) hue-rotate(139deg) brightness(93%) contrast(90%);
}


main aside .outer-cate>li>.inner-cate {
  	display: none;
}



main aside .outer-cate>li>.inner-cate>li {
	min-height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-right: 30px;
}

main aside .outer-cate>li>.inner-cate>li:first-child {
	border-top: 1px solid #909090;
}

main aside .outer-cate>li>.inner-cate>li a {
	padding: 8px 30px;
}

main aside .outer-cate>li:hover>.inner-cate {
	display: block;
}


aside .outer-cate>li:hover>a,
aside .outer-cate>li:hover>.inner-cate>li>a:hover{
	color: #28BACE;
}

/* 메인 */
main .item-container {
	width: 1040px;
	display: flex;
	gap: 30px;
	flex-direction: column;
	margin-left: 20%;
}

/* 베스트 아이템 스크롤 */

.bestitem-container {
	position: relative;
}

.bestitem-container #scroll-left {
    position: absolute;
    top: 50%;
    cursor: pointer;
	padding: 10px;
	font-weight: bold;
    font-size: 24px;
    transform: translateX(-100%);
    
}
.bestitem-container #scroll-right {
    position: absolute;
    top: 50%;
    left: 100%;
    cursor: pointer;
	padding: 10px;
	font-weight: bold;
    font-size: 24px;
}

.slide-right {
	animation: slide-right 1s forwards;
}
.slide-left {
	animation: slide-left 1s forwards;
}


/* 베스트 아이템 */
main .bestitem-box >div {
	width: 240px;
	height: 320px;
	margin: 10px;
}

main .bestitem-container > p {
	font-size: 25px;
	padding-left: 10px;
}

main .bestitem-container > p span {
	color: #28BACE;
}

main .bestitem-container .bestitem-list {
	height: 370px;
    white-space: nowrap;
    overflow: hidden;
}

.bestitem-wrap {
	width: fit-content;
    font-size: 0;
    letter-spacing: 0;
    word-spacing: 0;
}

.bestitem-box{
	width: 240px;
	display: inline-block;
	margin: 10px;
	white-space: normal;
	font-size: 16px;
}


.bestitem-box .bestitem-image{
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

.bestitem-box .bestitem-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.bestitem-box .bestitem-name{
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 150px;
	padding: 10px;
	gap: 10px;
	margin: 0;
}

.bestitem-name a{
	flex: 1;
	font-size: 16px;
	font-weight: 500;
}

.bestitem-name a .discount{
	color: #28BACE;
}

.bestitem-name a:hover>span:last-child{
	text-decoration: underline;
}

.bestitem-name .price {
	font-weight: 700;
	cursor: default;
}
.bestitem-name .price .viewprice{
	text-decoration: line-through;
    font-size: 15px;
    text-align: center;
    color: #b2b2b2;
    font-weight: normal;
}

.bestitem-name .item-info{
	display: flex;
	width: 100%;
	justify-content: space-between;
}
/* 상품 list */
main .item-container .item-list>p {
	padding: 10px;
}

.itembox {
	width: 240px;
	float: left;
	margin: 10px;
}

.itembox .item-image {
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

.itembox .item-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.itembox .itemname {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 150px;
	padding: 10px;
	gap: 10px;
}

.itemname a {
	flex: 1;
	font-size: 16px;
	font-weight: 500;
}

.itemname a .discount {
	color: #28BACE;
}

.itemname a:hover>span:last-child {
	text-decoration: underline;
}

.itemname .price {
	font-weight: 700;
	cursor: default;
}
.itemname .price .viewprice{
	text-decoration: line-through;
    font-size: 15px;
    text-align: center;
    color: #b2b2b2;
    font-weight: normal;
}

.itemname .item-info {
	display: flex;
	width: 100%;
	justify-content: space-between;
}

/* 별점 */
.star{
	cursor: default;
}
.star .stargrade {
	color: #28BACE;
	letter-spacing: -0.1rem;
	
}
.star .stargrade .nonstar {
	color: #ABABAB;
}

.star .review-count{
	color: #A8A8A8;
	font-size: 13px;
}

/* 품절, 특가세일, 마감임박 */
.soldout {
	width: 36px;
	background: #ABABAB;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2px 0px;
	color: white;
	font-size: 12px;
	cursor: default;
}

.deadline {
	width: 60px;
	background: #be0000;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2px 0px;
	color: white;
	font-size: 12px;
	cursor: default;
	animation: 0.5s deadline infinite;
}

@keyframes deadline {
  0% {
    background: #be0000;
  }

  50% {
    background: #ff1f65;  	
  }
  to {
    background: #be0000;
  }
}

.specialprice {
	width: 36px;
	background: #F8A120;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2px 0px;
	color: white;
	font-size: 12px;
	cursor: default;
}

/* select radio */

		.select-box {
			display: flex;
    		padding: 10px 10px 0;
    		justify-content: space-between;
    		align-items: end;
		}
		#select {
			position: relative;
		}
	
        input[type="radio"] {
             display: none; 
        }

        .listck {
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

        .listck::before {
            content: "";
            width: 18px;
            height: 18px;
            border: 1px solid #bdbbbb;
            border-radius: 50%;
            box-sizing: border-box;
        }
        .listck::after {
            box-sizing: border-box;
            content: "";
            position: absolute;
            left: 4px;
            width: 10px;
            height: 10px;
            background: #21A5B5;
            border-radius: 50%;
            display: none;
        }
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<aside>
			<ul class="outer-cate">
				<li><input type="text" name="search" id="aside-search" placeholder="검색어를 입력해 주세요"/>
				<img src="${pageContext.request.contextPath}/image/search.png" alt="" id="search-button"/></li>
				
				<li><a
					href="${pageContext.request.contextPath}/category/furniture">가구<img
						src="${pageContext.request.contextPath}/image/icons/bed-icon.png" alt="" /></a>
					<ul class="inner-cate">
						<li><a
							href="${pageContext.request.contextPath}/category2/bed">침대</a></li>
						<li><a
							href="${pageContext.request.contextPath}/category2/sofa">소파</a></li>
						<li><a
							href="${pageContext.request.contextPath}/category2/mirror">거울</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/category2/chair">의자</a>
						</li>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/category/fabric">패브릭<img
						src="${pageContext.request.contextPath}/image/icons/rug-icon.png" alt="" /></a>
					<ul class="inner-cate">
						<li><a
							href="${pageContext.request.contextPath}/category2/curtain">커튼</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/category2/bedding">침구</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/category2/rug">러그</a></li>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/category/storage">수납용품<img
						src="${pageContext.request.contextPath}/image/icons/storage-icon.png"
						alt="" /></a>
					<ul class="inner-cate">
						<li><a
							href="${pageContext.request.contextPath}/category2/storage store">수납장</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/category2/organization">옷걸이</a>
						</li>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/category/supplies">생활용품<img
						src="${pageContext.request.contextPath}/image/icons/hanger-icon.png"
						alt="" /></a></li>
				<li><a href="${pageContext.request.contextPath}/notice">공지사항<img
						src="${pageContext.request.contextPath}/image/icons/notice-icon.png"
						alt="" /></a></li>
				<li><a href="${pageContext.request.contextPath}/qna">Q&A<img
						src="${pageContext.request.contextPath}/image/icons/qna-icon.png" alt="" /></a>
				</li>
				<li><a href="">이벤트<img
						src="${pageContext.request.contextPath}/image/icons/event-icon.png"
						alt="" /></a></li>
				<li><a href="${pageContext.request.contextPath}/mypage">마이페이지<img
						src="${pageContext.request.contextPath}/image/icons/person-icon.png"
						alt="" /></a></li>
			</ul>
		</aside>
		<script type="text/javascript">
			document.querySelector("#search-button").addEventListener("click",function(){
				let search = document.getElementById("aside-search").value;
				if(search != "") {
					location.href = "${pageContext.request.contextPath}/searchProduct?search="+search;
				}
			});		
		</script>

		<div class="item-container">
		
		<c:choose>
		<c:when test="${best != null}">
			<div class="bestitem-container">
				<span id="scroll-left">〈</span>
				<span id="scroll-right">〉</span>
				<p>
					${best[0].category} <span>Best</span>
				</p>
				<div class="bestitem-list" id="bestlist">
				<div class="bestitem-wrap" id="bestwrap">
					<c:forEach var="vo" items="${best}">
						<div class="bestitem-box">
						<div class="bestitem-image">
							<a href="${pageContext.request.contextPath}/detail/${vo.id}">
								<img src="${vo.pic1}" alt="" />
							</a>
						</div>
						<div class="bestitem-name">
							<a href="${pageContext.request.contextPath}/detail/${vo.id}">
								<c:if test="${vo.discount != 0}">
									<span class="discount">${vo.discount}%</span>
								</c:if> <span> ${vo.name} </span>
							</a>
							<div class="price">
							<p class="viewprice">${vo.viewPrice}</p>
							<p class="saleprice">${vo.salePrice}원</p>
							</div>
							<div class="item-info">

								<p class="star">
									<span class="stargrade">
								<c:choose>
									<c:when test="${vo.stargrade == 5}">
										★★★★★
									</c:when>
									<c:when test="${vo.stargrade == 0}">
									<span class="nonstar">
										☆☆☆☆☆
									</span>
									</c:when>
									<c:otherwise>
										<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach><c:forEach begin="0" end="${4 - vo.stargrade}"><span class="nonstar">☆</span></c:forEach>
									</c:otherwise>
								</c:choose>
								</span>
								<span class="review-count">(${vo.reviewCount})</span>
								</p>

								<c:choose>
									<c:when test="${vo.totalStock == 0}">
										<div class="soldout">품절</div>
									</c:when>
									<c:when test="${vo.totalStock <= 20}">
										<div class="deadline">마감임박</div>
									</c:when>
									<c:when test="${vo.discount >= 50 && vo.totalStock > 20}">
										<div class="specialprice">특가</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					</c:forEach>
					</div>
					</div>
			</div>
			</c:when>
			<c:otherwise>
				<p id="search-result"><span>${productVO.search}</span> 에 대한 검색 결과 입니다.</p> 
			</c:otherwise>
			</c:choose>
			<div class="item-list">
				<div class="select-box">
					<p>전체 ${fn:length(list)}개</p>
					<div id="select">
						<input type="radio" name="listOrder" id="order-create" value="0" onchange="changeOrder()" checked="checked"/><label for="order-create" class="listck">신상품순</label>
						<input type="radio" name="listOrder" id="order-view" value="1" onchange="changeOrder()" /><label for="order-view" class="listck">인기순</label>
						<input type="radio" name="listOrder" id="order-review" value="2" onchange="changeOrder()" /><label for="order-review" class="listck">리뷰 많은 순</label>
						<input type="radio" name="listOrder" id="order-lowprice" value="3" onchange="changeOrder()" /><label for="order-lowprice" class="listck">낮은 가격 순</label>
						<input type="radio" name="listOrder" id="order-highprice" value="4" onchange="changeOrder()" /><label for="order-highprice" class="listck">높은 가격 순</label>
					</div>

					<script>
						let listck = document.querySelectorAll("input[name='listOrder']");
						if (getOrder() != null) {
							for (let i = 0; i < listck.length; i++) {
								if(listck[i].value == getOrder()){
									listck[i].setAttribute('checked',true);
									var style = document.head.appendChild(document.createElement("style"));
						            style.innerHTML = ".listck:nth-child("+((i+1)*2)+"):after {display: block;}";
								}
							}
						} else {
							for (let i = 0; i < listck.length; i++) {
							if(listck[i].checked) {
									var style = document.head.appendChild(document.createElement("style"));
						            style.innerHTML = ".listck:nth-child("+((i+1)*2)+"):after {display: block;}";
								}
							}							
						}
						
						function getParams() {
							var url = decodeURIComponent(location.href);
							url = decodeURIComponent(url);

							var params;
							params = url.substring(url.indexOf('/') + 1,
									url.length);
							params = params.split("/");
							var orderIndex;
							orderIndex = params[4].split("?");
							return params[3] + "/" + orderIndex[0];
						}
						function getOrder() {
							const urlParams = new URL(location.href).searchParams;
							const currentOrder = urlParams.get('order');
							return currentOrder;
						}
						
						function changeOrder() {
							var url_href = window.location.href;
							var url = new URL(url_href);
							var selected = document.querySelector('input[type=radio][name=listOrder]:checked');
							let order = selected.value;
							location.href = "${pageContext.request.contextPath}/"+ getParams() + "?order=" + order;
						}
					</script>
				</div>
				<c:forEach var="vo" items="${list}">
					<div class="itembox">
						<div class="item-image">
							<a href="${pageContext.request.contextPath}/detail/${vo.id}">
								<img src="${vo.pic1}" alt="" />
							</a>
						</div>
						<div class="itemname">
							<a href="${pageContext.request.contextPath}/detail/${vo.id}">
								<c:if test="${vo.discount != 0}">
									<span class="discount">${vo.discount}%</span>
								</c:if> <span> ${vo.name} </span>
							</a>
							<div class="price">
							<p class="viewprice">${vo.viewPrice}</p>
							<p class="saleprice">${vo.salePrice}원</p>
							</div>
							<div class="item-info">

								<p class="star">
									<span class="stargrade">
								<c:choose>
									<c:when test="${vo.stargrade == 5}">
										★★★★★
									</c:when>
									<c:when test="${vo.stargrade == 0}">
									<span class="nonstar">
										☆☆☆☆☆
									</span>
									</c:when>
									<c:otherwise>
										<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach><c:forEach begin="0" end="${4 - vo.stargrade}"><span class="nonstar">☆</span></c:forEach>
									</c:otherwise>
								</c:choose>
								</span>
								<span class="review-count">(${vo.reviewCount})</span>
								</p>

								<c:choose>
									<c:when test="${vo.totalStock == 0}">
										<div class="soldout">품절</div>
									</c:when>
									<c:when test="${vo.totalStock <= 20}">
										<div class="deadline">마감임박</div>
									</c:when>
									<c:when test="${vo.discount >= 50 && vo.totalStock > 20}">
										<div class="specialprice">특가</div>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	// aside
	const header = document.querySelector("header");
	const footer = document.querySelector("footer");
	const aside = document.querySelector("aside");
	const itemContainer = document.querySelector(".item-container");
	const asideSearch = document.querySelector("#aside-search");
	
	for (var i = 0; i < document.querySelectorAll(".inner-cate").length; i++) {
		document.querySelectorAll(".inner-cate")[i].style.display = "none";
	}
	
	aside.classList.remove("asideout");
	aside.style.position="absolute";	
	if (window.scrollY-header.offsetHeight > 0) {
		aside.style.top = window.scrollY-header.offsetHeight +"px";
		
	} else {
		aside.style.top ="0";
	}
	
	
	
	function scrollAside(){
		aside.style.position="absolute";	
		aside.style.top="0";
		
		if(window.scrollY > header.offsetHeight && (window.scrollY + aside.offsetHeight) < footer.offsetTop) {
			aside.style.position="fixed";
		}else if((window.scrollY + aside.offsetHeight) >= footer.offsetTop) {
			aside.style.position="absolute";
			aside.style.top="calc( 100% - "+aside.offsetHeight+"px )";
		}
		
	}
	
	window.addEventListener("scroll", scrollAside);
	function mousemove(event){
		if(event.pageX < aside.offsetWidth+100 && event.pageY >= header.offsetHeight ){
			for (var i = 0; i < document.querySelectorAll(".inner-cate").length; i++) {
				document.querySelectorAll(".inner-cate")[i].style.display = "block";
			}
			aside.classList.remove("asidein");
			aside.classList.add("asideout");
			asideSearch.style.visibility = "visible";
		} else {
			if(aside.classList.contains("asideout")){
			for (var i = 0; i < document.querySelectorAll(".inner-cate").length; i++) {
				document.querySelectorAll(".inner-cate")[i].style.display = "none";
			}
			aside.classList.remove("asideout");
			aside.classList.add("asidein");
			asideSearch.style.visibility = "hidden";
			}
		}
	}

	window.addEventListener('mousemove', mousemove);	
	
	
		// 베스트아이템 슬라이드
		const bestList = document.getElementById("bestlist");
		const bestWrap = document.getElementById("bestwrap");
		const rScroll = document.getElementById("scroll-right");
		const lScroll = document.getElementById("scroll-left");
	
		lScroll.style.visibility="hidden";
		rScroll.style.visibility="hidden";
		
		
		let rSlide = document.styleSheets[0].cssRules[0];
		rSlide.appendRule('100% { transform: translateX(-'+(bestWrap.offsetWidth-bestList.offsetWidth)+'px);}');
		let lSlide = document.styleSheets[0].cssRules[1];
		lSlide.appendRule('from { transform: translateX(-'+(bestWrap.offsetWidth-bestList.offsetWidth)+'px);}');
	
		if(bestList.offsetWidth < bestWrap.offsetWidth) {
			rScroll.style.visibility="visible";
		
			rScroll.addEventListener("click",function(){
				bestWrap.classList.remove("slide-left");
				bestWrap.classList.add("slide-right");
				lScroll.style.visibility="visible";
				rScroll.style.visibility="hidden";
			});
		}
		
		lScroll.addEventListener("click",function(){
		
			if(bestWrap.classList.contains("slide-right")){
				bestWrap.classList.remove("slide-right");
				bestWrap.classList.add("slide-left");
				rScroll.style.visibility="visible";

				lScroll.style.visibility="hidden";
			}
		});
		
		
	</script>
</body>
</html>