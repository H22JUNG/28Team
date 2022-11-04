<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.1.min.js"></script>
<title>Document</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul, li {
	list-style-type: none;
}

a {
	text-decoration: none;
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
	background-color: #FFFAEE;
}

/* 내용 */
.content-box {
	width: 100%;
}

main section {
	flex: 1.2;
	height: 100%;
	padding: 30px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	background-color: white;
	border-radius: 30px;
	margin: 10px;
}

.sec2 {
	height: 400px;
}
/* 본문 */
table {
	border-collapse: collapse;
}

th {
	color: #616161;
	padding: 10px 5px 10px 5px;
	border-bottom: 3px solid #21A5B5;
}

td {
	border-bottom: 1px solid #616161;
	padding: 10px 5px 10px 5px;
	text-align: center;
}

td input{
	height : 30px;
	text-align: center;
}

.admin{
	width : 80px;
	height : 30px;
	text-align: center;
}

.pw, .pwConfirm, .username{
	width: 120px;
}

#modify-btn {
	background: #21A5B5;
	padding: 5px;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}

#cancel-btn{
	background: none;
	padding: 5px;
	border: 1px solid #21A5B5;
	color: #21A5B5;
	cursor: pointer;
	border-radius: 5px;
}

.btns{
	margin-top: 10px;
	text-align: right;
}

/* 컨텐츠 메뉴 */
.side-menu {
	display: flex;
}

.side-menu li {
	padding: 0 20px 0 20px;
}

.side-menu a {
	text-decoration: none;
	color: #21A5B5;
}

.title select:focus, .title options:focus, .qna_write .info input[type="text"]:focus,
	.qna_write .title input[type="password"]:focus, #content:focus  {
	border : none;
	outline : 1px solid #21A5B5;
	border-radius : 5px;
}

td input:focus, .admin:focus{
	border : none;
	outline : 2px solid #21A5B5;
	border-radius : 5px;
}

</style>
</head>

<body>
	<main>
		<div class="mypage-container">
			<div class="content-box">
				<section>
					<ul class="side-menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-admin">관리자
									정보 수정</a>
							</h4>
						</li>
					</ul>
				</section>
				<section class="sec2">
					<form action="${pageContext.request.contextPath}/modifyBtn"
						id="table-box-type"
						method="post">
						<table>
							<thead>
								<tr>
									<th>NO.</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>비밀번호 확인</th>
									<th>관리자명</th>
									<th>연락처</th>
									<th>주소</th>
									<th>이메일</th>
									<th>관리자 유/무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										${uservo.id}
										<input type="hidden" name="id" value="${uservo.id}">
									</td>
									<td>${uservo.userid}</td>
									<td><input type="password" name="password" class="pw"
										placeholder="비밀번호" /></td>
									<td><input type="password" name="pwConfirm"
										class="pwConfirm" placeholder="비밀번호 확인" /></td>
									<td><input type="text" name="username" class="username"
										placeholder="이름" value="${uservo.username}" /></td>
									<td><input type="text" name="tel" class="tel"
										placeholder="전화번호" value="${uservo.tel}" /></td>
									<td><input type="text" name="address" class="address"
										placeholder="주소" value="${uservo.address}" /></td>
									<td><input type="text" name="email" class="email"
										placeholder="이메일" value="${uservo.email}" /></td>
									<td>
										<select name="admin" class="admin">
											<option value="1">관리자</option>
											<option value="0">사용자</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btns">
							<button id="modify-btn">회원정보수정</button>
							<button type="button" id="cancel-btn">취소</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
</body>
<script>
$(document).ready(function(){
		
	//input빈칸채우게 하기
	$("#modify-btn").click(function () {
		console.log('click');
		if ( isEmpty($('input[name=password]').val()) ) {
			alert('비밀번호를 입력해 주세요.');
			$('input[name=password]').focus();
			return false;
		}
		if ( isEmpty($('input[name=pwConfirm]').val()) ) {
			alert('비밀번호확인을 입력해 주세요.');
			$('input[name=pwConfirm]').focus();
			return false;
		}
		if ( isEmpty($('input[name=username]').val()) ) {
			alert('관리자명을 입력해 주세요.');
			$('input[name=username]').focus();
			return false;
		}
		if ( isEmpty($('input[name=tel]').val()) ) {
			alert('연락처를 입력해 주세요.');
			$('input[name=tel]').focus();
			return false;
		}
		if ( isEmpty($('input[name=address]').val()) ) {
			alert('주소를 입력해 주세요.');
			$('input[name=address]').focus();
			return false;
		}
		if ( isEmpty($('input[name=email]').val()) ) {
			alert('이메일을 입력해 주세요.');
			$('input[name=email]').focus();
			return false;
		}
		if ( $('input[name=password]').val() != $('input[name=pwConfirm]').val()) {
			alert('비밀번호가 일치하지 않습니다.');
			$('input[name=pwConfirm]').focus();
			return false;
		}
		if ( $('select[name=admin]').val() == 0) {
			alert('해당 관리자는 사용자로 변경됩니다.');
		}
	});
	
	//수정하기 버튼
	$(document).on('click', '#modify-btn', function() {
		alert("수정이 완료되었습니다.")
	})


	//뒤로가기 버튼
	document.getElementById("cancel-btn").addEventListener("click", function() {
		location.href = "${pageContext.request.contextPath}/admin_admin";
	});
	
}); // ready end
	
</script>
</html>