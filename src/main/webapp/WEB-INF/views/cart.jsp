<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    ﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            align-items: center;
            padding: 20px;
            min-width: 1200px;
        }
		
		main .mypage-container {
			display: flex;
			width: 80%;
			justify-content: center;
    		align-items: flex-start;
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
        main aside ul li:nth-child(2)>div {
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

        /* 수정버튼 */
        main section .edit {
            width: 500px;
            display: flex;
            justify-content: flex-end;
            padding : 20px 0;
        }
        
        main section .edit #edit {
            background: #D9D9D9;
            border: 0;
            width: 90px;
            height: 30px;
            cursor: pointer;
        }
        
        /* 장바구니 */
        
        /* 비어있을 경우 */
        .cartEmpty {
        	font-size: 300px;
        	text-align: center;
        	color: #4a4a4a;
        }
        
		.cart_container {
            width: 70%;
            min-width: 800px;
            /* border: 1px solid rgb(173, 173, 173); */
        }

        /* 장바구니 테이블 */
        table,
        th,
        td {
            /* border: 1px solid gray; */
            border-top: none;
            border-collapse: collapse;
            text-align: center;
        }

        table {
            border-top : 2px solid black;
            border-bottom: 2px solid rgb(218, 218, 218);
        }

        th{
            border-bottom: 1PX SOLID RGB(218, 218, 218);
        }
        
        #ct_cont> div> table> tbody> tr> td {
        	border-bottom: 1PX SOLID RGB(218, 218, 218);
        }

        /* 장바구니 header */
        .cart_goods {
            border-bottom: 1px solid #16181a;
            padding: 0px 0px 20px;
            display: flex;
            justify-content: space-between;
        }

        .cart_goods_text {
            /* border: 1px solid green; */
            font-size: 20px;
            font-weight: bold;
        }

        .step_location {
            font-weight: bold;
            font-size: 1.08rem;
        }

        .step_location_1 {
            color: #21A5B5;
        }

        .material-symbols-outlined {
            font-size: 20px;
        }

        .symbols1 {
            color: #21A5B5;
        }

        .next {
            font-weight: 2000;
            font-size: 1.2rem;
        }

        .next1 {
            color: #21A5B5;
        }

        /* 장바구니 header */


        /* 상품 정보 */
        input[type="checkbox"] {
            -webkit-appearance: none;
            position: relative;
            width: 22px;
            height: 22px;
            cursor: pointer;
            outline: none !important;
            border: 1px solid #eeeeee;
            border-radius: 2px;
            background: #fbfbfb;
        }

        input[type="checkbox"]::before {
            content: "\2713";
            position: absolute;
            top: 50%;
            left: 50%;
            overflow: hidden;
            transform: scale(0) translate(-50%, -50%);
            line-height: 1;
        }

        input[type="checkbox"]:hover {
            border-color: rgba(170, 170, 170, 0.5);
        }

        input[type="checkbox"]:checked {
            background-color: #21A5B5;
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
        }

        input[type="checkbox"]:checked::before {
            border-radius: 2px;
            transform: scale(1) translate(-50%, -50%)
        }

        .info {
            width: 70%;
            padding: 10px;
        }

        .order {
            width: 15%;
        }

        .img {
            width: 15%;
            border-right: 1px solid white;
        }

		.dbimg {
			width: 110px;
			height: 150px;
		}

		#ct_cont {
			padding: 0;
		}

        .main_content {
            height: 200px;
        }
        
        .right_line {
            border-right: 1px solid rgb(206, 206, 206);
        }

        .top_line {
            border-top: 1px solid rgb(206, 206, 206);
            padding: 8px;
        }

        .line {
            border-top: 1px solid rgb(219, 219, 219);
            width: 95%;
            margin-left: 10px;
            margin-right: 20px;

        }

		.prod_name {
			padding-bottom: 10px;
		}

        .item {
            display: flex;
            /* align-items: flex-end; */
            justify-content: space-around;
            padding-top: 10px;
        }

        .op_name {
            margin: 0;
            width: 200px;
        }
        
        .op_name_inner {
            margin-top: 2px;
            font-size: 13px;
        }
        
        .op_name_inner span span {
        	color: #21A5B5;
        	font-weight: bold;
        }
		
		del {
			font-size: 12px;
		}

        .price {
            display: flex;
            padding-left: 10px;
        }

        .dc {
            font-size: 14px;
		    color: #42a43f;
		    font-weight: bold;
        }
        .origin {
            font-size: 13px;
            margin: 0;
            color: orangered;
            font-weight: bold;
        }

        .bt_del {
            border: 1px solid rgb(212, 212, 212);
            background-color: white;
            height: 25px;
            width: 25px;
            cursor: pointer;
        }

        .all_delete_btn {
            border: 1px solid #21A5B5;
            background-color: #21A5B5;
            color: white;
            padding: 3px 5px;
            cursor: pointer;
            font-weight: bold;
        }
        
        .delete_btn {
        	border: 1px solid #21A5B5;
        	background-color: white;
        	color: #21A5B5;
            cursor: pointer;
            height: 25px;
    		padding: 0px 4px 0;
    		margin-top: 10px;
    		margin-left: 10px;
        } 

        .bt_cnt {
            /* 굳이 없어도 되나? */
            width: 300px;
            display: flex;
            justify-content: right;
        }
        
        .bt_cnt_inner {
        	padding-top: 10px;
        }

        .ip_quantity {
            border: 1px solid rgb(212, 212, 212);
            width: 25px;
            height: 25px;
            text-align: center;
            margin-left: -7px;
            border-right: none;
            /* border-left: none; */
        }
        
        .quantity_modify_btn {
        	font-size: 13px;
		    padding: 2px 3px 3px 3px;
		    border: 1px solid #21A5B5;
		    color: #21A5B5;
		    cursor: pointer;
        }

        .cnt_minus,
        .cnt_plus {
            background-color: white;
            border: 1px solid rgb(212, 212, 212);
            color: gray;
            font-weight: bold;
            height: 25px;
            width: 25px;
            cursor: pointer;
        }
        
        .cnt_plus {
        	margin-left: -6px;
        }

        .num {
            font-size: 1.1rem;
            font-weight: bold;
            color: #00546d;
        }

        /* // 상품 정보 */

        .ct_total {
            display: flex;
            justify-content: space-between;
            padding: 40px 0;
        }

        /* .ct_total2{
            display: flex;
            justify-content: space-between;
        } */

        .ct_total> table, tr, td {
			border: none;
        }
        
        .ct_total tr> td> span {
        	font-weight: bold;
        }
        
        .matter {
        	width: 230px;
        }
        
        .matter td:first-child {
        	text-align: left;
        }
        
        .matter td:last-child {
        	text-align: right;
        }

        /* 없어도 됌 */
        /* dd {
            margin-left: 10px;
        } */

        .total {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 15px 0;
        }

        /* dt{
            float: left;
        } */
        h3 {
            font-size: 2rem;
        }

        ._buy_amount {
            font-weight: bold;
        }

        ._total_amount {
            font-weight: bold;
            font-size: 1.5rem;
            color: #21A5B5;
        }

        ._delivery_amount {
            font-weight: bold;
        }

        .total_price_name {
            font-size: 20px;
            font-weight: bold;
            color: #21A5B5;
        }
        
		.finalResultPrice_span {
			color: #21A5B5;
		    font-size: 1.7rem;
		    font-weight: bold;
		}

        .total {
            border-top: 1px solid rgb(219, 219, 219);
            padding-top: 15px;
        }


        /* 맨 마지막 버튼 */
        .bt_area {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .bt_continue {
            text-decoration: none;
            color: gray;
            font-weight: bold;
            border: 1px solid #21A5B5;
            padding: 15px 55px;
            cursor: pointer;
        }
        
        .order_btn {
            font-size: 1rem;
            color: white;
            font-weight: bold;
            border: 1px solid #21A5B5;
            background-color: #21A5B5;
            padding: 15px 70px;
            margin-left: 15px;
            cursor: pointer;
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
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>장바구니</h4>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
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
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>내가 쓴 글</h4>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
            </ul>
        </aside>
        <section>

				<!-- 장바구니가 비었을 때 -->
				<c:if test="${empty cartInfo}">
					<div class="cartEmpty">
						<h1>텅</h1>
					</div>
				</c:if>
				
				<!-- 장바구니 품목이 있을 때 -->
				<c:if test="${!empty cartInfo}">
				<!-- <p>${cartInfo} - 정보 제대로 넘어오는지 확인</p>  -->
				<div class="cart_container">
					<!-- 장바구니 header -->
					<div class="ct_header">
						<div class="cart_goods">
							<!-- <span class="cart_goods_text"> 전체 <span class="cart_goods_num _cart_cnt">db</span> 개</span>  -->
							<h1>장바구니</h1>
							<div class="step_location">
								<span class="step_location_1">01 장바구니</span>&nbsp;<span
									class="next next1">⟩</span>&nbsp; <span class="step_location_2">02
									주문/결제</span>&nbsp;<span class="next">⟩</span>&nbsp; <span
									class="step_location_3">03 결제완료</span>
							</div>
						</div>
					</div>
					<!-- // 장바구니 header -->

					<section id="ct_cont">
						<div>
							<table>
								<thead>
									<tr>
										<th>
											<input type="checkbox" class="check_all" checked="checked">
										</th>
										<th class="img"></th>
										<th class="info right_line">상품정보</th>
										<th class="order">총 상품금액</th>
									</tr>
								</thead>
								<!-- 
									
									 -->
								<tbody>
									<!-- 여기에 foreach를 넣자 -->
									<c:forEach var="vo" items="${cartInfo}">
										<tr>
											<td class="td_width_1 cart_info_td">
		                                        <input type="checkbox" class="chbox" name="chbox" checked="checked" data-cart_num="${vo.cartNum}">
		                                        <input type="hidden" class="individual_cartNum_input" value="${vo.cartNum}">								
		                                        <input type="hidden" class="individual_price_input" value="${vo.price}">
		                                        <input type="hidden" class="individual_salePrice_input" value="${vo.salePrice}">
		                                        <input type="hidden" class="individual_count_input" value="${vo.count}">
		                                        <input type="hidden" class="individual_resultPrice_input" value="${vo.salePrice * vo.count}">
		                                        <!-- <input type="hidden" class="individual_point_input" value="${ci.point}">  -->
		                                        <!-- <input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">  -->
		                                        <input type="hidden" class="individual_proNum_input" value="${vo.proNum}">								
	                                    	</td>
											<td><img class="dbimg" src="${vo.pic1}" alt=""></td>
											<td class="main_content right_line">
												<div class="prod_tit">
													<!-- <a href="" target="_blank">여기에 상품 링크 걸고</a> -->
													<div class="prod_name">
														<strong class="name">${vo.itemName}</strong>
													</div>
												</div>
	
												<div class="higlight_wrap">
													<p class="line"></p>
					
													<div class="item">
														<p class="op_name">
															<span class="op_name_inner">
																<span>상품코드 : <span>${vo.proNum}</span></span><br />
																<c:if test="${vo.color ne '선택없음' and vo.color ne ''}">
																	<span>컬러 : <span>${vo.color}</span></span>
																</c:if>
																<c:if test="${vo.size ne '선택없음' and vo.size ne ''}">
																	<span>사이즈 : <span>${vo.size}</span></span>
																</c:if>
															</span>
														</p>
														<div class="bt_cnt">
															<div class="bt_cnt_inner">
																<button type="button" class="cnt_minus">﹣</button>
																<!-- value에 db에서 불러온 수량을 넣어줘야함. -->
																<input type="text" class="ip_quantity" value="${vo.count}" name="count" readonly>
																<button type="button" class="cnt_plus">﹢</button>
																<a class="quantity_modify_btn" data-cart_num="${vo.cartNum}">변경</a>
															</div>
															<div class="price">
																<div class="price_inner">
																<c:if test="${vo.price ne vo.salePrice}">
																	<del>정가 : <fmt:formatNumber value="${vo.price}" pattern="#,### 원" /></del><br>
																</c:if>
																	<!-- <p class="origin">${vo.price}가격</p>  -->
																	<p class="dc"><fmt:formatNumber value="${vo.salePrice}" pattern="#,### 원" /></p>
																</div>
																<button type="button" class="delete_btn" data-cart_num="${vo.cartNum}">✖</button>
															</div>
														</div>
														
													</div>
												</div>
											</td>
											<td>
												<!-- 주문 금액 -->
												<div class="order_price">
													<div class="price_inner">
														<div class="price_cont">
															<p class="final">
																<span class="num"><fmt:formatNumber value="${vo.resultPrice}" pattern="#,### 원" /></span>
															</p>
														</div>
													</div>
												</div> <!-- // 주문 금액 -->
											</td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot>
									<tr>
										<td class="top_line">
											<!-- <input type="checkbox" class="_check_all" checked="checked">  -->
										</td>
										<td class="top_line">
											<div class="product_footer">
												<!-- <button class="delete_btn" data-cart_num="${vo.cartNum}">삭제</button>  -->
												<button type="button" class="all_delete_btn">선택 삭제</button>
											</div>
										</td>
										<td class="top_line" colspan="2"></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</section>

					<!-- 총 주문금액 -->
					<div class="ct_total">
						<h3>총 주문금액</h3>
						<table class="matter">
							<tr>
								<td>총 상품 가격</td>
								<td>
									<span class="resultPrice_span"></span> 원
								</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>
									<span class="delivery_price"></span> 원
								</td>
							</tr>									
							<tr>
								<td>총 주문 상품수</td>
								<td><span class="totalKind_span"></span> 종 <span class="totalCount_span"></span> 개</td>
							</tr>
						</table>
					</div>

					<div class="ct_total2">
						<dl class="total">
							<dt class="total_price_name">결제 예상금액</dt>
							<dd>
								<span class="finalResultPrice_span"></span> 원
							</dd>
						</dl>
					</div>
					<!--// 총 주문금액 -->

					<!-- 쇼핑 계속하기, 구매하기 -->
					<div class="bt_area">
						<!-- <a href="" class="bt_continue">쇼핑 계속하기</a>  -->
						<button type="button" class="order_btn">구매하기</button>
					</div>
				</div>
				</c:if>
				
                <!-- 수량 조정 form -->
                <form action="${pageContext.request.contextPath}/cart/update" method="post" class="quantity_update_form">
                    <input type="hidden" name="cartNum" class="update_cartNum">
                    <input type="hidden" name="count" class="update_count">
                    <input type="hidden" name="userid" value="${user.userid}">
                </form>	
                
                <!-- 삭제 form -->
                <form action="${pageContext.request.contextPath}/cart/delete" method="post" class="quantity_delete_form">
                    <input type="hidden" name="cartNum" class="delete_cartNum">
                    <input type="hidden" name="userid" value="${user.userid}">
                </form>		
                
                <!-- 주문 form -->
                <form action="${pageContext.request.contextPath}/CartInforController" method="post" class="order_form">
    
                </form>			
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
        
        // 창이 뜨자마자 사용자가 바로 볼 수 있어야 하기 때문에
        $(document).ready(function(){
        	setTotalInfo();
        });
        
        /* 체크여부에 따른 종합 정보 변화*/
        $(".chbox").on("change", function(){
        	// 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류)
        	setTotalInfo($(".cart_info_td"));
        });
        
        /* 체크박스 전체 선택 - 수정 완료*/
        $(".check_all").on("click", function(){
        	/* 체크박스 체크/해제 */
        	if($(".check_all").prop("checked")){
        		// 처음에는 attr로 했는데 전체 체크박스가 제대로 작동안해서 prop로 바꿔줌
        		$(".chbox").prop("checked", true);
        	} else{
        		$(".chbox").prop("checked", false);
        	}
        	
        	/* 총 주문 정보 세팅 업데이트(배송비, 총 가격, 마일리지, 물품 수, 종류) */
        	setTotalInfo($(".cart_info_td"));
        	
        });
        
        /* 한개의 체크박스가 해제되면 전체 체크박스가 해제되게*/
        $(".chbox").click(function(){
        	$(".check_all").prop("checked", false);
        });
        
        /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
        function setTotalInfo(){
        	/* 종합 정보 섹션 정보 삽입*/
        	let resultPrice = 0;			// 총 가격
        	let totalCount = 0;				// 총 갯수
        	let totalKind = 0;				// 총 종류
        	let totalPoint = 0;				// 총 마일리지
        	let deliveryPrice = 0;			// 배송비
        	let finalResultPrice = 0; 		// 최종 가격(총 가격 + 배송비)
        	
        	// 순회하며 종합 정보('총 가격', '총 개수', '총 종류', '총 마일리지')를 계산해내는 로직
        	// parseInt() 메서드를 사용한 이유는 <input> 태그의 값을 얻어오면 그 값은 'string' 타입으로 인식이 되어서 이를 int 타입으로 변경해주기 위함
        	$(".cart_info_td").each(function(index, element){
        		
        		if($(element).find(".chbox").is(":checked") === true){	//체크여부
        			// 총 가격
        			resultPrice += parseInt($(element).find(".individual_resultPrice_input").val());
        			// 총 갯수
        			totalCount += parseInt($(element).find(".individual_count_input").val());
        			// 총 종류
        			totalKind += 1;
        			// 총 마일리지
        			// totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());			
        		}
        	});
        	
        	/* 배송비 결정 */
        	if(resultPrice == 0){
        		deliveryPrice = 0;
        	} else {
        		deliveryPrice = 2500;	
        	}
        	
        	// 최종 가격
        	finalResultPrice = resultPrice + deliveryPrice;
        	
        	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
        	
        	/* 값 삽입 */
        	// 총 가격
        	$(".resultPrice_span").text(resultPrice.toLocaleString());
        	// 총 갯수
        	$(".totalCount_span").text(totalCount);
        	// 총 종류
        	$(".totalKind_span").text(totalKind);
        	// 총 마일리지
        	// $(".totalPoint_span").text(totalPoint.toLocaleString());
        	// 배송비
        	$(".delivery_price").text(deliveryPrice);	
        	// 최종 가격(총 가격 + 배송비)
        	$(".finalResultPrice_span").text(finalResultPrice.toLocaleString());		
        }

        
        // 상품 옵션 수량 변경 버튼 구현
        /*
        $('.bt_cnt_inner :button').on({
            'click' : function(e){
                e.preventDefault();
                var $count = $(this).parent('.bt_cnt_inner').find('.ip_quantity');
                var now = parseInt($count.val());
                var min = 1;
                var max = 999;
                var num = now;
                if($(this).hasClass('cnt_minus')){
                    var type = 'm';
                }else{
                    var type = 'p';
                }
                if(type=='m'){
                    if(now>min){
                        num = now - 1;
                    }
                }else{
                    if(now<max){
                        num = now + 1;
                    }
                }
                if(num != now){
                    $count.val(num);
                }
            }
        });
        */
        
        /* 수량버튼 */
        $(".cnt_plus").on("click", function(){
        	let quantity = $(this).parent(".bt_cnt_inner").find(".ip_quantity").val();
        	$(this).parent(".bt_cnt_inner").find(".ip_quantity").val(++quantity);
        });
        $(".cnt_minus").on("click", function(){
        	let quantity = $(this).parent(".bt_cnt_inner").find(".ip_quantity").val();
        	if(quantity > 1){
        		$(this).parent(".bt_cnt_inner").find(".ip_quantity").val(--quantity);		
        	}else{
        		alert("해당 상품의 구매 가능한 최소수량은 1개 입니다.");
        	}
        });
        
        /* 수량 수정 버튼 */
        $(".quantity_modify_btn").on("click", function(){
        	let cartNum = $(this).data("cart_num");
        	let count = $(this).parent(".bt_cnt_inner").find(".ip_quantity").val();
        	$(".update_cartNum").val(cartNum);
        	$(".update_count").val(count);
        	$(".quantity_update_form").submit();
        });
        
        /* 장바구니 삭제 버튼 */
        $(".delete_btn").on("click", function(e){
        	e.preventDefault();
        	let cartNum = $(this).data("cart_num");
        	//console.log("cartNum : "+cartNum);
        	$(".delete_cartNum").val(cartNum);
        	$(".quantity_delete_form").submit();
        });
        
        /* 장바구니 전체 삭제 버튼 */
        $(".all_delete_btn").click(function(){
        	var confirm_val = confirm("정말 삭제하시겠습니까?");
        	
        	if(confirm_val){
        		var checkArr = new Array();
        		
        			//checkArr.push($(this).attr("data-cart_num"));
        		$("input[class = 'chbox']:checked").each(function(){
        			checkArr.push($(this).data("cart_num"));
        		});
        		
        		console.log(checkArr);
        		
        		$.ajax({
        			url : "${pageContext.request.contextPath}/cart/deleteAll",
        			type : "POST",
        			//contentType : "application/json; charset=UTF-8",
        			data : {chbox : checkArr},
        			success : function(result){
						if(result == 1){
							alert("삭제 성공");
							//location.href = "${pageContext.request.contextPath}/cart/"+${user.userid};
							location.reload();
							
							// 미세한 깜빡임을 줄이려고 이렇게 써봄 ㅠ! - 근데 이렇게 하면 재계산이 안되네......ㅎㅎ
							//$(".cart_container").load("${pageContext.request.contextPath}/cart/${user.userid} .cart_container");
						}else {
							alert("삭제 실패");
						}
        			}
        		});
        	}
        });
        
        /* 주문 페이지 이동 */	
        $(".order_btn").on("click", function(){
        	
        	let form_contents ='';
        	let orderNumber = 0;
        	
        	$(".cart_info_td").each(function(index, element){
        		
        		if($(element).find(".chbox").is(":checked") === true){	//체크여부(체크가 되어있으면)
        			
        			let count = $(element).find(".individual_count_input").val();
        			let cartNum	 = $(element).find(".individual_cartNum_input").val(); //카트넘이 필요해.....
        			let price = $(element).find(".individual_salePrice_input").val();
        			
        			let cartNum_input = "<input name='orders[" + orderNumber + "].cartNum' type='hidden' value='" + cartNum + "'>";
        			form_contents += cartNum_input;
        			
        			let count_input = "<input name='orders[" + orderNumber + "].count' type='hidden' value='" + count + "'>";
        			form_contents += count_input;
        			
        			let price_input = "<input name='orders[" + orderNumber + "].salePrice' type='hidden' value='" + price + "'>";
        			form_contents += price_input;
        			orderNumber += 1;
        			
        		}
        	});	
        	
        	$(".order_form").html(form_contents);
        	$(".order_form").submit();
        	
        });
	    </script>
</body>

</html>