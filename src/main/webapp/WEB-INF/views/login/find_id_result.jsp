<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}


.top {
	width: 100%;
	height: 50px;
	background-color: rgb(77, 95, 117);
	display: flex;
	align-items: center;
	padding: 10px;
}

.top h3 {
	color: white;
}

.check-div {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 50px;
}

.divlist {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	border-right: 1px solid rgb(77, 95, 117);
	border-bottom: 1px solid rgb(77, 95, 117);
	border-radius: 5px 5px 0 0;
	background-color: #e6f2ff;
}
.divlist:first-child {
	border-bottom: 0;
	background-color: white;
}
.divlist:last-child {
	border-right : 0;
}

.divlist input[type="radio"] {
	display: none;
}

.check-div .divlist label {
	text-align: center;
	cursor: pointer;
	padding: 10px;
	word-break: keep-all;
}

.check-div .divlist label:hover {
	text-decoration: underline;
}

.find-div {
	height: 230px;
}

.bottom {
	width: 100%;
	height: 70px;
	background-color: rgb(77, 95, 117);
	display: flex;
	align-items: center;
	justify-content: flex-end;
	padding-right: 10px;
}

#close {
	padding: 5px 10px;
	background: linear-gradient(11deg, #203046 1%, transparent 91%);
	border: 1px solid white;
	border-radius: 3px;
	color: white;
	cursor: pointer;
}

.certify-box {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.certify-box #certify-btn {
	background: #5e7b9f;
    border: 0;
	color: white;
	cursor: pointer;
	padding: 20px 30px;
    font-size: 18px;
    border-radius: 10px;
}
.byphone-box, .byemail-box {
	display: none;
}
.byphone-box {
	flex-direction: column
    gap: 10px;
    padding: 30px 0;
    justify-content: center;
}
.byphone-box div {
	display: flex;
	gap: 10px;
	justify-content: center;
}
.byphone-box input {
	width: 150px;
}
</style>
</head>
<body>
	<div class="top">
		<h3>아이디 찾기</h3>
	</div>
	<div class="check-div">
	<c:choose>
		<c:when test="${userid} != null">	
		${UserVO.username} 님의 아이디는 
		<c:forEach items="${userid}" var="id">
			${id.userid}<br>
		</c:forEach>
		입니다.
		</c:when>
		<c:otherwise>
			회원 정보가 없습니다.			
		</c:otherwise>
	</c:choose>
	</div>
	<div class="bottom">
		<button id="close">닫기</button>
	</div>
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	  <!-- iamport.payment.js -->
 	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript">
		// checked 확인		
		function changeTab() {
		const radio = document.getElementsByName("findid");
		for (var i = 0; i < radio.length; i++) {
			if(radio[i].checked) {
				radio[i].parentNode.style.borderBottom = "0";
				radio[i].parentNode.style.backgroundColor = "white";
				document.getElementById("find-div").children[i].style.display="flex";
				
			} else {
				radio[i].parentNode.style.borderBottom = "1px solid rgb(77, 95, 117)";
				radio[i].parentNode.style.backgroundColor = "#e6f2ff";
				document.getElementById("find-div").children[i].style.display="none";
			}
			}			
		}
		
		// 닫기 버튼
		document.getElementById("close").addEventListener("click",function(){
			window.close();
		});
		
		
	</script>
</body>
</html>