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
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul, li {
	list-style-type: none;
}

body {
	background:
		url("${pageContext.request.contextPath}/image/KakaoTalk_20221013_170149504.webp")
		0% 300% fixed;
	background-size: cover;
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	z-index: 0;
}

/* 헤더 */
header {
	background-color: white;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-width: 1200px;
}

header .header-top {
	display: flex;
	width: 100%;
	justify-content: flex-end;
}

header .header-top .logo img {
	width: 265px;
}

header .header-top .logo {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

header .header-top .side {
	position: absolute;
}

header .header-top .side ul {
	display: flex;
	gap: 10px;
	margin: 10px;
}

/* 카테고리 */
header .category {
	padding: 10px 20px;
	width: 100%;
}

header .category ul {
	display: flex;
	gap: 30px;
}

header .category ul li {
	display: flex;
	justify-content: center;
	align-items: center;
}

header .category ul li:first-child {
	background: #FFECC8;
	border-radius: 10px;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	padding: 5px 15px 7px;
	gap: 10px;
}

/*main*/
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
	flex-direction: column;
	width: 80%;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: inherit;
}

.qna_wrap {
	width: 1000px;
	margin: 100px auto;
}

.qna_title {
	margin-bottom: 30px;
}

.qna_title strong {
	font-size: 30px;
}

.qna_title p {
	margin-top: 5px;
	font-size: 14px;
}

.btn_wrap {
	margin-top: 30px;
	text-align: left;
	font-size: 0;
	right: 0;
}

.btn_wrap a{
	display: inline-block;
	text-align: center;
	margin-left: 10px;
	min-width: 80px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 14px;
}

.insert{
	text-align: right;
}

#ibtn{
	text-align: right;
	background : none;
	padding : 5px;
	border: 1px solid #000;
} 

#inittext{
	margin-top: 15px;
}

.btn_wrap a.on {
	background: #000;
	color: #fff;
}

.qna_content {
	width: 100%;
	border-top: 2px solid #000;
}

.qna_content .title {
	padding: 10px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 20px;
}

.qna_content .info {
	padding: 10px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.qna_content .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.qna_content .info dl:first-child {
	padding-left: 0;
}

.qna_content .info dl::before {
	content: "";
	position: absolute;
	top: 6px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.qna_content .info dl:first-child:before {
	display: none;
}

.qna_content .info dl dt {
	display: inline-block;
	font-size: 14px;
}

.qna_content .info dl dd {
	display: inline-block;
	font-size: 14px;
	margin-left: 10px;
	color: #777;
}

.qna_content .cont {
	padding: 30px 5px 50px 5px;
	border-bottom: 1px solid #000;
	line-height: 160%;
	font-size: 14px;
}
</style>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/image/KakaoTalk_20221012_170414651.png"
					alt=""></a>
			</div>
			<div class="side">
				<ul>
					<li><a href=""><img src="" alt="">검색</a></li>
					<li><a href=""><img src="" alt="">장바구니</a></li>
					<li><a href="${pageContext.request.contextPath}/loginpage">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
				</ul>
			</div>
		</div>
		<nav class="category">
			<ul>
				<li>Category</li>
				<li>가구</li>
				<li>패브릭</li>
				<li>수납용품</li>
				<li>생활용품</li>
				<li>공지사항</li>
				<li>Q&A</li>
				<li>이벤트</li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="mypage-container">
			<div class="qna_wrap">
				<div class="qna_title">
					<strong>Q&A</strong>
					<p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
				</div>
				<div class="qna_content_wrap">
					<div class="qna_content">
						<div class="title">${qnaVO.title}</div>
						<div class="info">
							<dl>
								<dt>NO.</dt>
								<dd>${qnaVO.id}</dd>
							</dl>
							<dl>
								<dt>작성자</dt>
								<dd>${qnaVO.owner}</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>${qnaVO.createDate}</dd>
							</dl>
							<dl>
								<dt>조회</dt>
								<dd>${qnaVO.hits}</dd>
							</dl>
						</div>
						<div class="cont">${qnaVO.content}</div>
					</div>
				</div>
				<%-- <c:if test="${UserVO.admin == 1}">--%>
				<div class="comment" id="comment"></div>
				<div class="insert" id="insert">
					<textarea id="inittext" rows="7" cols="147.5"></textarea>
					<button id="ibtn">등록</button>
					<%-- <a class="btn-fill" id="rep">답글</a>--%>
				</div>
				<%-- </c:if>--%>
				<!--버튼-->
				<div class="btn_wrap">
					<a href="${pageContext.request.contextPath}/detail/1?move_product_qna=true" class="on"
						id="return">목록으로</a>

					<c:if test="${qnaVO.ownerId eq user.id}">
						<a href="#" id="modify">수정</a>
					</c:if>
					<c:if test="${qnaVO.ownerId eq user.id}">
						<a href="#" id="del">삭제</a>
					</c:if>

				</div>
			</div>
		</div>
	</main>
	<footer> </footer>


	<script type="text/javascript">
    	
    	<%--document.getElementById("rep").addEventListener("click",function(){
    		location.href = "${pageContext.request.contextPath}/reply";
    	});--%>
    	//댓글달기
    	const commentMain = document.getElementById("comment");
    	
    	let commentList = [];
    	let originList;
    	
    	window.addEventListener('DOMContentLoaded', (e) => {
    		initialize();
    	});
    	
    	function initialize(){
    		fetch("${pageContext.request.contextPath}/inner_comment/${qnaVO.id}")
    		.then(response => response.json())
    		.then(data => {
    			originList = data;
    			for(const obj of data) {
    				if(obj.orderId === 0){
    					commentList.push(obj);
    				}else{
    					for(const comp of data){
    						if(comp.id == obj.orderId){
    							if(comp.innerList == null){
    								comp.innerList = [];
    							}
    							comp.innerList.push(obj);
    							break;
    						}
    					}
    				}
    			}
    			
    			for(const obj of commentList) {
    				makeCommentList(0,obj);
    			}
    			
    		}).catch(err => {
    			console.log(err);
    		});
    	}
    	
    	function makeCommentList(num, item){
    		const mainDiv = document.createElement("div");
    		mainDiv.style.border = "1px solid black";
    		mainDiv.style.padding = "15px";
    		mainDiv.style.display = "flex";
    		
    		let lPad = (40*num) + 5;
    		mainDiv.style.paddingLeft = lPad + "px";
    		
    		const subDiv1 = document.createElement("div");
    		subDiv1.style.flex = "1";
    		
    		const h4 = document.createElement("h4");
    		h4.innerText = item.owner;
    		const p = document.createElement("p");
    		
    		let content = (num > 0)?"↳":"";
    		p.innerText = content + item.content;
    		
    		const subDiv2 = document.createElement("div");
    		subDiv1.style.width = "100px";
    		subDiv1.style.flexDirection = "column";
    		
    		const initButton = document.createElement("button")
    		initButton.innerText = "답글";
    		
    		subDiv1.append(h4);
    		subDiv1.append(p);
    		
    		subDiv2.append(initButton);
    		
    		mainDiv.append(subDiv1);
    		mainDiv.append(subDiv2);
    		
    		//'댓글'버튼 눌렀을 때 - 전송/취소버튼
    		commentMain.append(mainDiv);
    		
    		initButton.addEventListener("click",function(){
    			const writeDiv = document.createElement("div");
    			writeDiv.classList.add("insert");
    			
    			const writeArea = document.createElement("textarea");
    			const wbtn = document.createElement("button");
    			wbtn.innerText = "댓글";
    			
    			wbtn.addEventListener("click",function(){
    				let str = writeArea.value;
    				
    				const sendObj = {
    					root : ${qnaVO.id},
    					ownerId : ${user.id},
    					owner : "${user.username}",
    					title : 'Re.'+"${qnaVO.title}",
    					content : str,
    					password : "${qnaVO.password}",
    					orderId : item.id
    				}
    				
    				fetch("${pageContext.request.contextPath}/inner_comment/", {
    					method: "POST",
    					headers: {
    						"Content-Type": "application/json",
    					},
    					body: JSON.stringify(sendObj)
    				})
    				.then((response) => response.json())
    				.then((data) => {
    					commentList = [];
    					originList = null;
    					document.getElementById("comment").textContent = "";
    					initialize();
    				});
    				
    			});
    			
    			const cbtn = document.createElement("button");
    			cbtn.innerText = "취소";
    			
    			cbtn.addEventListener("click",function(){
    				writeDiv.remove();
    			});
    			
    			writeDiv.append(writeArea);
    			writeDiv.append(wbtn);
    			writeDiv.append(cbtn);
    			
    			mainDiv.after(writeDiv);
    			
    			
    		});
    		
    		if(item.innerList != null){
    			for(const innerItem of item.innerList){
    				makeCommentList(num+1,innerItem);
    			}
    		}

    	}
    	
    	document.getElementById("ibtn").addEventListener("click",function(){
    		let str = document.getElementById("inittext").value;
    		
    		const sendObj = {
    			root : ${qnaVO.id},
    			ownerId : ${user.id},
    			owner : "${user.username}",
    			title : 'Re.'+"${qnaVO.title}",
    			content : str,
    			password : "${qnaVO.password}",
    			orderId : 0
    		}
    		
    		fetch("${pageContext.request.contextPath}/inner_comment/", {
    			method: "POST",
    			headers: {
    				"Content-Type": "application/json",
    			},
    			body: JSON.stringify(sendObj)
    		})
    		.then((response) => response.json())
    		.then((data) => {
    			makeCommentList(0, sendObj);
    		})
    		.catch(err => {
    			console.log(err);
    		});
    	});
    	
    	//목록이동,수정,삭제 버튼
    	document.getElementById("return").addEventListener("click",function(){
    		location.href = "${pageContext.request.contextPath}/inner_qna";
    	});
    	
    	<%--document.getElementById("modify").addEventListener("click",function(){
    		location.href = "${pageContext.request.contextPath}/update/${qnaVO.id}";
    	})--%>
    	window.onload = function(){
    		let modify = document.getElementById("modify");
    		modify.addEventListener('click', () => {
    			location.href = "${pageContext.request.contextPath}/inner_update/${qnaVO.id}";
    		});
    	}
    	
    	document.getElementById("del").addEventListener("click",function(){
    		let result = confirm("정말로 삭제하시겠습니까?");
    		if(result){
    			location.href="${pageContext.request.contextPath}/inner_remove/${qnaVO.id}";
    		}
    	});
    </script>
</body>
</html>