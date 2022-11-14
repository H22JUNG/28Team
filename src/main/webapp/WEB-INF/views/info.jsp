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
        
        main section form input {
            border: 1px solid transparent;
   		    background-image: linear-gradient(#fff, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
    		background-origin: border-box;
    		background-clip: padding-box, border-box;
    		padding: 3px 5px;
    		width: 150px;
    		outline: 0;
        }
        
        main section form ul {
        	display: flex;
    		flex-direction: column;
    		gap: 10px;
        }
        
        main section form ul li>span {
        	width: 200px;
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
        }
        
        main sectipn form button:hover {
	 		 background-image: linear-gradient(#d7ebf1, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
		}
		main section form button:active {
			 background-image: linear-gradient(#d7ebf1, #fff), linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
		}
		.edit {
			display: flex;
    		gap: 10px;
    		white-space: nowrap;
    		white-space: nowrap;
		}
		.edit p {
			display: inline;
    		font-size: 14px;
    		color: #303030;
		    align-self: end;
		    cursor: pointer;
    		white-space: nowrap;
		}
		
		.edit p:hover {
			text-decoration: underline;
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
        	<form action="${pageContext.request.contextPath}/updateUser" method="post" id="update-form">
	                <ul>
                    <li><span>아이디</span>${user.userid}</li>
                    <li><span>이름</span><input type="text" name="username" id="username" value="${user.username}"></li>
                    <li><span>비밀번호 수정</span><input type="password" name="password" id="password"></li>
                    <li><span>비밀번호 확인</span><input type="password" name="pwcheck" id="pwcheck"></li>
                    <li><span>휴대폰 번호</span><input type="tel" name="tel" id="tel" value="${user.tel}"></li>
                    <li><span>이메일</span><input type="text" name="email" id="email" value="${user.email}"></li>
                    <li><span>주소</span><input type="text" name="address" id="address" value="${user.address}"></li>
                    <li><span>적립금</span>${user.point} p</li>
                </ul>
            <div class="edit">
                <button id="edit">
                    수정하기
                </button>
				<p id="quit">회원탈퇴</p>
            </div>
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
       
        
	// 유효성 검사
		
		document.getElementById("edit").addEventListener("click",function(e){
			const username = document.getElementById("username");
			const password = document.getElementById("password");
			const pwcheck = document.getElementById("pwcheck");
			const tel = document.getElementById("tel");
			const email = document.getElementById("email");
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
			
			// 비밀번호
			var pwExp= /^[a-z|A-Z|0-9|~!@\#$%^&*_\-+\=`|\\\(\)\{\}\[\]:;<>,.?\/]+$/;
			if(password.value != "") {
			if(!pwExp.test(password.value)) {
				alert("패스워드는 영문,숫자,기호만 가능합니다.")
				password.focus();
				flag = false;
				return false;
				}
			}
			// 비밀번호 체크
			if(pwcheck.value != password.value) {
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
			var telExp = /^\d{3}-\d{4}-\d{4}$/;
			if(!telExp.test(tel.value)) {
				alert("휴대폰 번호가 올바르지 않습니다. '-'를 포함한 숫자 11자리로 입력해 주세요");
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

			if(flag == true) {
				const form = document.getElementById("update-form");
				form.submit();				
			}
		});
	
		// 회원탈퇴
		document.getElementById("quit").addEventListener("click",function(){
			if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/deleteUser";
			}
		});
	    </script>
</body>

</html>