<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        ul,
        li {
            list-style-type: none;
        }

        body {
            background: url("${pageContext.request.contextPath}/image/KakaoTalk_20221013_170149504.webp") center;
            background-size: cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 0;
        }

        .background {
            width: 100vw;
            height: 100vh;
            background: rgba(255, 255, 255, 0.4);
            position: absolute;
            z-index: -1;
        }

        .signup-container {
            display: flex;
            justify-content: center;
        }

        /* 로고 */
        .logo {
            flex: 0.5;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        .logo img {
            width: 265px;
        }

        /* 회원가입박스 */
        .signup-box {
            background: #FFFFFF;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .signup-box form {
            background-color: white;
            display: flex;
            flex-direction: column;
            gap: 30px;
            position: relative;
        }

        .signup-box form h3 {
            font-size: 21px;
        }

        /* 닫기 버튼 */
        form span {
            font-size: 15px;
            position: absolute;
            left: 98%;
   			top: -2%;
            cursor: pointer;
        }

         /* input */
        .signup-box form .signupinput {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .signup-box form input[type="text"],
        .signup-box form input[type="password"],
        .signup-box form input[type="tel"],
        .signup-box form input[type="email"] {
            width: 335px;
            height: 52px;
            background: #FFFFFF;
            border: 0.5px solid #CFCFCF;
            border-radius: 15px;
            padding: 10px;
        }

        .idli {
            display: flex;
            gap: 10px;
        }

        #userid {
            width: auto;
            flex: 1;
        }

        /* 아이디 중복 */
        .idcheck {
            background: rgba(162, 212, 214, 0.44);
            padding: 10px;
            border: 0.5px solid #CFCFCF;
            border-radius: 15px;
            flex: 1;
            cursor: pointer;
        }

        /* 약관 동의 */

        #agree {
            display: none;
        }

        .saveck {
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

        .saveck::before {
            content: "";
            width: 18px;
            height: 18px;
            border: 1px solid #bdbbbb;
            border-radius: 50%;
            box-sizing: border-box;
        }

        .saveck::after {
            box-sizing: border-box;
            content: "";
            position: absolute;
            left: 4px;
            width: 10px;
            height: 10px;
            background: #21A5B5;
            border-radius: 50%;
            display: none;
        }

        /* 아이디 중복 */
        .idcheck {
            background: rgba(162, 212, 214, 0.44);
            padding: 10px;
            border: 0.5px solid #CFCFCF;
            border-radius: 15px;
            flex: 1;
            cursor: pointer;
        }

        /* 회원가입 버튼 */
        .btn {
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            border: 0;
            color: white;
            border-radius: 15px;
            width: 335px;
            height: 52px;
            cursor: pointer;

            /* 폰트 */
            font-family: 'SeoulHangang';
            font-style: normal;
            font-weight: 400;
            font-size: 18px;
            line-height: 100%;
        }
    </style>
</head>
    <script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();
		}
	</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
    <div class="background">

    </div>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png" alt="">
    </div>
    <div class="signup-container">
        <div class="signup-box">
            <form action="${pageContext.request.contextPath}/adduser" method="post" id="signup-form">
                <span id="backspan">╳</span>
                <h3>회원가입</h3>
                <ul class="signupinput">
                    <li>
                        <input type="text" name="username" id="username" placeholder="이름" required="required" pattern="^[가-힣a-zA-Z]+$">
                        <p>한글, 영문만 입력 가능합니다.</p>
                    </li>
                    <li class="idli">
                        <input type="text" name="userid" id="userid" placeholder="아이디" readonly required="required" pattern="^[a-zA-Z0-9]+$">
                        <button type="button" class="idcheck" id="idcheck">아이디 중복 확인</button>
                    </li>
                    <li>
                        <input type="password" name="password" id="password" placeholder="패스워드" required="required">
                        <p>영문,숫자,기호만 입력 가능합니다.</p>
                        <p>기호: ~!@#$%^&*_-+=`|\(){}[]:;<>,.?/</p>
                    </li>
                    <li>
                        <input type="password" name="pwcheck" id="pwcheck" placeholder="패스워드 확인" required="required">
                    </li>
                    <li>
                        <input type="tel" name="tel" id="tel" placeholder="휴대폰 번호" required="required" pattern="[0-9]{11}">
                        <p>숫자만 입력해 주세요.</p>
                    </li>
                    <li><input type="text" name="address" id="address" placeholder="주소"/>
                    	<p>필수 항목이 아닙니다.</p>
                    </li>
                    <li>
                        <input type="email" name="email" id="email" placeholder="이메일" required="required">
                    </li>
                    <li>
                        <input type="checkbox" name="agree" id="agree" onclick="return false;"><label for="agree" class="saveck">회원가입약관에 동의합니다</label>
                    </li>
                </ul>
                <button id="btn" class="btn">회원가입</button>
            </form>
        </div>
    </div>
	
	
    <script>
    
    
//		닫기버튼
		document.getElementById("backspan").addEventListener("click",function(){
        	history.back();
        });
    
    
//		회원가입약관    
        const agree = document.getElementById("agree");
        let ischeck = document.querySelectorAll(".saveck");
        
        agree.addEventListener("click",function(){
        	var url = "${pageContext.request.contextPath}/terms";
            var name = "term";
            var option = "width = 801, height = 601, left = 280, top = 150";
            window.open(url,name,option);
        });
  
//		아이디 중복
        document.getElementById("idcheck").addEventListener("click",function(){
        	popup();
        });
        document.getElementById("userid").addEventListener("click",function(){
        	popup();
        });
        
        function popup() {
            var url = "${pageContext.request.contextPath}/idcheck";
            var name = "idcheck";
            var option = "width = 401, height = 301, left = 280, top = 250";
            window.open(url,name,option);
        }

		// 유효성 검사
		
		document.getElementById("btn").addEventListener("click",function(e){
			const username = document.getElementById("username");
			const userid = document.getElementById("userid");
			const password = document.getElementById("password");
			const pwcheck = document.getElementById("pwcheck");
			const tel = document.getElementById("tel");
			const address = document.getElementById("address");
			const email = document.getElementById("email");
			const agree = document.getElementById("agree");
			let flag = true;
			
			e.preventDefault();
			
			// 이름
			if(username.value == "") {
				alert("이름을 입력하세요.");
				username.focus();
				flag = false;
				return false;
			}
			var nameExp = /^[가-힣|a-z|A-Z]+$/;
			if(!nameExp.test(username.value)) {
				alert("이름은 한글, 영문만 가능합니다.");
				username.focus();
				flag = false;
				return false;
			}
			// 아이디
			if(userid.value == "") {
				alert("아이디를 입력하세요.");
				userid.focus();
				flag = false;
				return false;
			}
			var idExp = /^[a-z|A-Z|0-9]+$/;
			if(!idExp.test(userid.value)) {
				alert("ID는 영문, 숫자로만 입력해 주세요.");
				userid.focus();
				flag = false;
				return false;
			}
			
			// 비밀번호
			if(password.value == "") {
				alert("패스워드를 입력하세요.");
				password.focus();
				flag = false;
				return false;
			}
			var pwExp= /^[a-z|A-Z|0-9|~!@\#$%^&*_\-+\=`|\\\(\)\{\}\[\]:;<>,.?\/]+$/;
			if(!pwExp.test(password.value)) {
				alert("패스워드는 영문,숫자,기호만 가능합니다.")
				password.focus();
				flag = false;
				return false;
			}
			
			// 비밀번호 체크
			if(pwcheck.value == "" || pwcheck.value != password.value) {
				alert("패스워드가 일치하지 않습니다.");
				pwcheck.focus();
				flag = false;
				return false;
			}
			// 전화번호
			if(tel.value == "") {
				alert("전화번호를 입력하세요.");
				tel.focus();
				flag = false;
				return false;
			}
			var telExp = /^[0-9]{11}$/;
			if(!telExp.test(tel.value)) {
				alert("휴대폰 번호가 올바르지 않습니다. 11자리 숫자로만 입력해 주세요.");
				tel.focus();
				flag = false;
				return false;
			}
			
			
			// 이메일
			if(email.value == "") {
				alert("이메일을 입력하세요.");
				email.focus();
				flag = false;
				return false;
			}
			var mailExp=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!mailExp.test(email.value)) {
				alert("올바른 이메일 형식이 아닙니다.");
				email.focus();
				flag = false;
				return false;
			}
			// 약관 동의
			if(agree.checked == false) {
				alert("약관에 동의해 주세요.");
				flag = false;
				return false;
			}

			if(flag == true) {
				const form = document.getElementById("signup-form");
				form.submit();				
			}
		});
		
		
		
		
    </script>
    
</body>

</html>