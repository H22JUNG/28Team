<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
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
	max-height: 860px;
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
}

.side-menu li {
	padding: 0 15px 0 15px;
}

.side-menu a {
	text-decoration: none;
	color: #000;
}

/* 여기서부터 윤정이거! */

.side-menu li h4 a {
    /* border: 1px solid #21A5B5; */
    padding: 10px 24px;
    border-radius: 10px;
    background-color: #d3fbff;
    color: #21A5B5;
    font-weight: bold;
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
}

table, th, td{
    border-top: 1px solid rgb(206, 206, 206);
    border-bottom: 1px solid rgb(206, 206, 206);
    border-collapse: collapse;
    padding: 10px 30px;
    text-align: center;
}

.form-group {
	margin-top: 5px;
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
								<a href="${pageContext.request.contextPath}/admin_product_list" class="menu1">✔ 상품관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="" class="menu1">✔ 주문관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="" class="menu1">✔ 이벤트관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="" class="menu1">✔ 관리자 정보수정</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="" class="menu1">✔ 로그아웃</a>
							</h4>
						</li>
					</div>
				</ul>
			</aside>
			<div class="content-box">
				<section>
					<ul class="side-menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpage/1?searchUser=&userInfo=" class="menu2" id="adminUser">물품준비중<span>(${orderState1})</span></a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpagemodi/1?searchUser=&userInfo=" class="menu2">배송중<span>(${orderState2})</span></a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpagedel/1?searchUser=&userInfo=" class="menu2">취소신청<span>(${orderState3})</span></a>
							</h4>
						</li>
                        <div class="side-menu_inner">
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpagedel/1?searchUser=&userInfo=" class="menu2">환불처리</a>
							</h4>
						</li>
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpagedel/1?searchUser=&userInfo=" class="menu2">교환처리</a>
							</h4>
						</li>
                        <li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpagedel/1?searchUser=&userInfo=" class="menu2">배송완료</a>
							</h4>
						</li>
                    </div>
					</ul>
				</section>
				<!-- ------------------------------------------------------------------------ -->
				<section class="tabcontent">
					<div class="adminorder">
                        <table>
                            <thead>
                                <tr>
                                    <th>주문일</th>
                                    <th>주문번호</th>
                                    <th>주문자</th>
                                    <th>결제금액</th>
                                    <th>배송</th>
                                    <th>결제상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="vo" items="${orderList}">
	                                <tr>
	                                	<td>${vo.orderDate}</td>
	                                    <td>${vo.orderNum}</td>
	                                    <td>${vo.userid}</td>
	                                    <td><fmt:formatNumber value="${vo.totalPrice}" pattern="#,###"></fmt:formatNumber> 원</td>
	                                    <td>
	                                        <form action="${pageContext.request.contextPath}/adminorder/delivNumberInsert" method="post">
	                                            <input type="hidden" value="${vo.orderNum}" name="orderNum" id="orderNum">
	                                            <div class="delivNumber">
	                                            	<c:if test="${vo.delivstate == 1 and vo.payResult eq '완료'}">
	                                                    물품준비중 
	                                                    <button class="delivNumberAdd_btn" type="button">
	                                                        송장번호입력
	                                                    </button>
	                                                    <span class="delivnum_input"></span>
	                                                </c:if>
	                                                <c:if test="${vo.delivstate == 2}">
	                                                    배송중
	                                                </c:if>
	                                                <c:if test="${vo.delivstate == 3}">
	                                                    배송완료
	                                                </c:if>
	                                            </div>  
	                                        </form>
	                                    </td>
	                                    <td>${vo.payResult}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
				</section>
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
			            $(".delivnum_input").eq(i).append("<div class='form-group'><input type='text' placeholder='송장번호와 택배사' class='form-control' style='float:left;' name='delivnum' value='${orderList.get(i).delivnum}'>"
			                                    + "<button type='submit' class='btn btn-round btn-g'>" + "입력" + "</button></div>");
				    	});

			}
	    }
						 	
			
			
	</script>
</body>

</html>