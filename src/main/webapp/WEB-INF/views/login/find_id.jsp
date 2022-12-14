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
		<h3>????????? ??????</h3>
	</div>
	<div class="check-div">
		<div class="certify-div divlist">
			<input type="radio" name="findid" id="certify" checked="checked"
				onchange="changeTab()" /> <label for="certify">?????? ?????? ??? ??????</label>
		</div>
		<div class="phone-div divlist">
			<input type="radio" name="findid" id="byphone" onchange="changeTab()" />
			<label for="byphone">????????? ????????? ????????? ??????</label>
		</div>
		<div class="email-div divlist">
			<input type="radio" name="findid" id="byemail" onchange="changeTab()" />
			<label for="byemail">???????????? ??????</label>
		</div>
	</div>
	<div id="find-div" class="find-div">
		<div class="certify-box">
			<button id="certify-btn">???????????? ??????????????? ??????</button>
			<p>???????????? ????????? ?????????</p>
			<p>??????????????? ??????????????? ???????????????.</p>
		</div>
		<div class="byphone-box">
			<form action="${pageContext.request.contextPath}/byPhone" method="post">
			<div>
			<label for="username">?????? : </label><input type="text" name="username" id="username" />
			<label for="tel">????????? ?????? : </label><input type="tel" name="tel" id="tel" />
			</div>
			<div>
			<button>??????</button>
			</div>
			</form>
		</div>
		<div class="byemail-box">
			<form action="${pageContext.request.contextPath}/byEmail" method="post">
			<div>
			<label for="username">?????? : </label><input type="text" name="username" id="username" />
			<label for="email">????????? : </label><input type="email" name="email" id="email" />
			</div>	
			<div>
			<button>??????</button>
			</div>
			</form>
		</div>
	</div>
	<div class="bottom">
		<button id="close">??????</button>
	</div>
	<!-- jQuery -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	  <!-- iamport.payment.js -->
 	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script type="text/javascript">
		// checked ??????		
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
		
		// ?????? ??????
		document.getElementById("close").addEventListener("click",function(){
			window.close();
		});
		
		// ????????? ?????? ??????
		document.getElementById("certify-btn").addEventListener("click",function(){
		var dt = new Date();
  		var IMP = window.IMP; // ?????? ??????
  		IMP.init("imp28442011"); // ???: imp00000000
  	 	 // IMP.certification(param, callback) ??????
  	  	IMP.certification({ // param
  	   	 	merchant_uid: "ORD"+dt.getFullYear()+("0" + (dt.getMonth() + 1)).slice(-2)+("0" + dt.getDate()).slice(-2)+"-"+dt.getTime(), // ?????? ??????
  	    	m_redirect_url : "${pageContext.request.contextPath}/findID", // ????????????????????? popup:false(?????????) ??? ?????? ??????, ???: https://www.myservice.com/payments/complete/mobile
  	    	popup : false // PC??????????????? popup ??????????????? ???????????? ?????? true ??? ?????????
  	  	}, function (rsp) { // callback
  	   		 if (rsp.success) {		// ?????? ?????? ???
  	   		 // jQuery??? HTTP ??????
//   	   	      jQuery.ajax({
//   	   	        url: "${pageContext.request.contextPath}/findID", // ???: https://www.myservice.com/certifications
//   	   	        method: "POST",
//   	   	        headers: { "Content-Type": "application/json" },
//   	   	        data: { imp_uid: rsp.imp_uid }
//   	   	      });
  	   		var msg = '?????????????????? ???????????????';
          	alert(msg); 
	   	    } else {
  	      // ?????? ?????? ??? ??????,
	   	   alert("????????? ?????????????????????. ?????? ??????: " +  rsp.error_msg);
  	    }
  	  });
		});
		
		// ?????? ??????????????? ??????
		
		// ???????????? ??????
	</script>
</body>
</html>