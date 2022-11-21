<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
body {
	    display: flex;
    flex-direction: column;
    height: 100vh;
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
	    min-height: 230px;
    flex: 1;
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
.byphone-box,
.byemail-box {
    height: 100%;
    padding: 30px 0;
    justify-content: center;
}
.byphone-box form,
.byemail-box form{
    display: flex;
    flex-direction: column;
    gap: 20px;
        align-items: center;
}
}
.byphone-box div,
.byemail-box div {
	display: flex;
	gap: 10px;
	justify-content: center;
}
.byphone-box input {
	width: 150px;
}
.byemail-box input[name="username"] {
	width: 150px;
}
</style>
</head>
<body>
	<div class="top">
		<h3>아이디 찾기</h3>
	</div>
	<div class="check-div">
		<div class="certify-div divlist">
			<input type="radio" name="findid" id="certify" checked="checked"
				onchange="changeTab()" /> <label for="certify">본인 확인 후 찾기</label>
		</div>
		<div class="phone-div divlist">
			<input type="radio" name="findid" id="byphone" onchange="changeTab()" />
			<label for="byphone">등록된 휴대폰 번호로 찾기</label>
		</div>
		<div class="email-div divlist">
			<input type="radio" name="findid" id="byemail" onchange="changeTab()" />
			<label for="byemail">이메일로 찾기</label>
		</div>
	</div>
	<div id="find-div" class="find-div">
		<div class="certify-box">
			<button id="certify-btn">본인명의 휴대폰으로 인증</button>
			<p>회원님의 명의로 등록된</p>
			<p>휴대폰으로 본인확인을 진행합니다.</p>
		</div>
		<div class="byphone-box">
			<form action="${pageContext.request.contextPath}/byPhone" method="post">
			<div>
			<label for="username">이름 : </label><input type="text" name="username" id="username" />
			<label for="tel">휴대폰 번호 : </label><input type="tel" name="tel" id="tel" />
			</div>
			<div>
			<button>확인</button>
			</div>
			</form>
		</div>
		<div class="byemail-box">
			<form action="${pageContext.request.contextPath}/byEmail" method="post">
			<div>
			<label for="username">이름 : </label><input type="text" name="username" id="username" />
			<label for="email">이메일 : </label><input type="email" name="email" id="email" />
			</div>	
			<div>
			<button>확인</button>
			</div>
			</form>
		</div>
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
		
		// 휴대폰 본인 인증
		document.getElementById("certify-btn").addEventListener("click",function(){
		var dt = new Date();
  		var IMP = window.IMP; // 생략 가능
  		IMP.init("imp28442011"); // 예: imp00000000
  	 	 // IMP.certification(param, callback) 호출
  	  	IMP.certification({ // param
  	   	 	merchant_uid: "ORD"+dt.getFullYear()+("0" + (dt.getMonth() + 1)).slice(-2)+("0" + dt.getDate()).slice(-2)+"-"+dt.getTime(), // 주문 번호
  	    	m_redirect_url : "${pageContext.request.contextPath}/findID", // 모바일환경에서 popup:false(기본값) 인 경우 필수, 예: https://www.myservice.com/payments/complete/mobile
  	    	popup : false // PC환경에서는 popup 파라메터가 무시되고 항상 true 로 적용됨
  	  	}, function (rsp) { // callback
  	   		 if (rsp.success) {		// 인증 성공 시
  	   		 // jQuery로 HTTP 요청
//   	   	      jQuery.ajax({
//   	   	        url: "${pageContext.request.contextPath}/findID", // 예: https://www.myservice.com/certifications
//   	   	        method: "POST",
//   	   	        headers: { "Content-Type": "application/json" },
//   	   	        data: { imp_uid: rsp.imp_uid }
//   	   	      });
  	   		var msg = '주문해주셔서 감사합니다';
          	alert(msg); 
	   	    } else {
  	      // 인증 실패 시 로직,
	   	   alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
  	    }
  	  });
		});
		
		// 등록 휴대폰으로 찾기
		
		// 이메일로 찾기
	</script>
</body>
</html>