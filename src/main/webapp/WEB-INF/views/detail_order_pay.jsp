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
            border: 1px solid #FFFAEE;
            border-radius: 20px 20px;
            height: 100%;
            background-color: #FFFAEE;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 10px;

        }
        #top{
            background-color: white;
            width: 80%;
            display: flex;
            flex-direction: column;
            padding: 20px;
            gap: 5px;

        }
        #top div{
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #dateDiv{
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #center{
            background-color: white;
            width: 80%;
            padding: 10px;
        }
        #center div{
            display: flex;
            align-items: center;
            gap: 10px;
        }
        #bottom{
            background-color: white;
            width: 80%;
            gap: 10px;
            display: flex;
            flex-direction: column;
            padding:  15px 30px;
        }
        .bottomIn{
            display: flex;
            gap: 10px;
       
        }
        .bottomText{
            font-size: 12px;
        
        }
        .bottomText div {
            display: flex;
            align-items: center;
            gap: 10px;
            height: 35px;
        }
       
        .bottomIn div img{
            width: 100px;
            height: 130px;
            object-fit: cover;
        }
        .imageBox{
            justify-content: center;
            align-items: center;
            display: flex;
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
                flex-direction: column;
                font-size: 14px;
            }
            #top{
                height: 40%;
                flex-direction: column;
                display: flex;
            }
            #center{
            padding: 0;
    		font-size: 12px;
            }
         	#center div{
         	padding: 10px;
         	}
        }
        @media (max-width: 500px) {
            #right{
                width: 400px;
                
                font-size: 12px;
            }
            #top{
                
                width:350px;
            }
            #center div{
                gap: 5px;
            }
			#center{
            padding: 0;
            width:350px;
            
            }
            #bottom{
            width:350px;
            }
            .bottomText div{
            gap:3px;
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
					<div id="top">
                        <div><p>주문번호 ${detailOrderInfor[0].orderNum}</p></div>
                       <div id="dateDiv"><h4>주문날짜</h4><p>${detailOrderInfor[0].orderDate}</p>
                    </div> 
                   <div><h4>주문자</h4><p>${detailOrderInfor[0].orderName}</p></div> 
                    <div><h4>연락처</h4><p>${detailOrderInfor[0].orderTel}</p></div> 
                    <div><h4>배송지</h4><p>${detailOrderInfor[0].address} ${detailOrderInfor[0].detailAddress} ${detailOrderInfor[0].extraAddress}</p></div> 
                	<div>
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
                </div><!--intop 끝-->
				<div id="center">
                  <div>
                  <h4>결제 금액 ${detailOrderInfor[0].totalPrice} 원</h4> <h4>사용한 적립금</h4><p>${detailOrderInfor[0].point}원</p>
                  <h4>결제상태</h4>
                  <c:choose>
                  <c:when test="${detailOrderInfor[0].payResult eq '1'}">
                  <p>주문 완료</p>
                  </c:when>
                  <c:when test="${detailOrderInfor[0].payResult eq '2'}">
                  <p>취소 신청</p>
                  </c:when>
                  <c:when test="${detailOrderInfor[0].payResult eq '3'}">
                  <p>환불</p>
                  </c:when>
                  <c:otherwise>
                  <p>교환</p>
                  </c:otherwise>
                  </c:choose>
                  </div>
                </div><!--center 끝-->
                <div id="bottom">
                <c:forEach var="vo" items="${detailOrderInfor}">
                    <div class="bottomIn">
                        <div class="imageBox">
                            <img src="${vo.pic1}" alt="">
                        </div>
                        <div class="bottomText">
                     <div><h4>상품명</h4><p>${vo.itemName}</p></div>   
                     <div><h4>컬러</h4><p>${vo.color}</p></div>
                    <div><h4>수량</h4><p>${vo.count}</p></div>
                    <div><h4>상품가격</h4><p>${vo.itemPrice}</p></div>
                        </div>
                    </div><!-- bottomIn-->
                    </c:forEach>
                </div>
				</div><!-- right 끝 -->
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