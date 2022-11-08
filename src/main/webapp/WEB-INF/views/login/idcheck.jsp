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
	flex-direction: column;
	align-items: center;
	justify-content: space-between;
	padding-top: 30px;
	height: 250px;
}

#id-div {
	text-align: center;
	line-height: 200%;
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
</style>
</head>
<body>
	<div class="top">
		<h3>아이디 중복 확인</h3>
	</div>
	<div class="check-div">
		<div id="id-div">
			<p>아이디는 영문,숫자만 가능합니다.</p>
			<input type="text" name="userid" id="userid" />
			<button id="submit">확인</button>
			<div id="warning-div">
			
			</div>
		</div>
		<div class="bottom">
		<div class="bottom">
		<button id="close">닫기</button>
	</div>
		</div>
	</div>
	
	<script type="text/javascript">
		document.getElementById("submit").addEventListener("click",function(e){
			e.preventDefault();
			let userid = document.getElementById("userid").value;
			var idExp = /^[a-z|A-Z|0-9]+$/;
		    const simple_data = {userid};
		    
		    fetch("${pageContext.request.contextPath}/checkid", {
				method : "POST",
				headers : {"Content-TYPE" : "application/json"},
				body : JSON.stringify(simple_data)
			}).then(response => response.json()).then(data => {
				
				if(data.state == "fail" && userid != "") {
					document.getElementById("warning-div").innerHTML="";
					let warning = document.createElement("p");
					warning.innerText = "이미 존재하는 아이디입니다.";
					document.getElementById("warning-div").append(warning);
				}else if(data.state == "success" && userid != "" && !idExp.test(userid)) {
					document.getElementById("warning-div").innerHTML="";
					let warning = document.createElement("p");
					warning.innerText = "불가능한 문자가 포함되어 있습니다.";
					document.getElementById("warning-div").append(warning);
				}else if(data.state == "success" && userid != ""){
					opener.document.getElementById("userid").value = userid;
					window.close();
				}else {
					document.getElementById("warning-div").innerHTML="";
					let warning = document.createElement("p");
					warning.innerText = "아이디를 입력해 주세요.";
					document.getElementById("warning-div").append(warning);
				}
			});
		});
		        
		document.getElementById("close").addEventListener("click",function(){
			window.close();
		});
	
	</script>
</body>
</html>