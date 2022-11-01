<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul, li {
	list-style-type: none;
}

body {
	background:
		url("${pageContext.request.contextPath}/image/KakaoTalk_20221013_170149504.webp")
		0% 300% fixed;
	background-size: cover;
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	z-index: 0;
}

/* 헤더 */
header {
	background-color: white;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-width: 1200px;
}

header .header-top {
	display: flex;
	width: 100%;
	justify-content: flex-end;
}

header .header-top .logo img {
	width: 265px;
}

header .header-top .logo {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

header .header-top .side {
	position: absolute;
}

header .header-top .side ul {
	display: flex;
	gap: 10px;
	margin: 10px;
}

/* 카테고리 */
header .category {
	padding: 10px 20px;
	width: 100%;
}

header .category ul {
	display: flex;
	gap: 30px;
}

header .category ul li {
	display: flex;
	justify-content: center;
	align-items: center;
}

header .category ul li:first-child {
	background: #FFECC8;
	border-radius: 10px;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	padding: 5px 15px 7px;
	gap: 10px;
}

/* 마이페이지 */
main {
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	display: flex;
	justify-content: center;
	padding: 20px;
	min-width: 1200px;
}

main .mypage-container {
	display: flex;
	width: 80%;
	justify-content: center;
}

/* 마이페이지 메뉴 */
main aside {
	display: flex;
	justify-content: center;
	padding: 50px;
}

main aside ul {
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 100%;
}

main aside ul li {
	display: flex;
	justify-content: center;
}

main aside ul li>div {
	border: 1px solid #F0F0F0;
	border-radius: 25px;
	width: 430px;
	height: 130px;
	padding: 30px;
	display: flex;
	justify-content: space-between;
	cursor: pointer;
}

main aside ul li>div .mytext {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

/* 선택중인 메뉴 css */
main aside ul li:first-child>div {
	border: 1px solid transparent;
	background-image: linear-gradient(#fff, #fff),
		linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
	background-origin: border-box;
	background-clip: padding-box, border-box;
}

/* open 버튼 */
main aside ul li>div .open {
	display: flex;
	justify-content: center;
	align-items: center;
}

main aside ul li>div .open>div {
	font-size: 30px;
	background: #f8f8f8;
	border-radius: 15px;
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

main aside ul li>div .open>div span {
	height: 100%;
	background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
}

/* 내정보 */
main section {
	flex: 1.2;
	height: 100%;
	padding: 30px;
	gap: 20px;
}

section {
	margin-bottom: 5%;
}

#right {
	border: 1px solid #D9D9D9;
	border-radius: 20px 20px;
	padding-top: 20px;
}
#emptyOrder{
	border: 1px solid #D9D9D9;
	border-radius: 20px 20px;
	display:flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
	
}
#emptyOrder h4{
display:flex;
justify-content: center;
}
#emptyOrder img{
width: 80px;
}

#rightTop {
	display: flex;
}

#inleft {
	width: 40%;
	line-height: 200%;
	text-align: center;
	font-size: 14px;
	width: 100%;
	justify-content: center;
	
}

#orderNum {
	color: #71B2B4;
}

#inRight {
	flex: 1;
}

.Itembox {
	border-bottom: 1px solid #D9D9D9;
	padding: 10px 0;
}

.smallItembox {
	display: flex;
}

.number {
	text-align: right;
}

.itemImage img {
	width: 100px;
}

.itemboxText {
	flex: 1;
	line-height: 200%;
	font-size: 12px;
	padding: 0 10px;
}
.order-box{
	display: flex;
    justify-content: center;
    gap: 15%;
}

#bottom {
	margin-top: 20px;
	border: 1px solid #71B2B4;
	border-radius: 20px 20px;
	background-color: #71B2B4;
	color: white;
	width: 80%;
	height: 50px;
	align-items: center;
	justify-content: center;
	display: flex;
}

#lastBottom {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80px;
}

#lastBottom h3 {
	border: 1px solid #71B2B4;
	border-radius: 20px 20px;
	background-color: #71B2B4;
	color: white;
	height: 50px;
	width: 70%;
	text-align: center;
	padding-top: 10px;
}

@media ( max-width : 700px) {
	.mypage-container {
		flex-direction: column;
		justify-content: center;
		align-items: center;
		display: flex;
	}
	#right {
		width: 600px;
	}
	#inleft {
		gap: 8%;
	}
}

@media ( max-width : 500px) {
	#right {
		width: 400px;
	}
	.order-box {
    display: flex;
    justify-content: center;
    gap: 8%;
	}
}
</style>
</head>

<body>
	<header>
		<div class="header-top">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png"
					alt=""></a>
			</div>
			<div class="side">
				<ul>
					<li><a href=""><img src="" alt="">검색</a></li>
					<li><a href=""><img src="" alt="">장바구니</a></li>
					<li><a href="${pageContext.request.contextPath}/loginpage">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				</ul>
			</div>
		</div>
		<nav class="category">
			<ul>
				<li>Category</li>
				<li>가구</li>
				<li>패브릭</li>
				<li>수납용품</li>
				<li>생활용품</li>
				<li>공지사항</li>
				<li>Q&A</li>
				<li>이벤트</li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="mypage-container">
			<aside>
				<ul id="sidemenulist">
					<li>
						<div class="sidemenu">
							<div class="mytext">
								<h4>마이페이지</h4>
								<p>내 정보 조회 / 수정 / 적립금조회</p>
							</div>
							<div class="open">
								<div>
									<span>+</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="sidemenu">
							<div class="mytext">
								<h4>장바구니</h4>
							</div>
							<div class="open">
								<div>
									<span>+</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="sidemenu">
							<div class="mytext">
								<h4>주문내역 조회</h4>
								<p>주문 / 배송 조회</p>
							</div>
							<div class="open">
								<div>
									<span>+</span>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="sidemenu">
							<div class="mytext">
								<h4>내가 쓴 글</h4>
							</div>
							<div class="open">
								<div>
									<span>+</span>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</aside>
			<section>
			<c:if test="${empty orderList}">
					<div id="emptyOrder">
					<img src="${pageContext.request.contextPath}/image/empty-icon.png" />
					<h4>주문내역이 존재하지않습니다!</h4>
					</div>
					</c:if>
			
						<c:forEach var="list" items="${orderList}">
				<div id="right">
					<div id="rightTop">
						<div id="inleft">
						<div class="order-box">
							<div id="orderNum">
								<h4>주문 번호</h4>
								<a href="${pageContext.request.contextPath}/orderNumController/${list.orderNum}">${list.orderNum}</a>
							</div>
							<div>
								<h4>주문 날짜</h4>
								<p>${list.orderDate}</p>
							</div>
							<div>
								<h4>결제 수단</h4>
									<c:choose>
							<c:when test="${list.pay eq 'cash'}">
							<p>
								무통장입금
							</p>							
							</c:when>
							<c:otherwise>
							<p>
								카드
							</p>
							</c:otherwise>
							</c:choose>
							</div>
							<div>
								<h4>결제 금액</h4>
								<p>${list.totalPrice}</p>
							</div>
							</div>
						</div>
					</div>

				</div>
							</c:forEach>
				<!--컨테이너 끝-->
			</section>
		</div>
	</main>
	<footer> </footer>
	<script>
	 
        for (let i = 0; i < document.getElementById("sidemenulist").children.length; i++) {
            document.getElementsByClassName("sidemenu")[i].addEventListener("click", function(){
                location.href = "${pageContext.request.contextPath}/movemypage/"+i;
            });
        };
	  </script>
</body>

</html>