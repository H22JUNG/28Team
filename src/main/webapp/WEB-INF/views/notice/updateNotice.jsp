<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<style>
main {
	display: flex;
	justify-content: center;
	padding: 50px;
}

.container {
	margin: 0 auto;
	width: 60%;
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.container .head {
	display: flex;
}

.container .head h1 {
	flex: 1;
}

.container .head nav {
	display: flex;
	align-items: center;
}

.container .head nav ul {
	display: flex;
	gap: 5px;
}

.title {
	border-top: 3px solid #D9D9D9;
	padding: 10px 20px 10px 10px;
	border-bottom: 2px solid #D9D9D9;
}

.title>input[type="text"] {
	border: 0;
}

.info {
	border-top: 1px solid #D9D9D9;
	border-bottom: 1px solid #D9D9D9;
	padding: 10px;
}

.title, .info {
	display: flex;
	gap: 30px;
}

.title span, .info span {
	width: 50px;
	font-weight: bold;
	display: flex;
    justify-content: center;
    align-items: center;
}

#title {
	width: 100%;
    padding-left: 10px;
    border: 1px solid #CACACA;
    height: 30px;
}
.content {
	padding: 50px 10px;
	min-height: 50vh;
}

.content #contentDiv {
	width: 100%;
	height: 500px;
	resize: none;
	padding: 20px;
	border: 1px solid #CACACA;	
	border-top: 0;
	outline: 0;
}

#contentDiv ul>li {
	list-style-type: disc;
}
#contentDiv ol>li {
	list-style-type: decimal;
}
#contentDiv img {
	max-width: 100%;
}

#golist {
	display: inline-block;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
	cursor: pointer;
}

.prev, .next {
	border: 1px solid #D9D9D9;
	display: flex;
	gap: 10px;
	align-items: center;
}

.prev span, .next span {
	display: inline-block;
	border-right: 1px solid #D9D9D9;
	padding: 10px;
	cursor: pointer;
}

.prev p, .next p {
	cursor: pointer;
}

.prev p:hover, .next p:hover {
	text-decoration: underline;
}

.update {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	padding: 10px 0;
}

.update button {
	background-color: white;
	border: 1px solid #CACACA;
	color: #21A5B5;
	cursor: pointer;
	outline: none;
	padding: 8px 10px;
	font-size: 15px;
}

.update button:active {
	background-color: #eaf7fb;
}
#important {
	margin-right: 10px;
}

.editor-menu {
	display: flex;
}
.editor-menu button {
	flex: 1;
	padding: 10px 0;
	background-color: white;
	color: #71b9c3;
	border-top: 1px solid #71b9c3;
	border-bottom: 1px solid #71b9c3;
	border-right: 1px solid #71b9c3;
	border-left: 0;
	cursor: pointer;
}

.editor-menu button:first-child {
	border-left: 1px solid #71b9c3;
}

.editor-menu button:hover {
	background-color: #dcf7ff;
}

#order-list, #un-list {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-size: 2px;
    line-height: 0.8;
}

#justifyFull, 
#justifyLeft, 
#justifyCenter, 
#justifyRight {
	display: flex;
	flex-direction: column;
	font-size: 8px;
	line-height: 0.8;
}
#justifyFull {
	justify-content: center;
	align-items: center;
}
#justifyLeft {
	align-items: flex-start;
	justify-content: center;
}
#justifyLeft span {
	padding-left: 10px;
}
#justifyCenter {
	justify-content: center;
	align-items: center;
}
#justifyRight {
	align-items: flex-end;
	justify-content: center;
}
#justifyRight span {
	padding-right: 10px;
}
#img {
	display: none;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<form action="${pageContext.request.contextPath}/setNotice/${notice.no}" method="post" id="update-form">
		<main>
			<div class="container">
				<div class="head">
					<h1>공지사항</h1>
					<nav>
						<ul>
							<li><a href="${pageContext.request.contextPath}/">홈</a></li>
							<li>〉</li>
							<li>공지사항</li>
						</ul>
					</nav>
				</div>
				<div class="content-box">
					<div class="title">
						<span>제목</span><input type="text" name="title" id="title" value="${notice.title}" />
					</div>
				<div class="content">
						<div class="editor-menu">
							<button id="bold">
								<b>B</b>
							</button>
							<button id="italic">
								<i>I</i>
							</button>
							<button id="underline">
								<u>U</u>
							</button>
							<button id="strike">
								<s>S</s>
							</button>
							<button id="justifyFull">
								<span>____</span>
								<span>____</span>
								<span>____</span>
							</button>
							<button id="justifyLeft">
								<span>____</span>
								<span>__</span>
								<span>____</span>
							</button>
							<button id="justifyCenter">
								<span>_____</span>
								<span>__</span>
								<span>____</span>
							</button>
							<button id="justifyRight">
								<span>____</span>
								<span>__</span>
								<span>____</span>
							</button>
							<button id="order-list">
								<span>1.__</span>
								<span>2.__</span>
								<span>3.__</span>
							</button>
							<button id="un-list">
								<span>●__</span>
								<span>●__</span>
								<span>●__</span>
							</button>
							<button id="image">
								img
							</button>
						</div>
						<div id="contentDiv" onkeydown="resize()" onkeyup="resize()" contenteditable="true">${notice.content}</div>
						<input type="file" name="img" id="img" accept="image/*"/>
						<input type="hidden" name="content" id="content"/>
					</div>
					<div class="buttons">
					<input type="checkbox" id="important" name="important" value="1"/><label for="important">중요한 공지로 설정</label>						
							<div class="update">
								<button id="delete">삭제</button>
								<button id="update">확인</button>
							</div>
						<div id="golist">목록으로</div>
					</div>
				</div>
				<div class="controll">
					<div class="prev">
						<span>이전 페이지</span>
						<p>
							<a href="${pageContext.request.contextPath}/notice/${prevnotice.no}">${prevnotice.title}</a>
						</p>
					</div>
					<div class="next">
						<span>다음 페이지</span>
						<p>
							<a href="${pageContext.request.contextPath}/notice/${nextnotice.no}">${nextnotice.title}</a>
						</p>
					</div>
				</div>
			</div>
		</main>
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script type="text/javascript">
		document.getElementById("golist").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/notice";
		});
		
		const editor = document.querySelector('#contentDiv');
		const content = document.getElementById("content");
		const bold = document.getElementById('bold');
		const italic = document.getElementById('italic');
		const underline = document.getElementById('underline');
		const strike = document.getElementById('strike');
		const justifyFull = document.getElementById('justifyFull');
		const justifyCenter = document.getElementById('justifyCenter');
		const justifyRight = document.getElementById('justifyRight');
		const justifyLeft = document.getElementById('justifyLeft');
		const orderList = document.getElementById('order-list');
		const unList = document.getElementById('un-list');
		const image = document.getElementById('image');
		const img = document.getElementById('img');
		const important = document.getElementById("important");
		
		if(${notice.important} == 1) {
			important.checked = true;
		} else {
			important.checked = false;
		}
		
		bold.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("bold");
		});
		italic.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("italic");
		});
		underline.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("underline");
		});
		strike.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("strikeThrough");
		});
		justifyFull.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("justifyFull");
		});
		justifyCenter.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("justifyCenter");
		});
		justifyRight.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("justifyRight");
		});
		justifyLeft.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("justifyLeft");
		});
		orderList.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("insertOrderedList");
		});
		unList.addEventListener("click",function(e){
			e.preventDefault();
			setStyle("insertUnorderedList");
		});
		
		image.addEventListener("click",function(e){
			e.preventDefault();
			img.click();
		});
		const maxSize = 2 * 1024 * 1024;
		img.addEventListener("change",function(e){
			const files = e.target.files;
			if(!!files && files[0].size < maxSize) {
				insertImage(files[0]);
			} else {
				alert("파일 용량을 확인해주세요. (2MB 미만 업로드 가능)");
			}
		});
		function insertImage(file) {
			const reader = new FileReader();
			reader.addEventListener('load',function(e){
				focus();
				document.execCommand('insertImage', false, reader.result);
				resize();
			});
			reader.readAsDataURL(file);
		}
		
		function setStyle(style) {
			document.execCommand(style);
			editor.focus({preventScroll: true});
			focus();
		}
		
		function focus() {
			editor.focus({preventScroll: true});
		}
		
		if (editor.scrollHeight > editor.offsetHeight) {
			editor.style.height = 'auto';
			let height = editor.scrollHeight; // 높이
			editor.style.height = ''+(height + 8)+'px';
		}
		
		function resize() {

			if (editor.scrollHeight > editor.offsetHeight) {
				editor.style.height = 'auto';
				let height = editor.scrollHeight; // 높이
				editor.style.height = ''+(height + 8)+'px';
			}
		};

		document.getElementById("delete").addEventListener("click",function(e) {
					e.preventDefault();
					if(confirm("정말 삭제하시겠습니까?")) {
					location.href = "${pageContext.request.contextPath}/deleteNotice?id="+${notice.id};
			};
		});
		
		document.getElementById("update").addEventListener("click",function(e){
			e.preventDefault();
			const title = document.getElementById("title");
			if(title.value == '') {
				alert("제목을 입력해 주세요");
				return false;
			}
			if(editor.innerHTML == '') {
				alert("내용을 입력해 주세요");
				return false;
			}
			var html = editor.innerHTML;
 			content.value = html;
			
 			document.getElementById("update-form").submit();
		});
	</script>
</body>
</html>