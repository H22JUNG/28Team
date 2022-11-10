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
    		height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .login-box {
            background-color: white;
            display: flex;
            flex-direction: column;
            gap: 30px;
            position: relative;
            padding: 70px;
        }
		
		.login-box h1 {
			white-space: nowrap;
		}
		
		.login-box h1 span {
			color: #71b9c3;
		}

        /* 닫기 버튼 */
        #backspan {
               position: absolute;
    			top: 25px;
    			left: 390px;
    			cursor: pointer;
        }
        #btn {
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
                <span id="backspan">╳</span>

			<h1><span>${userVO.username}</span> 님 환영합니다. :)</h1>
			
			<button id="btn">로그인 페이지로 돌아가기</button>
        </div>
    </div>

    <script>
    
        // 닫기버튼
        document.getElementById("backspan").addEventListener("click",function(){
        	if(sessionStorage.getItem("lost") == null) {
	        	history.back();
        	} else {
        		sessionStorage.removeItem("lost");
        		location.href="${pageContext.request.contextPath}/";
        	}
        });
        
        document.getElementById("btn").addEventListener("click",function(){
        	<%
			session.setAttribute("lost","lost");
			%>
        	location.href="${pageContext.request.contextPath}/loginpage";
        });
        
        function NotReload(){
            if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
                event.keyCode = 0;
                event.cancelBubble = true;
                event.returnValue = false;
            } 
        }
        document.onkeydown = NotReload;
    </script>
</body>

</html>