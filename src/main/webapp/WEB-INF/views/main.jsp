<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>

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
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 100px 20px 300px;
    gap: 100px;
    min-width: 1200px;
}

main .event {
	width: 900px;
    height: 450px;
}

main .event img {
	width: 100%;
	height: 100%;
}

main .best,
main .best-review {
	width: 1060px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 10px;
	gap: 10px;
}
.best h1,
.best-review h1 {
	color: #71b9c3;
}

/* 베스트 아이템 스크롤 */

.bestitem-container {
	position: relative;
}

.bestitem-container #scroll-left,
.bestitem-container #scroll-left1 {
    position: absolute;
    top: 50%;
    cursor: pointer;
	padding: 10px;
	font-weight: bold;
    font-size: 24px;
    transform: translateX(-100%);
    
}
.bestitem-container #scroll-right,
.bestitem-container #scroll-right1 {
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
.bestitem-box>div {
	width: 240px;
	height: 320px;
	margin: 10px;
}
.bestitem-container {
	width: 100%;
}

.bestitem-container .bestitem-list {
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

.bestitem-box {
	width: 240px;
	display: inline-block;
	margin: 10px;
	white-space: normal;
	font-size: 16px;
}

.bestitem-box .bestitem-image {
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

.bestitem-box .bestitem-name {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 150px;
	padding: 10px;
	gap: 10px;
	margin: 0;
}

.bestitem-name a {
	flex: 1;
	font-size: 16px;
	font-weight: 500;
}
.bestitem-name .review-content {
	flex: 1;
	font-size: 16px;
	font-weight: 500;
}

.bestitem-name a .discount {
	color: #28BACE;
}

.bestitem-name a:hover>span:last-child {
	text-decoration: underline;
}

.bestitem-name .price {
	font-weight: 700;
	cursor: default;
}

.bestitem-name .price .viewprice {
	text-decoration: line-through;
	font-size: 15px;
	text-align: center;
	color: #b2b2b2;
	font-weight: normal;
}

.bestitem-name .item-info {
	display: flex;
	width: 100%;
	justify-content: space-between;
}


/* 별점 */
.star{
	cursor: default;
	display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
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
.star .product-name{
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

.hits {
	width: 100%;
	text-align: right;
}

/* 팝업 */
#popup1 {
   	position : absolute;
   	top : 100px;
   	left : 500px;
   	background-color : #FFECC8;
}
#popup1  img{
   	width : 650px;
   	height : 500px;
}
#popup-close {
   	padding : 4px 10px;
   	display : flex;
   	justify-content : space-between;
}
#popup-close label{
   	padding-left : 7px;
  	font-size : 16px;
  	color : #111F36;
}
#popup-close #popup-button{
   	padding : 5px 8px;
   	margin-bottom : 1px;
   	background-color : #B28F3A;
   	color : white;
   	border : none;
   	font-weight : 900;
   	cursor : pointer;
}
#popup-close #popup-button:hover {
   	background-color : #9D7E33;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<div class="event">
			<img src="image/event.png" alt="">
		</div>
		<div class="best">
			<h1>Best</h1>
			<div class="bestitem-container">
				<span id="scroll-left">〈</span> <span id="scroll-right">〉</span>
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
											<span class="stargrade"> <c:choose>
													<c:when test="${vo.stargrade == 5}">
										★★★★★
									</c:when>
													<c:when test="${vo.stargrade == 0}">
														<span class="nonstar"> ☆☆☆☆☆ </span>
													</c:when>
													<c:otherwise>
														<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach>
														<c:forEach begin="0" end="${4 - vo.stargrade}">
															<span class="nonstar">☆</span>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</span> <span class="review-count">(${vo.reviewCount})</span>
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
		</div>
		<div class="best-review">
			<h1>Best Review</h1>
			<div class="bestitem-container">
				<span id="scroll-left1">〈</span> <span id="scroll-right1">〉</span>
				<div class="bestitem-list" id="bestlist1">
					<div class="bestitem-wrap" id="bestwrap1">
						<c:forEach var="vo" items="${bestReview}">
							<div class="bestitem-box">
								<div class="bestitem-image">
									<a href="${pageContext.request.contextPath}/detail/${vo.code}">
										<img src="${pageContext.request.contextPath}/upload/${vo.pic1}" alt="" />
									</a>
								</div>
								<div class="bestitem-name">
									<p class="review-content">${vo.content}</p>
									<p class="hits">${vo.hits}</p>
									<div class="item-info">
										<p class="star">
											<span class="stargrade"> <c:choose>
													<c:when test="${vo.stargrade == 5}">
										★★★★★
									</c:when>
													<c:when test="${vo.stargrade == 0}">
														<span class="nonstar"> ☆☆☆☆☆ </span>
													</c:when>
													<c:otherwise>
														<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach>
														<c:forEach begin="0" end="${4 - vo.stargrade}">
															<span class="nonstar">☆</span>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</span>
											<span class="product-name">${vo.itemName}</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<div id="popup1">
   		<a href="${pageContext.request.contextPath}/notice/13"><img src="image/popup1.png" alt="" /></a>
	   	<div id="popup-close">
	   		<div><input type="checkbox" id="1days" value="check"/><label for="1days">오늘 하루 보지않기</label></div>
	   		<div><button id="popup-button">닫기</button></div>
	   	</div>
    </div>
	<script>
        var slideIndex = 0;

        window.onload = function () {
            showSlides(slideIndex);

            var sec = 3000;
            setInterval(function () {
                slideIndex++;
                showSlides(slideIndex);
            }, sec);
        }

        function showSlides(n) {
            if ((n + 1) > 7) {
                slideIndex = 0; n = 0;
            } else if (n < 0) {
                slideIndex = (7 - 1);
                n = (7 - 1);
            }
            var slide = document.querySelector(".event img");
            for (let i = 0; i < 7; i++) {
                slide.setAttribute("src", "image/event" + slideIndex + ".png");
            }
        }

     // 베스트아이템 슬라이드
		const bestList = document.getElementById("bestlist");
		const bestWrap = document.getElementById("bestwrap");
		const bestList1 = document.getElementById("bestlist1");
		const bestWrap1 = document.getElementById("bestwrap1");
		const rScroll = document.getElementById("scroll-right");
		const lScroll = document.getElementById("scroll-left");
		const rScroll1 = document.getElementById("scroll-right1");
		const lScroll1 = document.getElementById("scroll-left1");
	
		lScroll.style.visibility="hidden";
		rScroll.style.visibility="hidden";
		lScroll1.style.visibility="hidden";
		rScroll1.style.visibility="hidden";
		
		
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
		if(bestList1.offsetWidth < bestWrap1.offsetWidth) {
			rScroll1.style.visibility="visible";
		
			rScroll1.addEventListener("click",function(){
				bestWrap1.classList.remove("slide-left");
				bestWrap1.classList.add("slide-right");
				lScroll1.style.visibility="visible";
				rScroll1.style.visibility="hidden";
			});
		}
		
		lScroll1.addEventListener("click",function(){
		
			if(bestWrap1.classList.contains("slide-right")){
				bestWrap1.classList.remove("slide-right");
				bestWrap1.classList.add("slide-left");
				rScroll1.style.visibility="visible";
				lScroll1.style.visibility="hidden";
			}
		});
		
		
		//------팝업 쿠키설정------
		window.addEventListener("DOMContentLoaded", function(){
		//document.cookie = "popupClose=oneDay; max-age=0"; 쿠키 삭제
			if(document.cookie=="popupClose=oneDay") {
	        	document.getElementById("popup1").style.display = "none";
			} else {
				document.getElementById("popup1").style.display = "";
			}
		});
		
		
		document.getElementById("popup-button").addEventListener("click", function(){
        	if(document.getElementById("1days").checked==true) {
        		let now = new Date();
        		let tomorrow = new Date();
        		tomorrow.setDate(now.getDate()+1);
        		tomorrow.setHours(0,0,0,0);	//내일 자정까지 설정
        		
        		let date = tomorrow.toUTCString();	
        		document.cookie = "popupClose=oneDay; expires="+date;        	
        	}
        	document.getElementById("popup1").style.display = "none";
		});
		
    </script>
</body>

</html>