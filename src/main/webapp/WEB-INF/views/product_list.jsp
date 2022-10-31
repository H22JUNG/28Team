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
<style>

/* 메인페이지 */
main {
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	padding: 120px 80px 240px;
	gap: 20px;
	min-width: 1200px;
}

/* 카테고리 메뉴바 */
main aside {
	width: 300px;
    min-height: 600px;
	background: #FFFFFF;
	border-width: 1px 1px 1px 0px;
	border-style: solid;
	border-color: #28BACE;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	padding: 50px 20px;
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
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
	padding: 15px 0;
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

main aside .outer-cate>li>a img {
	width: 30px;
	height: 30px;
	opacity: 0.6;
	float: right;
}

main aside .outer-cate>li:hover>a img {
	filter: invert(60%) sepia(54%) saturate(587%) hue-rotate(139deg) brightness(93%) contrast(90%);
}


main aside .outer-cate>li>.inner-cate {
/*  	display: none; */
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
	width: 1140px;
	display: flex;
	gap: 30px;
	flex-direction: column;
	position: relative;
	left: 28%;
}
/* 베스트 아이템 */
main .best-itembox .best-item>div {
	width: 240px;
	height: 320px;
	float: left;
	margin: 10px;
	border: 1px solid black;
}

main .best-itembox p {
	font-size: 25px;
	padding-left: 10px;
}

main .best-itembox p span {
	color: #28BACE;
}

/* 상품 list */
main .item-container .item-list>p {
	padding: 10px;
}

main .item-container .item-list .itembox {
	width: 240px;
	float: left;
	margin: 10px;
}

main .item-container .item-list .itembox .item-image {
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

main .item-container .item-list .itembox .item-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

main .item-container .item-list .itembox .itemname {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 120px;
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

.itemname .item-info {
	display: flex;
	width: 100%;
	justify-content: space-between;
}

/* 별점 */
.itemname .star {
	cursor: default;
}
.itemname .star .stargrade {
	color: #28BACE;
	letter-spacing: -0.1rem;
	
}
.itemname .star .stargrade .nonstar {
	color: #ABABAB;
}

.itemname .star .review-count{
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
		.select {
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<aside>
			<ul class="outer-cate">
				<li><input type="text" />
				<button>검색</button></li>
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

		<div class="item-container">
			<div class="best-itembox">
				<p>
					${list[0].category} <span>Best</span>
				</p>
				<div class="best-item">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
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
						if (getOrder() != null) {
							let listck = document.querySelectorAll("input[name='listOrder']");
							for (let i = 0; i < listck.length; i++) {
								if(listck[i].value == getOrder()){
									listck[i].setAttribute('checked',true);
									var style = document.head.appendChild(document.createElement("style"));
									console.log(i);
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
							<p class="price">${vo.viewPrice}원</p>
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
</body>
</html>