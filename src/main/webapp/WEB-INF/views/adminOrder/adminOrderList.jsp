<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
    ﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style>

/* 컨테이너 */
main {
	background-color: #FFFAEE;
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
	align-items: start;
	padding-top: 30px;
}

/* 사이드 메뉴 */
main aside {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
	background-color: white;
	border-radius: 30px;
	margin: 20px;
	width: 300px;
}

main aside ul {
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 100%;
}

main aside ul li {
	padding: 15px 0 15px 0;
}

main aside .menu a {
	text-decoration: none;
	color: #000;
	margin: 20px 0 20px 0;
}

main aside .menu {
	border: 1px solid #F0F0F0;
	border-radius: 25px;
	width: 100%;
	padding: 10px;
	justify-content: space-between;
}

#sidemenulist h3 {
	text-align: center;
}

/* 내용 컨테이터 */
.content-box {
	width: 100%;
	/*max-height: 860px;*/
}

main section {
	flex: 1.2;
	height: 100%;
	padding: 30px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: white;
	border-radius: 30px;
	margin: 10px;
}

/* 컨텐츠 메뉴 */
.side-menu {
	display: flex;
    justify-content: space-evenly;
}

.side-menu li {
	padding: 0 15px 0 15px;
}

.side-menu a {
	text-decoration: none;
	color: #000;
}

/* 여기서부터 윤정이거! */

#orderSearch {
	height: 25px;
}

#search button {
	font-size: 12px;
    width: 40px;
    height: 24px;
    background-color: white;
    border: 1px solid #21A5B5;
    color: #21A5B5;
    font-weight: bold;
    cursor: pointer;
}

#search form {
	float: right;
}

#orderSearch select {
	color: #616161;
	font-size: 13px;
	width: 110px;
    height: 25px;
}

#content {
	height: 25px;
}

.side-menu li h4 a {
    border: none; 
    padding: 10px 24px;
    border-radius: 10px;
    background-color: #d3fbff;
    color: #21A5B5;
    font-weight: bold;
}

.side-menu li h4 a:active {
	background-color: #80f3ff;
}

.side-menu_inner {
    display: flex;
}

.delivNumberAdd_btn {
    border: none;
    background-color: #d3fbff;
    padding: 6px;
    font-weight: bold;
    color: #21A5B5;
    cursor: pointer;
}

table, th, td{
    border-top: 1px solid rgb(206, 206, 206);
    border-bottom: 1px solid rgb(206, 206, 206);
    border-collapse: collapse;
    padding: 10px 25px;
    text-align: center;
}

table {
	width: 100%;
}

.btn-open-popup {
	text-decoration: underline;
	cursor: pointer;
	color: #26a3cf;
    font-weight: bold;
}

.form-group {
	margin-top: 5px;
	display: flex;
    flex-direction: row;
    justify-content: center;
}

.form-control {
	width: 150px;
    height: 30px;
    border: 1px solid #c5c5c5;
    margin-right: 2px;
}

.btn-round {
	height: 30px;
    width: 40px;
    border: 1px solid #21A5B5;
    background-color: white;
    font-weight: bold;
    color: #21A5B5;
    cursor: pointer;
}

.modalProNum {
	color: blue;
}

/* 모달 */

/* 스크롤바 색상 변경 */
/*
            #modal_body {
                width: 200px;
                height: 400px;
                overflow: auto;
            }
            */
 
            #modal_body::-webkit-scrollbar {
                width: 10px; /*스크롤바의 너비*/
            }
 
            #modal_body::-webkit-scrollbar-thumb {
                background-color: #21A5B5; /*스크롤바의 색상*/
            }
 
            #modal_body::-webkit-scrollbar-track {
                background-color: #d6f5ff; /*스크롤바 트랙 색상*/
            }



#modal {
	/* position: absolute; */
	position: fixed;
	top: 0;
	left: 0;
	
	width: 100%;
	height: 100%;
	
	display: none;
	
	background-color: rgba(0,0,0,0.4);
}

.modal.show-modal {
	display: block;
}

#modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 800px;
  height: 1000px;
  
  padding: 30px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
  
  display: flex;
  flex-wrap: wrap;
  
  overflow-y: auto;
  max-height: calc(100vh - 220px);
}

.modal_close_btn {
	position: relative;
    left: 700px;
    cursor: pointer;
    z-index: 1;
    color: #21A5B5;
}

#orderNum_modal {
	/*border: 1px solid orange;*/
	width: 100%;
	height: 10%;
}

#orderNum_modal> h1 {
	color: #1c727c;
	font-size: 2rem;
}

#orderInfo_left {
	/*border: 1px solid black;*/
	width: 30%;
	height: 90%;
}

#orderInfo_right {
	/*border: 1px solid green;*/
	width: 70%;
	height: 90%;
	display: flex;
    flex-direction: column;
}

#right_inner {
	/*border: 1px solid blue;*/
	width: 100px;
	height: 100px;
}

.right_inner {
	display: flex;
    /*justify-content: space-between;*/
    align-items: center;
    padding: 0.8rem 2rem;
}

.right_inner_info {
	width: 500px;
    align-items: center;
    justify-content: center;
}

.right_img {
    height: 7rem;
    width: 6rem;
}

#modal_pic1 {
	height: 8rem;
    width: 7rem;
}

#orderInfo_left> div {
	display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    padding: 20px;
}

#orderInfo_left> div> h4>  p {
	color: #229ead;
	font-size: 1.2rem;
}

#orderInfo_right> div {
	border-bottom: 1px solid #d7d7d7;
}


.paybtn {
    border: none;
    background-color: #d3fbff;
    padding: 6px;
    font-weight: bold;
    color: #21A5B5;
    cursor: pointer;
}

.cancelbtn {
    border: none;
    background-color: #d3fbff;
    padding: 6px;
    font-weight: bold;
    color: #21A5B5;
    cursor: pointer;
}



.td_form_button>form>button {
	margin: 3px;
	width: 5rem;
}

.delivstate_inner {
	display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
    align-items: center;
}

.delivnum_output {
	width: 8rem;
    height: 30px;
    color: #000000;
    font-weight: bold;
    font-size: 0.9rem;
    border: none;
    border-bottom: 1px solid #26a3cf;
    text-align: center;
}

.delivnum_modify_btn {
	border: 1px solid #26a3cf;
    padding: 4px;
    color: #26a3cf;
    cursor: pointer;
    font-weight: bold;
}

.delivstate_modify_btn {
	border: 1px solid #006ab9;
    padding: 4px;
    color: #006ab9;
    cursor: pointer;
    font-weight: bold;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		<div class="mypage-container">
			<aside>
				<ul id="sidemenulist">
					<h3>관리자페이지</h3>
					<div class="menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpage/1?searchUser=&userInfo=" class="menu1">✔ 회원관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin_product_list/1?order=&content=" class="menu1">✔ 상품관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=1" class="menu1" style="color: #21A5B5;">✔ 주문관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-admin-list" class="menu1">✔ 관리자 정보수정</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-logout" id="admin-logout" class="menu1">✔ 로그아웃</a>
							</h4>
						</li>
					</div>
				</ul>
			</aside>
			<div class="content-box">
				<section>
				<!-- <button class="menu2" onclick="location.href='http://localhost:8080/Team28/adminOrder?delivstate=2'"> -->
					<ul class="side-menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=1" class="menu2">상품준비중<span>(${orderState1})</span></a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=2" class="menu2">배송중<span>(${orderState2})</span></a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=4" class="menu2">취소신청<span>(${orderState3})</span></a>
							</h4>
						</li>
                        <div class="side-menu_inner">
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=5" class="menu2">환불완료</a>
							</h4>
						</li>
                        <!-- 
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=6" class="menu2">교환처리</a>
							</h4>
						</li>
						 -->
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=3" class="menu2">배송완료</a>
							</h4>
						</li>
                    </div>
					</ul>
				</section>
				<!-- ------------------------------------------------------------------------ -->
				<section class="tabcontent">
					<div id="search">
                    	<form action="${pageContext.request.contextPath}/orderSearch" method="post">
                        	<select name="orderSearch" id="orderSearch">
                            	<option value="" selected>카테고리 선택</option>
                                <option value="userid">회원 ID</option>
                                <option value="orderNum">주문번호</option>
                            </select>
                            <input type="text" name="content" id="content" placeholder="검색어를 입력하세요">
                            <button id="submit">검색</button>
                       </form>
                    </div>
					<div class="adminorder">

						<c:if test="${nothing != null }">
							<p id="nothing">일치하는 검색 결과가 없습니다.</p>
						</c:if>

						<table>
                            <thead>
                                <tr>
                                    <th>주문일</th>
                                    <th>주문번호</th>
                                    <th>회원 ID</th>
                                    <th>결제금액</th>
                                    <th>배송상태</th>
                                    <th>결제상태</th>
                                </tr>
                            </thead>
							
							<tbody>

								<c:forEach var="vo" items="${orderList}" varStatus="vs">
	                                <tr>
	                                	<td>${vo.orderDate}</td>
	                                    <td>
	                                    	<a class="btn-open-popup" data-value="${vo.orderNum}">${vo.orderNum}</a>
	                                    	<input type="hidden" class="user-id" data-value="${vo.userid}"/>
	                                    </td>
	                                    <td>${vo.userid}</td>
	                                    <td>\ <fmt:formatNumber value="${vo.totalPrice}" pattern="#,###"></fmt:formatNumber></td>
	                                    <td>
	                                        <form action="${pageContext.request.contextPath}/adminorder/delivNumberInsert" method="post">
	                                            <input type="hidden" value="${vo.orderNum}" name="orderNum" id="orderNum">
	                                            <div class="delivNumber">
	                                            	<c:if test="${vo.delivstate == 1 and vo.payResult == 1}">
	                                                    상품준비중
	                                                    <button class="delivNumberAdd_btn" type="button">
	                                                        송장번호입력
	                                                    </button>
	                                                    <span class="delivnum_input"></span>
	                                                </c:if>
	                                                <c:if test="${vo.delivstate == 2}">
	                                                    배송중
	                                                    <div class="delivstate_inner">
		                                                    <p>송장번호 : </p>
		                                                    <input type="text" class="delivnum_output" name="delivnum" value="${vo.delivnum}"/>
		                                                    <a class="delivnum_modify_btn" data-order_num="${vo.orderNum}">변경</a>
		                                                    <a class="delivstate_modify_btn" data-order_num="${vo.orderNum}">배송완료</a>
	                                                    </div>
	                                                </c:if>
	                                                <c:if test="${vo.delivstate == 3}">
	                                                    배송완료
	                                                </c:if>
	                                                <c:if test="${vo.delivstate == 4}">
	                                                    반품완료
	                                                </c:if>
	                                            </div>  
	                                        </form>
	                                    </td>
	                                    <td class="td_form_button">
											<c:if test="${vo.payResult == 1}">
												정상주문
											</c:if>
											<c:if test="${vo.payResult == 2 and vo.delivstate == 1}">
												취소신청 <!-- 물품준비중일때만 취소신청 가능하게 -->
												<!-- 
												<form action="${pageContext.request.contextPath}/orderExchange" method="post">
													<input type="hidden" value="${vo.orderNum}" name="orderNum"/>
													<button class="paybtn" type="submit">
														교환처리
													</button>
												</form>
												 -->
												<form action="${pageContext.request.contextPath}/orderCancel" method="post">
													<input type="hidden" value="${vo.orderNum}" name="orderNum"/>
													<input type="hidden" value="${vo.userid}" name="userid"/>
													<button class="cancelbtn" id="cancelbtn" type="submit">
														환불처리
													</button>
												</form>
											</c:if>
											<c:if test="${vo.payResult == 3}">
												환불
											</c:if>
											<c:if test="${vo.payResult == 4}">
												교환
											</c:if>
										</td>
	                                </tr>
                                </c:forEach>
							</tbody>
                        </table>
                    </div>
				</section>
				
				<!-- 송장번호 변경 form -->
				<form action="${pageContext.request.contextPath}/adminorder/delivNumberUpdate" method="post" class="delivnum_update_form">
					<input type="hidden" name="orderNum" class="update_orderNum"/>
					<input type="hidden" name="delivnum" class="update_delivnum"/>
				</form>

				<!-- 배송완료 변경 form -->
				<form action="${pageContext.request.contextPath}/adminorder/delivStateUpdate" method="post" class="delivstate_update_form">
					<input type="hidden" name="orderNum" class="delivnum_update_orderNum"/>
				</form>

				<!-- 모달창 -->
				<div id="modal" class="modal">
					<div id="modal_body">
						<a class="modal_close_btn">✖</a>
						<div id="orderNum_modal"></div>
						<div id="orderInfo_left">
							<!-- 이거랑 일치하는 것들의 정보를 가져와-->
							<!-- <a href="#" id="modal_orderNum" data-order_num="${vo.orderNum}">${vo.orderNum}오더넘</a>  -->
						</div>
						
						<div id="orderInfo_right">
						
						</div>
					</div>
				</div>

			</div>
		</div>
	</main>
				
	<jsp:include page="../footer.jsp"></jsp:include>




	<script type="text/javascript">
	    $(document).ready(function() {
		    delivNumberAdd();
		    
	    });
	
	    // 송장번호입력 버튼을 누르면 실행
	    function delivNumberAdd() {
	        //var optionIndex = 1;
	        console.log($(".delivNumberAdd_btn").length);
			for (let i = 0; i < $(".delivNumberAdd_btn").length; i++) {
				 $(".delivNumberAdd_btn").eq(i).on("click",function() {
					 	$(".delivnum_input").eq(i).html('');
			            $(".delivnum_input").eq(i).append("<div class='form-group'><input type='text' placeholder='송장번호 입력(숫자만)' class='form-control delivnum_inputText' style='float:left;' name='delivnum' value='${orderList.get(i).delivnum}'>"
			                                    + "<button type='submit' class='btn btn-round btn-g' id='delivnum_input_btn'>" + "등록" + "</button></div>");
			            
			            // 송장번호 숫자만 입력되게
			            $('.delivnum_inputText').on("blur keyup", function(){
							$(this).val($(this).val().replace(/[^0-9]/g, '' ));			            	
			            });
				 });
			}
	    }
						 
		//모달 스크립트
		let modal = document.querySelector('.modal');
		let btnOpenPopups = document.querySelectorAll('.btn-open-popup');	//얘가 foreach로 도는 주문번호
		
		let userids = document.querySelectorAll('.user-id');
		
		let modalCloseBtn = document.querySelector('.modal_close_btn');
		
		/*
		for(let btnOpenPopup of btnOpenPopups){	//주문번호 for of로 돌림
			btnOpenPopup.addEventListener('click', () => {	// 하나를 클릭했을때
				modal.style.display = 'block';	// 모달창 
				
				//이렇게 쓰니까 버튼이 안눌령
				let orderNum = document.querySelector('.btn-open-popup').getAttribute('data-value');
				console.log(orderNum);
				}); 
		}
		*/
		
		
		for (let i = 0; i < btnOpenPopups.length; i++) {
			btnOpenPopups[i].addEventListener("click",function(){
				modal.style.display = 'block';
				
				let orderNum = btnOpenPopups[i].getAttribute('data-value');
				let userid  = userids[i].getAttribute('data-value');
				console.log(orderNum);
				console.log("userid : "+userid);
				
				
				// orderNum과 일치하는 쿼리문 가져오기
				const simple_data = {orderNum, userid};
				console.log(simple_data);
				
				$.ajax({
					url : "${pageContext.request.contextPath}/modal",
					type : "POST",
					data: JSON.stringify(simple_data),
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					success : function(data) {
						const orderInfo_left = document.getElementById("orderInfo_left");
						const orderInfo_right = document.getElementById("orderInfo_right");
						const right_inner = document.querySelector(".right_inner");
						const right_inners = document.querySelectorAll(".right_inner");
						const orderNum_modal = document.getElementById("orderNum_modal");
						
						// 초기화 
						orderInfo_left.innerText = '';
						orderInfo_right.innerText = '';
						right_inners.innerText = '';
						orderNum_modal.innerText = '';
						
						
						//console.log(JSON.stringify(data));
						const modalBody = document.getElementById("modal_body");

						/*
						for ( let name of data) {
							let p = document.createElement("p");
							let p1 = document.createElement("p");
							p.innerText = '';
							p1.innerText = name.color;
							orderInfo_left.append(p);
							orderInfo_left.append(p1);
						}
						*/
						
						for (let i = 0; i < 1; i++) {
							// 주문번호
							let h1 = document.createElement("h1");
							h1.innerText = '주문 번호 : ' + data[i].orderNum;
							orderNum_modal.append(h1);
							
							// 주문자
							let p1 = document.createElement("p");
							p1.innerText = data[i].orderName;
							
							let h4_1 = document.createElement("h4");
							h4_1.innerText = '주문자';
							h4_1.append(p1);
							
							const left_inner1 = document.createElement("div");
							left_inner1.append(h4_1);
							
							orderInfo_left.append(left_inner1);

							// 주문일자
							let p2 = document.createElement("p");
							p2.innerText = data[i].orderDate;
							
							let h4_2 = document.createElement("h4");
							h4_2.innerText = '주문일자';
							h4_2.append(p2);
							
							const left_inner2 = document.createElement("div");
							left_inner2.append(h4_2);
							
							orderInfo_left.append(left_inner2);
							
							// 연락처
							let p3 = document.createElement("p");
							//let dataTel = data[i].orderTel;
							//p3.innerText = dataTel.substr(0,3) + "-" + dataTel.substr(3,4)+"-"+dataTel.substr(7,4);
							p3.innerText = data[i].orderTel;
							
							let h4_3 = document.createElement("h4");
							h4_3.innerText = '연락처';
							h4_3.append(p3);
							
							const left_inner3 = document.createElement("div");
							left_inner3.append(h4_3);
							
							orderInfo_left.append(left_inner3);
							
							// 결제 수단
							let p4 = document.createElement("p");
							// p4.innerText = data[i].pay;
							console.log("결제 수단 : "+data[i].pay);
							if(data[i].pay == 'cash'){
								p4.innerText = '무통장 입금';
							}else if(data[i].pay == 'card'){
								p4.innerText = '카드';
							}
							
							let h4_4 = document.createElement("h4");
							h4_4.innerText = '결제 수단';
							h4_4.append(p4);
							
							const left_inner4 = document.createElement("div");
							left_inner4.append(h4_4);
							
							orderInfo_left.append(left_inner4);
							
							// 사용한 적립금
							let p5 = document.createElement("p");
							let usePoint = data[i].point.toLocaleString();
							p5.innerText = usePoint;
							
							let h4_5 = document.createElement("h4");
							h4_5.innerText = '사용한 적립금';
							h4_5.append(p5);
							
							const left_inner5 = document.createElement("div");
							left_inner5.append(h4_5);
							
							orderInfo_left.append(left_inner5);
							
							// 배송지
							let p6 = document.createElement("p");
							p6.innerText = data[i].address + ' ' + data[i].detailAddress + ' ' + data[i].extraAddress;
							
							let h4_6 = document.createElement("h4");
							h4_6.innerText = '배송지';
							h4_6.append(p6);
							
							const left_inner6 = document.createElement("div");
							left_inner6.append(h4_6);
							
							orderInfo_left.append(left_inner6);
							
						}
							
						for (let j = 0; j < data.length; j++) {
							//let right_img = document.querySelector(".right_img");
							//let right_inner_info = document.querySelector(".right_inner_info");
							
							//right_img.setAttribute("src",data[j].pic1);
							
							
							let right_inner = document.createElement("div");
							right_inner.setAttribute("class","right_inner");
							
							let imgDiv = document.createElement("div");
							
							let pic1 = document.createElement("img");
							pic1.setAttribute("id","modal_pic1");
							pic1.setAttribute("src",data[j].pic1);
							imgDiv.append(pic1);
							right_inner.append(imgDiv);
							orderInfo_right.append(right_inner);
							
							// 상품명 컬러 가격 수량 상품번호도 가져오고 싶은데?
							let right_inner_info = document.createElement("div");
							right_inner_info.setAttribute("class","right_inner_info");
							
							let item_name = document.createElement("h4");
							item_name.innerText = '상품명 : ' + data[j].itemName;

							let item_size = document.createElement("h4");
							item_size.innerText = '(사이즈 : ' + data[j].size + ' , 컬러 : ' + data[j].color + ')';
							
							let item_proNum = document.createElement("h4");
							item_proNum.innerText = '상품코드 : ' + data[j].proNum;
							item_proNum.setAttribute("class","modalProNum");
							
							let item_price = document.createElement("h4");
							let price = data[j].itemPrice.toLocaleString();
							console.log(price);
							item_price.innerText = '상품가격 : ' + price;
							//item_price.innerHTML = `<div?<fmt:formatNumber value="${vo.totalPrice}" pattern="#,###"></fmt:formatNumber></div>`;
							
							let item_count = document.createElement("h4");
							item_count.innerText = '구매 수량 : ' + data[j].count;
							
					
							right_inner_info.append(item_name);
							right_inner_info.append(item_size);
							right_inner_info.append(item_proNum);
							right_inner_info.append(item_price);
							right_inner_info.append(item_count);
							
							
							right_inner.append(right_inner_info);
							
							
						}
					},
					error : function(e) {
						console.log(e);
					}
				});
			});
		}
		
		
		
        modalCloseBtn.addEventListener('click', e => {
        	//modal.clssList.remove('show-modal');
	        modal.style.display = 'none';
	        //document.querySelector('body').style.overflow = 'auto';
        });
        
        modal.addEventListener('click', e => {
        	const evTarget = e.target
        	if(evTarget.classList.contains("modal")){
        		modal.style.display = "none"
        	}
        });

	    
	    /*
	
		
		for(let btnOpenPopup of btnOpenPopups){
			btnOpenPopup.addEventListener('click', () => {
				modal.style.display = 'block';
			});
		}
		
        modalCloseBtn.addEventListener('click', () => {
            modal.style.display = 'none';
        });
		*/
		// 모달 on
		//body.style.overflow = 'hidden';
		// 모달 off
		//body.style.overflow = 'auto';
		
		// 송장번호 수정 버튼
		$(".delivnum_modify_btn").on("click",function(){
			let orderNum = $(this).data("order_num");
			let delivnum = $(this).parent(".delivstate_inner").find(".delivnum_output").val();
			let result = confirm("송장번호를 변경 하시겠습니까");
			
			if(result == true){
				$('.update_orderNum').val(orderNum);
				$('.update_delivnum').val(delivnum);
				$('.delivnum_update_form').submit();
			}else {
				alert("취소를 눌렀습니다.");
			}
			
		});
		
		// delivstate 배송완료로 수정
		$(".delivstate_modify_btn").on("click",function(){
			let orderNum = $(this).data("order_num");
			let result = confirm("배송완료 처리 하시겠습니까");
			
			if(result == true){
				$('.delivnum_update_orderNum').val(orderNum);
				$('.delivstate_update_form').submit();
			}else {
				alert("취소를 눌렀습니다.");
			}
		});
		
		// 송장번호창 정규식(숫자만 입력)
		$('.delivnum_output').on("blur keyup", function(){
			$(this).val($(this).val().replace(/[^0-9]/g, ''));			            	
        });
	</script>
</body>

</html>