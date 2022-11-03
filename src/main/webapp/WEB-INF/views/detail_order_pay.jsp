<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style>
       

        /* 마이페이지 */
        main {
            background-color: white;
            position: relative;
            top: 33%;
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 20px;
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
            gap: 20px;
        }
        section{
            margin-bottom: 5%;
        }
        

        #right{
            border: 1px solid #D9D9D9;
            border-radius: 20px 20px;
            padding-top: 20px;
            
            
            
        }
        #rightTop{
            display: flex;
        }
       
        #inleft{
            width: 40%;
            line-height: 200%;
            text-align: center;
            font-size: 14px;
        }
        #inRight{
            
            flex: 1;
        }
        .Itembox{
            border-bottom: 1px solid  #D9D9D9;
            padding: 10px 0;
        }
        .smallItembox{
            display: flex;
        }
        .number{
            text-align: right;
        }
        .itemImage img {
            width: 100px;
    		height: 120px;
    		object-fit: cover;
        }
        .itemboxText{
            flex: 1;
            line-height: 200%;
            font-size: 12px;
            padding:0 10px;
        }
        #bottom{
            margin-top: 20px;
            border: 1px solid   #71B2B4;
            border-radius: 20px 20px;
            background-color:   #71B2B4;
            color: white;
            width: 80%;
            height: 50px;
            align-items: center;
            justify-content: center;
            display: flex;
        }
      
        #lastBottom{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80px;
        }
        #lastBottom h3{
            border: 1px solid  #71B2B4;
            border-radius: 20px 20px;
            background-color:  #71B2B4;
            color: white;
            height: 50px;
            width: 70%;
            text-align: center;
            padding-top: 10px;
        }
        @media (max-width: 700px) {
            .mypage-container{
                flex-direction: column;
                justify-content: center;
                align-items: center;
                display: flex;
            }
            #right{
                width: 600px;
            }
            #inleft{
                width: 20%;
            }
        }
        @media (max-width: 500px) {
            #right{
                width: 400px;
                padding-left: 20px;
            }
		
        }
       
    </style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
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
				<div id="right">
					<div id="rightTop">
						<div id="inleft">
					<h4>주문자 이름</h4>
							<p>${detailOrderInfor[0].orderName}</p>
							<h4>주문 날짜</h4>
							<p>${detailOrderInfor[0].orderDate}</p>
							<h4>주문 수량</h4>
							<p>${detailOrderInfor[0].count}</p>
							<h4>결제 수단</h4>
							<c:choose>
							<c:when test="${detailOrderInfor[0].pay eq 'cash'}">
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
						<div id="inRight">
						<c:forEach var="vo" items="${detailOrderInfor}">
						<div class="itembox">
							<div class="smallItembox">
								<div class="itemImage">
									<img
										src="${vo.pic1}">
								</div>
								<div class="itemboxText">
									<h4>상품 이름 : ${vo.itemName}</h4>
									<p>Size : ${vo.size}</p> 
									<p>Color : ${vo.color}</p>
									<p>수량 : ${vo.count}</p>
									<h4>상품 가격 : ${vo.itemPrice}</h4>
								</div>
							</div>
						</div>
					</c:forEach>
							<div id="bottom">
									<h3>결제 금액 : ${detailOrderInfor[0].totalPrice} 원</h3>
							</div>
						</div>
						<!--inRight끝-->
					</div>
					<div id="lastBottom">
						<h3>주문 번호 : ${detailOrderInfor[0].orderNum}</h3>
							
					</div>
				</div>
				<!--컨테이너 끝-->
		</section>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	 <script>
	 
        for (let i = 0; i < document.getElementById("sidemenulist").children.length; i++) {
            document.getElementsByClassName("sidemenu")[i].addEventListener("click", function(){
                location.href = "${pageContext.request.contextPath}/movemypage/"+i;
            });
        };
	  </script>
</body>

</html>