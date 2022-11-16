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
from { transform:translateX(0%);}

to {}
}
@keyframes slide-left {
from {}

to { transform: translateX(0%);}
}
@keyframes slide-right2 {
from { transform:translateX(0%);}

to {}
}
@keyframes slide-left2 {
from {}

to { transform: translateX(0%);}
}

/* 팝업 */
#popup1 {
	position: absolute;
	top: 100px;
	left: 500px;
	background-color: #FFECC8;
}

#popup1  img {
	width: 650px;
	height: 500px;
}

#popup-close {
	padding: 4px 10px;
	display: flex;
	justify-content: space-between;
}

#popup-close label {
	padding-left: 7px;
	font-size: 16px;
	color: #111F36;
}

#popup-close #popup-button {
	padding: 5px 8px;
	margin-bottom: 1px;
	background-color: #B28F3A;
	color: white;
	border: none;
	font-weight: 900;
	cursor: pointer;
}

#popup-close #popup-button:hover {
	background-color: #9D7E33;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
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
						<c:forEach var="vo" items="${best}" varStatus="status">
							<div class="bestitem-box">
								<div class="bestitem-image">
									<a href="${pageContext.request.contextPath}/detail/${vo.id}">
										<img src="${vo.pic1}" alt="" />
									</a>
								</div>
								<div class="bestitem-name">
									<div class="bestitem-name-wrap">
										<div class="bestcount">${status.count}</div>
										<div>
											<a href="${pageContext.request.contextPath}/detail/${vo.id}">
												<c:if test="${vo.discount != 0}">
													<span class="discount">${vo.discount}%</span>
												</c:if> <span> ${vo.name} </span>
											</a>
										</div>
									</div>
									<div class="price">
											<p class="viewprice">${vo.viewPrice}</p>
											<p class="saleprice">${vo.salePrice}원</p>
									</div>
									<div class="item-info">
										<p class="star">
											<span class="stargrade"> <c:choose>
													<c:when test="${vo.stargrade == 5}">★★★★★</c:when>
													<c:when test="${vo.stargrade == 0}"><span class="nonstar">☆☆☆☆☆</span></c:when>
													<c:otherwise>
														<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach><c:forEach begin="0" end="${4 - vo.stargrade}"><span class="nonstar">☆</span></c:forEach>
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
			<div class="bestreview-container">
				<span id="scroll-left1">〈</span> <span id="scroll-right1">〉</span>
				<div class="bestreview-list" id="bestlist1">
					<div class="bestreview-wrap" id="bestwrap1">
						<c:forEach var="vo" items="${bestReview}">
						<div class="bestreview-box-wrap">
						<a href="${pageContext.request.contextPath}/detail/${vo.code}">
						<div class="review-cover">
								<p>상품 페이지 바로가기 ➤</p>
						</div>
							</a>
							<div class="bestreview-box">
								<div class="bestreview-image">
										<img
										src="${pageContext.request.contextPath}/upload/${vo.pic1}"
										alt="" />
								</div>
								<div class="bestreview-name">
									<p class="review-content">${vo.content}</p>
									<p class="hits">👍🏻 ${vo.hits}</p>
									<div class="review-info">
										<p class="reviewstar">
											<span class="stargrade"> <c:choose>
													<c:when test="${vo.stargrade == 5}">★★★★★</c:when>
													<c:when test="${vo.stargrade == 0}">
														<span class="nonstar">☆☆☆☆☆</span>
													</c:when>
													<c:otherwise>
														<c:forEach begin="0" end="${vo.stargrade - 1}">★</c:forEach><c:forEach begin="0" end="${4 - vo.stargrade}"><span class="nonstar">☆</span></c:forEach>
													</c:otherwise>
												</c:choose>
											</span> <span class="product-name">${vo.itemName}</span>
										</p>
									</div>
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
		<a href="${pageContext.request.contextPath}/notice/13"><img
			src="image/popup1.png" alt="" /></a>
		<div id="popup-close">
			<div>
				<input type="checkbox" id="1days" value="check" /><label for="1days">오늘
					하루 보지않기</label>
			</div>
			<div>
				<button id="popup-button">닫기</button>
			</div>
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
		let rSlide2 = document.styleSheets[0].cssRules[2];
		rSlide2.appendRule('100% { transform: translateX(-'+(bestWrap1.offsetWidth-bestList1.offsetWidth)+'px);}');
		let lSlide2 = document.styleSheets[0].cssRules[3];
		lSlide2.appendRule('from { transform: translateX(-'+(bestWrap1.offsetWidth-bestList1.offsetWidth)+'px);}');
	
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
				bestWrap1.classList.remove("slide-left2");
				bestWrap1.classList.add("slide-right2");
				lScroll1.style.visibility="visible";
				rScroll1.style.visibility="hidden";
			});
		}
		
		lScroll1.addEventListener("click",function(){
		
			if(bestWrap1.classList.contains("slide-right2")){
				bestWrap1.classList.remove("slide-right2");
				bestWrap1.classList.add("slide-left2");
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