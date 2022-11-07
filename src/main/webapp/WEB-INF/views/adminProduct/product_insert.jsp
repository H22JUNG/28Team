<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>


/* 마이페이지 */
main {
	background-color: #FFFAEE;
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
	align-items: start;
}

/* 마이페이지 메뉴 */
main aside {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
	background-color: white;
	border-radius: 30px;
	margin: 20px;
	width: 300px;
}

main aside ul {
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 100%;
}

main aside ul li {
	padding: 15px 0 15px 0;
}

main aside .menu a {
	text-decoration: none;
	color: #000;
	margin: 20px 0 20px 0;
}

main aside .menu {
	border: 1px solid #F0F0F0;
	border-radius: 25px;
	width: 100%;
	padding: 10px;
	justify-content: space-between;
}

#sidemenulist h3 {
	text-align: center;
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
/* 본문 */
.admin_container {
	/* border: 1px solid black; */
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	/* align-items: center; */
	background-color: rgb(255, 255, 255);
}

.h1_container {
	display: flex;
	justify-content: center;
    margin-bottom: 20px;
    color: white;
    font-weight: bold;
}

h1 {
	padding: 20px;
	background-color: #21A5B5;
	width: 800px;
	border-radius: 10px;
}

.row {
	/* border: 1px solid green; */
	display: flex;
	justify-content: space-around;
}

.form-group {
	/* width: 50%; */
	
}

#fileDrop {
	/* border: 1px solid blue; */
	height: 500px;
	width: 400px;
}

.fileDrop {
	/* border: 1px solid blue; */
	height: 500px;
	width: 400px;
}

.clearfix {
	display: flex;
	flex-direction: row;
    flex-wrap: wrap;
	height: 480px;
	width: 400px;
	/* border: 1px solid green; */
    /* padding: 20px; */
}

.clearfix li {
	display: flex;
    flex-direction: column;
    padding: 8px;
	/* height: 200px; */
}

.clearfix li input {
    width: 350px;
    height: 30px;
    margin-top: 10px;
}

.imgli{
	height: 180px;
	width: 180px;
}

/* 오른쪽 영역 */
form {
	display: flex;
	align-items: center;
}

form div {
	display: flex;
	flex-direction: column;
}

form div label {
	font-size: 1.1rem;
	font-weight: bold;
	color: #21A5B5;
}

#productDist {
	width: 100px;
}

.input_btn {
	width: 100px;
	cursor: pointer;
}

.input_input {
	width: 180px;
}

.innerinput {
	position: relative;
}

.input_input_input {
	position: absolute;
	z-index: -100;
}

.form-control {
	border: none;
	background-color: rgb(255, 245, 233);
	border-radius: 10px;
	height: 30px;
	padding: 3px;
}

.form-inline {
	/* display: inline; */
	display: flex;
	flex-direction: row;
}

.btn {
	border: none;
	color: white;
	font-weight: bold;
	background-color: #44cedd;
	border-radius: 10px;
}

.btns {
	display: flex;
	flex-direction: row;
	padding: 10px;
	margin: 2px;
}

.final_btn {
	width: 50%;
	height: 40px;
	color: white;
	font-weight: bold;
	cursor: pointer;
	margin-right: 5px;
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
	color: #000;
}

.side-menu a span {
	color: #21A5B5;
	font-weight: bold;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		<div class="mypage-container">
			<aside>
				<ul id="sidemenulist">
					<h3>관리자페이지</h3>
					<div class="menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminpage/1?searchUser=&userInfo=" class="menu1">✔ 회원관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin_product_list" class="menu1">✔ 상품관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/adminOrder?delivstate=1">✔ 주문관리</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-admin-list" class="menu1">✔ 관리자 정보수정</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin-logout" id="admin-logout">✔ 로그아웃</a>
							</h4>
						</li>
					</div>
				</ul>
			</aside>
			<div class="content-box">
				<section>
					<ul class="side-menu">
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin_product_list">상품정보 조회</a>
							</h4>
						</li>
						<li>
							<h4>
								<a href="${pageContext.request.contextPath}/admin_product_insert"><span>상품정보 등록</span></a>
							</h4>
						</li>
					</ul>
				</section>
				<section>

					<div class="container admin_container">
						<div class="h1_container">
						<h1 class="jumbotron" style="text-align: center;">상품 등록</h1>
						</div>
						<div class="row">
							<!--form태그의 위치를 옮겼음-->
							<form action="${pageContext.request.contextPath}/admin/insertInfo" method="post">
								<div id="fileDrop">
									<label>상품 이미지 url을 입력하세요.</label>
                                    <label>최소 1장 이상 입력하세요.</label>
                                    <label>(최대 4장까지 가능)</label>
									<div class="fileDrop">
									<ul class="clearfix">
										<li>
                                            <h4>사진1</h4>
											<input type="text" name="pic1" id="" placeholder="url을 입력하세요." required="required"/>
                                            <h4>사진2</h4>
											<input type="text" name="pic2" id="" placeholder="url을 입력하세요."/>
                                            <h4>사진3</h4>
											<input type="text" name="pic3" id="" placeholder="url을 입력하세요."/>
                                            <h4>사진4</h4>
											<input type="text" name="pic4" id="" placeholder="url을 입력하세요."/>
										</li>
									</ul>
									</div>
								</div>
								<div class="form-group productInfo">
									<div>
										<label>상품명</label> <input name="name" class="form-control" required="required" placeholder="상품명을 입력하세요.">
									</div>
									<div>
										<label>상품가격</label> <input name="price" class="form-control" required="required"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력하세요.">
									</div>
									<div>
										<label>할인율</label> <input type="number" min="1" max="100" name="discount" class="form-control" required="required"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력하세요.">
									</div>
									<div>
										<!--대분류가 뭐가 선택되느냐에 따라서 소분류가 달라져야 하는데?-->
										<label>대분류</label>
										<div class="form-inline">
											<select class="form-control form_input" id="category1">
												<!--  <option value="furniture">1. 가구</option>
												<option value="fabric">2. 패브릭</option>
												<option value="storage">3. 수납용품</option>
												<option value="supplies">4. 생활용품</option>-->
											</select>
											<button class="btn btn-default btn_productDist1 input_btn">입력</button>
											<div class="innerinput">
											<input name="category1" class="form-control input_input" disabled="disabled">
											<input name="category1" class="form-control input_input input_input_input" required="required">
											</div>
										</div>
										<div>
											<label>소분류</label>
											<div class="form-inline">
												<select class="form-control form_input" id="category2">
													<!--<option value="bed">1. 침대</option>
													<option value="sofa">2. 소파</option>
													<option value="mirror">3. 거울</option>
													<option value="chair">4. 의자</option>-->
												</select>
												<button class="btn btn-default btn_productDist2 input_btn">입력</button>
												<div class="innerinput">
												<input name="category2" class="form-control input_input" disabled="disabled">
												<input name="category2" class="form-control input_input input_input_input" required="required">
												</div>
											</div>
										</div>
										<div>
											<label>재고</label> <input name="stock" class="form-control" required="required"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력하세요.">
										</div>
										<div>
											<label>사이즈</label><input name="size" class="form-control" pattern="[A-Za-z]+" placeholder="영어로 입력하세요.">
										</div>
										<div>
										<label>컬러</label> <input name="color" class="form-control" pattern="[A-Za-z]+" placeholder="영어로 입력하세요.">
										</div>
										<div class="btns">
											<button class="btn btn-default final_btn" id="btn_product_insert">등록하기</button>
											<button class="btn btn-default final_btn" id="btn_product_back" type="button">돌아가기</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
    	
    	// 돌아가기 버튼
    	document.getElementById("btn_product_back").addEventListener("click",function(e){
    		e.preventDefault;
        	location.href = "${pageContext.request.contextPath}/admin_product_list";
    	});
    	
    	
    	// 대분류 소분류
    	// 대분류는 key가 되고, 소분류는 value로
    	const objTest = {
    		furniture: ['bed','sofa','mirror','chair'],
    		fabric: ['curtain','bedding','rug'],
    		storage: ['storage store','organization'],
    		supplies: ['supplies']
    	};
    	
    	$(function() {
    		  init();

    		  $(document).on('change', 'select[id=category1]', function() {
    		    const classVal = $(this).val();
    		    $('select[id=category2] option').each(function(idx, item) {
    		      if ($(this).data('class') == classVal || $(this).val() == '') {
    		        $(this).show();
    		      } else {
    		        $(this).hide();
    		      }
    		    });
    		    $('select[id=category2]').val('');
    		  })
    		});

    		// Selectbox option 생성
    		function init() {
    		  let sClassHtml = '<option value="">선택하세요.</option>';
    		  let sItemHtml = '<option value="">선택하세요.</option>';

    		  for (const key in objTest) {
    		    sClassHtml += "<option value='"+key+"'>"+key+"</option>";

    		    const list = objTest[key];
    		    for (let i = 0; i < list.length; i++) {
    		      sItemHtml += "<option value='"+list[i]+"' data-class='"+key+"'>"+list[i]+"</option>";
    		    }
    		  }
    		  $('select[id=category1]').html(sClassHtml);
    		  $('select[id=category2]').html(sItemHtml);

    		  $('select[id=category2] option').each(function(idx, item) {
    		    if ($(this).val() == '') return true;
    		    $(this).hide();
    		  });
    		}

        	// 중분류 change 이벤트
        	$(document).on('change', 'select[id=category1]', function() {
        		const classVal = $(this).val();
        		// 소분류에서 'data-class' 속성 값을 확인하여 대분류 값이 있을 때에만 보여준다.
        		$('select[id=category2] option').each(function(idx, item) {
        			if ($(this).data('class') == classVal || $(this).val() == ''){
        				$(this).show();
        			}else {
        				$(this).hide();
        			}
        		});
        		$('select[id=category2]').val('');
        	});
    	
    	
    	// select 버튼 설정
		$(document).ready(function(){
			$(".btn_productDist1").on('click', function(event) {
				event.preventDefault();
				var productDist1 = $("#category1 option:selected").val();
				$("input[name='category1']").val(productDist1);
				// category1이 변경되면 category2가 초기화되게 만듬
				$("input[name='category2']").val('');
	            // 상품구분을 선택하고 입력 버튼을 누르면 input란에 해당하는 값이 출력됨
			});
			
			$(".btn_productDist2").on('click', function(event) {
				event.preventDefault();
				var productDist2 = $("#category2 option:selected").val();
				$("input[name='category2']").val(productDist2);
	            // 상품구분을 선택하고 입력 버튼을 누르면 input란에 해당하는 값이 출력됨
			});
		});
		
		
	</script>
</body>

</html>