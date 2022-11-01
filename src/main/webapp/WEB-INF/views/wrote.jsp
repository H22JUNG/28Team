<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

        ul,
        li {
            list-style-type: none;
        }

       body {
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
        #main-image{
            background: url("${pageContext.request.contextPath}/image/KakaoTalk_20221013_170149504.webp") fixed;
            background-size: cover;
            background-position: top;
            width: 100%;
            height: 40vh;
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
            align-items: center;
            padding: 20px;
            min-width: 1200px;
        }
		
		main .mypage-container {
			display: flex;
			width: 80%;
			justify-content: center;
			align-items: center
		}
		
        /* 마이페이지 메뉴 */
        main aside {
            display: flex;
            justify-content: center;
            align-items: center;
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
        main aside ul li:nth-child(4)>div {
            border: 1px solid transparent;
            background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
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
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        main section .my-info {
            width: 500px;
            padding: 20px 0;
        }
        
        main section .my-info ul {
            display: flex;
            flex-direction: column;
        }

        main section .my-info ul li {
            border-bottom: 1px solid #ddd;
            padding: 10px;
            display: flex;
        }
        
        main section .my-info ul li:first-child {
            border-top: 1px solid #ddd;
        }

        main section .my-info ul li span {
            display: block;
            width: 200px;
        }

        main section .my-info ul li input[type="password"]{
            background: #D9D9D9;
            border: 0;
            padding: 0 5px;
            width: 150px;
        }
        /*내가 쓴 글*/
        #ca-search {
           align-self: flex-end;
        }
        #ca-search p {
            color: #616161;
            font-size: 14px;
            display: inline;
        }
        #ca-search button {
            color: #616161;
            font-size: 12px;
            width: 40px;
        }
        #ca-search select {
            color: #616161;
            font-size: 13px;
            width: 100px;
        }
        table {
            color: #616161;
            border-collapse: collapse;
        }
        th {
            color: black;
            border-bottom : 3px solid #21A5B5;
            padding: 10px 0 10px 0;
        }
        td{
            border-bottom : 1px solid #616161;
            padding: 10px 0 10px 0;
            text-align: center;
        }
        td:nth-child(3) {
            text-align: start;
        }
        table a {
        	text-decoration : none;
        	color: #616161;
        }
        #paging {
        	border : 1px solid #21A5B5;
        	background-color: #F8F8F8;
        	text-align : center;
        	border-radius: 10px;
        	padding : 10px;
        }
        /* 푸터 */
        footer {
            width: 100%;
            background-color: #FFECC8;
            z-index: 10;
            font-size: 12px;
            padding: 20px 40px;
            color: #848484;
            display: flex;
        }
        .footer1 {
            width: 70%;
            border-right: 1px solid #848484;
        }
        footer p:nth-child(1) {
            font-size: 15px;
            color: #2C2C2C;
        }
        footer p:nth-child(2) {
            font-size: 15px;
        }
        #footer-tel {
            color:#21A5B5;
            font-size: 25px;
            font-weight: 900;
        }
        footer ul {
            display: flex;
        }
        footer ul li {
            padding: 10px 20px 0 0;
        }
        .footer2 {
            width: 30%;
            align-self: center;
            display: flex;
            justify-content: center;
        }
        .footer2 img{
            width: 50px;
            height: 50px;
            margin: 15px;
            cursor: pointer;
        } 
    </style>
</head>

<body>
    <header>
        <div class="header-top">
            <div class="logo">
                 <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png" alt=""></a>
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
				<h2>내가 쓴 글</h2>
				<div id="ca-search">
					<form action="${pageContext.request.contextPath}/search" method="get">
						<p>카테고리별 조회</p>
						<select name="category" id="category">
							<option value="QnA">QnA</option>
							<option value="review">review</option>
						</select>
						<button>검색</button>
					</form>
				</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.id}</td>
								<td>${item.category}</td>
								<td><a
									href="${pageContext.request.contextPath }/wrotedetail?id=${item.id}&category=${item.category}">${item.title}</a></td>
								<td>${item.owner}</td>
								<td>${item.createDate}</td>
							</tr>
								<c:forEach var="item2" items="${Relist}">
									<c:if test="${item2.reId eq item.id}">
									<tr>
										<td>${item2.id}</td>
										<td>${item2.category}</td>
										<td> └ <a href="${pageContext.request.contextPath }/wrotedetail?id=${item2.id}">${item2.title}</a></td>
										<td>${item2.owner}</td>
										<td>${item2.createDate}</td>
									</tr>
									</c:if>
								</c:forEach>
						</c:forEach>
						<c:if test="${empty list}"><tr><td colspan="5">작성된 글이 없습니다.</td></tr></c:if>
					</tbody>
					
					
					<!-- 관리자 내가 쓴 글 -->
					<c:if test="${allList != null}">
					<tbody>
						<c:forEach var="item" items="${allList}">
							<tr>
								<td>${item.id}</td>
								<td>${item.category}</td>
								<td><a href="${pageContext.request.contextPath }/wrotedetail?id=${item.id}">${item.title}</a></td>
								<td>${item.owner}</td>
								<td>${item.createDate}</td>
							</tr>
								<c:forEach var="item2" items="${Relist}">
								<c:if test="${item2.reId eq item.id}">
									<tr>
										<td>${item2.id}</td>
										<td>${item2.category}</td>
										<td> └ <a href="${pageContext.request.contextPath }/wrotedetail?id=${item2.id}">${item2.title}</a></td>
										<td>${item2.owner}</td>
										<td>${item2.createDate}</td>
									</tr>
								</c:if>
								</c:forEach>
								<!-- 관리자 마이페이지 -->
						</c:forEach>
					</tbody>
					</c:if>
				</table>
			</section>
		</div>
	</main>
    <footer>
        <div class="footer1">
        <p>고객센터 : <span id="footer-tel">1234-1234</span></p>
        <p>09:00 ~ 18:00 (주말 및 공휴일 휴무)</p>
        <ul>
            <li>상호명 : (주)내일의집</li>
            <li>이메일 : h2jung6875@naver.com</li>
            <li>공동대표 : 김희정 신유진 임수정 유승윤 조윤정</li>
            <li>FAX : 02-222-4444</li>
            <li>사업자등록번호 : 333-22-55555</li>
            <li>주소 : 서울 금천구 가산동</li>
        </ul>
        <br>
        <p>Copyright 2022. 28Team, Co., Ltd. All rights reserved</p>
      </div>
      <div class="footer2">
        <img src="${pageContext.request.contextPath}/image/Instagram_icon.png" alt="">
        <img src="${pageContext.request.contextPath}/image/facebook_icon.png" alt="">
        <img src="${pageContext.request.contextPath}/image/Twitter_Logo.png" alt="">
    </div>
    </footer>

	<script>
        for (let i = 0; i < document.getElementById("sidemenulist").children.length; i++) {
            document.getElementsByClassName("sidemenu")[i].addEventListener("click", function(){
                location.href = "${pageContext.request.contextPath}/movemypage/"+i;
            });
        };
	</script>
</body>

</html>
