<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        .login-container {
            display: flex;
            flex: 3;
        }

        /* 로고 */
        .logo {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        .logo img {
            width: 265px;
        }

        /* 로그인박스 */
        .login-box {
            background: #FFFFFF;
            mix-blend-mode: normal;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
            width: 435px;
            height: 440px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .login-box form {
            background-color: white;
            display: flex;
            flex-direction: column;
            gap: 30px;
            position: relative;
        }

        .login-box form h3 {
            font-size: 21px;
        }

        /* 닫기 버튼 */
        form span {
            font-size: 15px;
            position: absolute;
            left: 100%;
            top: -7%;
            cursor: pointer;
        }

        /* input */
        .login-box form .logininput {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .login-box form input[type="text"],
        .login-box form input[type="password"] {
            width: 335px;
            height: 52px;
            background: #FFFFFF;
            border: 0.5px solid #CFCFCF;
            border-radius: 15px;
            padding: 10px;
        }

        /* 비밀번호 눈모양 */
 

      /* 아이디 저장 */
        #saveid {
            display: none;
        }

        .saveck {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

		.saveck:hover {
			text-decoration: underline;
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
        

        /* 아이디/비밀번호 찾기, 회원가입 */
        .login-menu {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            gap: 10px;
            height: 20px;
        }
        .login-menu li {
            height: 100%;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }
        
        .login-menu li:not(:first-child):before {
            content: "";
            display: inline-block;
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            width: 1px;
            height: 15px;
        }
        
        .login-menu li {
            font-weight: 400;
            font-size: 16px;
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
            cursor: pointer;
        }
        .login-menu li:hover {
        	color: black;
        }


        /* 로그인 버튼 */
        button {
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            border: 0;
            color: white;
            border-radius: 15px;
            width: 335px;
            height: 52px;
            cursor: pointer;

            /* 로그인 폰트 */
            font-family: 'SeoulHangang';
            font-style: normal;
            font-weight: 400;
            font-size: 18px;
            line-height: 100%;
        }
    </style>
</head>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<body>
    <div class="background">

    </div>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png" alt="">
    </div>
    <div class="login-container">
        <div class="login-box">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <span id="backspan">╳</span>
                <h3>로그인</h3>
                <ul class="logininput">
                    <li>
                        <input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요" value="${cookie.loginCookie.value}">
                    </li>
                    <li>
                        <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요">
                        <i class="fa fa-eye fa-lg"></i>
                    </li>
                    <li>
                        <input type="checkbox" name="saveid" id="saveid"><label for="saveid" class="saveck">아이디 저장</label>
                    </li>
                </ul>
                <ul class="login-menu">
                    <li id="find-id">아이디 찾기</li>
                    <li id="find-pw">비밀번호 찾기</li>
                    <li id="sign-up">회원가입</li>
                </ul>
                <button>로그인</button>
            </form>
        </div>
    </div>

    <script>
    	// 아이디 저장 style
        const saveid = document.getElementById("saveid");
        let ischeck = document.querySelectorAll(".saveck");
        saveid.addEventListener("click",function(){
            if(saveid.checked) {
                var style = document.head.appendChild(document.createElement("style"));
                style.innerHTML = ".saveck:after {display: block;}";
            }else {
                var style = document.head.appendChild(document.createElement("style"));
                style.innerHTML = ".saveck:after {display: none;}";
            }
        });
        
        // 닫기버튼
        document.getElementById("backspan").addEventListener("click",function(){
        	if(sessionStorage.getItem("lost") == null) {
	        	history.back();
        	} else {
        		sessionStorage.removeItem("lost");
        		location.href="${pageContext.request.contextPath}/";
        	}
        });
        
        // 아이디 찾기
        document.getElementById("find-id").addEventListener("click",function(){
        	var url = "${pageContext.request.contextPath}/findID";
            var name = "findID";
            var option = "width = 501, height = 401, left = 100, top = 150";
            window.open(url,name,option);
        });
        
        
        // 회원가입 페이지로
       	document.getElementById("sign-up").addEventListener("click",function(){
       		location.href="${pageContext.request.contextPath}/signuppage";
       	});
    </script>
</body>

</html>