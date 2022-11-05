<%@page import="com.goodee.vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #fff7e7;
}

#popup {
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 100%;
	margin: auto;
	border-collapse: collapse;
	border-radius: 50px;
}

#popup caption {
	font-size: 24px;
	font-weight: 600;
	padding: 20px 0;
	color: black;
}

#popup input {
	height: 30px;
}

#popup th {
	color: #21a5b5;
	padding: 10px;
	border-bottom: 1px solid #616161;
}

#popup td {
	border-bottom: 1px solid #616161;
	padding: 15px;
	text-align: center;
}

tr:nth-child(6) td, tr:nth-child(6) th, tr:nth-child(7) td, tr:nth-child(7) th
	{
	border: none !important;
}

#modi {
	width: 100px;
	height: 40px;
	font-size: 16px;
	font-weight: 500;
	background: linear-gradient(90deg, #21a5b5 0%, #71b2b4 100%);
	border-radius: 15px;
	border: none;
	cursor: pointer;
	color: white;
}
</style>
</head>
<body>
 <form action="/" method="post">
      <div id="popupdiv">
        <table id="popup">
          <caption>
            회원정보수정
          </caption>
          <tr>
            <th>아이디</th>
            <td id="id">${list[0].userid}</td>
          </tr>
          <tr>
            <th>회원명</th>
            <td><input type="text" id="name" name="username" value="${list[0].username}" required/></td>
          </tr>
          <tr>
            <th>회원연락처</th>
            <td><input type="tel" id="tel" name="tel" value="${list[0].tel}" required/></td>
          </tr>
          <tr>
            <th>회원주소</th>
            <td><input type="text" id="address" name="address" value="${list[0].address }" required/></td>
          </tr>
          <tr>
            <th>회원이메일</th>
            <td><input type="email" id="email" name="email" value="${list[0].email}" required/></td>
          </tr>
          <tr>
            <th>적립금</th>
            <td><input type="number" id="point" name="point" value="${list[0].point }" required/></td>
          </tr>
          <tr>
            <td></td>
            <td><button type="button" id="modi" type="submit">수정하기</button></td>
          </tr>
        </table>
      </div>
    </form>
    
    <script>
        document.getElementById("modi").addEventListener("click", function(e) {
        	e.preventDefault();
        	
        	const name_reg = /^[가-힣a-zA-Z]+$/;	//한글, 영문
        	const tel_reg = /^\d{3}-\d{4}-\d{4}$/; 	//000-0000-0000
        	const email_reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;	//id@site.com
        	const point_reg = /^[0-9]$/;	//숫자
        	
        	var name = document.getElementById('name').value;
        	var tel = document.getElementById('tel').value;
			var address = document.getElementById('address').value;
			var email = document.getElementById('email').value;
			var point = document.getElementById('point').value;
        	
			if(!name_reg.test(name)) {
				alert("이름을 형식에 맞게 입력하세요(한글, 영문)");
				document.getElementById('name').focus();
				return false;
			}
			if(!tel_reg.test(tel)) {
				alert("전화번호를 형식에 맞게 입력하세요('-'를 포함한 숫자 11자리)");
				document.getElementById('tel').focus();
				return false;
			}
			if(address == null || address=="") {
				alert("회원의 주소를 입력해주세요");
				document.getElementById('address').focus();
				return false;
			}
			if(!email_reg.test(email)) {
				alert("이메일 주소를 형식에 맞게 입력하세요");
				document.getElementById('email').focus();
				return false;
			}
			if(!point_reg.test(point)) {
				alert("적립금을 형식에 맞게 입력하세요(0이상의 숫자)");
				document.getElementById('point').focus();
				return false;
			}
			
			
        	let simple_data = { "id":"${list[0].id}",
        						"username":name,
        						"tel":tel,
        						"address":address,
        						"email":email,
        						"point":point};
    		
    		fetch("${pageContext.request.contextPath}/adminUserModify",{
       		 	method : "PATCH",
    			headers : {"Content-Type" : "application/json"},
    			body : JSON.stringify(simple_data)
    		}).then(response => response.json())
    		.then(data => {
    			opener.document.querySelector(`#modiusername${list[0].id}`).innerText = data.username;
    			opener.document.querySelector(`#moditel${list[0].id}`).innerText = data.tel;
    			opener.document.querySelector(`#modiaddress${list[0].id}`).innerText = data.address;
    			opener.document.querySelector(`#modiemail${list[0].id}`).innerText = data.email;
    			opener.document.querySelector(`#modipoint${list[0].id}`).innerText = data.point;
    		}).then(() => {
    			window.close();	
    		});
    		
        });
    </script>
</body>
</html>