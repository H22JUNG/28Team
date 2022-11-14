<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
    <style>
  

        /* 마이페이지 */
        main {
            background-color: white;
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
		}
		
        /* 마이페이지 메뉴 */
        main aside {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
        }

        main aside ul {
            display: flex;
            flex-direction: column;
            gap: 10px;
            width: 100%;
        }

        main aside ul li {
            display: flex;
            justify-content: center;
        }

        main aside ul li>div {
            border: 1px solid #F0F0F0;
            border-radius: 25px;
            width: 430px;
            height: 130px;
            padding: 30px;
            display: flex;
            justify-content: space-between;
            cursor: pointer;
        }

        main aside ul li>div .mytext {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        /* 선택중인 메뉴 css */
        main aside ul li:first-child>div {
            border: 1px solid transparent;
            background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            background-origin: border-box;
            background-clip: padding-box, border-box;
        }


        /* open 버튼 */
        main aside ul li>div .open {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        main aside ul li>div .open>div {
            font-size: 30px;
            background: #f8f8f8;
            border-radius: 15px;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
           
        }

        main aside ul li>div .open>div span {
            height: 100%;
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            background-clip: text;
            -webkit-background-clip: text;
            color: transparent;
        }

        /* 내정보 */
        main section {
            flex: 1.2;
            height: 100%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        main section form {
        	padding: 10px 0;
    		display: flex;
    		flex-direction: column;
    		gap: 10px;
        }
        
        main section form input[type="password"] {
        	border: 1px solid transparent;
    		background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
    		background-origin: border-box;
    		background-clip: padding-box, border-box;
    		font-size: 18px;
    		padding: 0 5px;
    		width: 150px;
    		outline: 0;
        }
        
        main section form p>span {
        	width: 100px;
    		display: inline-block;
        }
        
        main section form button {
        	align-self: baseline;
    		background-color: white;
   			border: 1px solid transparent;
    		background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
    		background-origin: border-box;
    		background-clip: padding-box, border-box;
    		padding: 5px 8px;
    		cursor: pointer;
    		border-radius: 4px;
    		margin-left: 330px;
    		margin-top: 20px;
    		white-space: nowrap;
        }
        
        main sectipn form button:hover {
	 		 background-image: linear-gradient(#d7ebf1, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
		}
		main section form button:active {
			 background-image: linear-gradient(#d7ebf1, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
		}
    </style>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <main>
    	<div class="mypage-container">
        <aside>
            <ul id="sidemenulist">
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>마이페이지</h4>
                            <p>내 정보 조회 / 수정 / 적립금조회</p>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>장바구니</h4>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>주문내역 조회</h4>
                            <p>주문 / 배송 조회</p>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sidemenu">
                        <div class="mytext">
                            <h4>내가 쓴 글</h4>
                        </div>
                        <div class="open">
                            <div><span>+</span></div>
                        </div>
                    </div>
                </li>
            </ul>
        </aside>
        <section>
          		<h1>내 정보 조회</h1>
        		<form action="${pageContext.request.contextPath}/inquireInfo" method="post">
            		<p><span>아이디</span>	${user.userid}</p>
            		<p><span>비밀번호</span> <input type="password" name="password" id="password" value=""/></p>
            		
            		<button>확인</button>
           		</form>
        </section>
        </div>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
    
        <script>
        for (let i = 0; i < document.getElementById("sidemenulist").children.length; i++) {
            document.getElementsByClassName("sidemenu")[i].addEventListener("click", function(){
                location.href = "${pageContext.request.contextPath}/movemypage/"+i;
            });
        };
        
	    </script>
</body>

</html>