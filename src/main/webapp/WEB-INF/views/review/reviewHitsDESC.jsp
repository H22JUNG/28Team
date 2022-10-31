<%@page import="com.goodee.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="com.goodee.vo.ReviewCommentVO"%>
<%@page import="com.goodee.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.1.min.js?ver123"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link href="${pageContext.request.contextPath}/css/reviweModalCss.css" rel="stylesheet" type="text/css">
<style type="text/css">
/*main*/
main {
	display: flex;
	background-color: white;
	position: relative;
	top: 33%;
	width: 100%;
	justify-content: center;
	align-items: center;
	padding: 20px;
	min-width: 1200px;
	max-width: 100%;
}

main .mypage-container {
	display: flex;
	flex-direction: column;
	width: 80%;
	justify-content: center;
	align-items: center;
}

table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

img {
	border: 0;
}

label, img, input, select, textarea, button {
	vertical-align: middle;
}

a {
	text-decoration: none;
}

select {
	height: 32px;
	font-size: 13px;
	color: #373737;
	border: 1px solid #e9e9e9;
	background: #fff;
	border-radius: 5px;
}

input[type=number] {
	width: 100%;
	height: 30px;
	font-size: 13px;
	color: #373737;
	border: 1px solid #e9e9e9;
	background: #fff;
	text-indent: 20px;
	border-radius: 5px;
	transition: all 0.5s;
	vertical-align: middle;
}

input::-webkit-input-placeholder {
	color: #b5b5b5;
	font-size: 12px;
	line-height: 100%;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.detail_top {
	display: flex;
}

.options {
	padding: 0 0 0 100px;
	box-sizing: border-box;
	width: 600px;
}

/*사진슬라이드 - 상세페이지 윗부분 좌측*/
#wrapper {
	position: relative;
	width: 600px;
	margin: 50px auto;
	height: 400px;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.1) 2px 2px 0px;
	overflow: hidden;
}

#slider-wrap {
	width: 600px;
	height: 400px;
	positioin: relative;
}

#slider-wrap ul#slider {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

#slider-wrap ul#slider li {
	float: left;
	position: relative;
	width: 600px;
	height: 400px;
}

#slider-wrap ul#slider li img {
	display: block;
	width: 100%;
	height: 100%;
	border-radius: 50px;
}

/*사진 슬라이드 버튼*/
.btns {
	position: absolute;
	width: 50px;
	height: 60px;
	top: 50%;
	margin-top: -25px;
	line-height: 57px;
	text-align: center;
	cursor: pointer;
	background-color: none;
	color: #9E9E9E;
	z-index: 100;
	font-size: 20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-khtml-user-select: none;
	-ms-user-select: none;
	-webkit-transition: all 0.1s ease;
	-moz-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	-ms-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.btns:hover {
	color: black;
}

#next {
	right: 15px;
	border-radius: 7px 0px 0px 7px;
}

#previous {
	left: 15px;
	border-radius: 0px 7px 7px 7px;
}

#slider-wrap.active #next {
	right: 0px;
}

#slider-wrap.active #previous {
	left: 0px;
}

/*사진슬라이드 바*/
#pagination-wrap {
	min-width: 20px;
	margin-top: 350px;
	margin-left: auto;
	margin-right: auto;
	height: 15px;
	position: relative;
	text-align: center;
}

#pagination-wrap ul {
	width: 100%;
}

#pagination-wrap ul li {
	margin: 0 4px;
	display: inline-block;
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background: #fff;
	opacity: 0.5;
	position: relative;
	top: 0;
}

#pagination-wrap ul li.active {
	width: 12px;
	height: 12px;
	top: 3px;
	opacity: 1;
	box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
}

/*사진슬라이드 애니메이션*/
#slider-wrap ul, #pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

/*옵션부분 - 상세페이지 윗부분 우*/
.detail_top table {
	border: none;
}

.detail_top h2 {
	
}

.detail_top h2 #name{
	margin: 15px 0 15px;
	width : 100%;
	border : none;
	font-size: 25px;
	font-weight : bold;
	color: #232323;
	line-height: 26px;
	padding: 0 0 20px;
	border-bottom: 2px solid #333;
}

.detail_top table th, td {
	padding: 10px 0;
	font-size: 15px;
	color: #444;
	text-align: left;
}

.detail_top table td.price {
	font-size: 22px;
}

.detail_top table td input, .detail_top table td {
	border: none;
}

.detail_top table td input:focus {
	outline: none;
}

/*옵션선택*/
.detail_top table select {
	width: 30%;
	border: 1px solid #c6c6c6;
	box-sizing: border-box;
	padding-left: 10px;
}

.detail_top table select::-ms-expand {
	display: none;
}

.detail_top table select:focus {
	outline: 2px solid #21A5B5;
	border: 1px solid #21A5B5;
}

/*옵션버튼*/
.detail_top .datail_top_btns {
	text-align: center;
	padding: 25px 0 0 0;
}

.detail_top .datail_top_btns>input {
	display: inline-block;
	width: 136px;
	height: 50px;
	font-size: 17px;
	color: #fff;
	border-radius: 5px;
	line-height: 50px;
}

.detail_top .datail_top_btns>input#btn1 {
	background: white;
	border: 1px solid #21A5B5;
	color: #21A5B5;
	margin-right: 10px;
}

.detail_top .datail_top_btns>input#btn2 {
	background: #21A5B5;
	border: 1px solid #21A5B5;
}

.detail_top .datail_top_btns>#btn1:hover {
	border: 1px solid #257f8a;
	color: #257f8a;
	font-weight: 400;
}

.detail_top .datail_top_btns>#btn2:hover {
	background-color: #257f8a;
	border: 1px solid #257f8a;
}

/*탭 메뉴*/
.tabmenu {
	font-size: 0;
	text-align: center;
}

.tabmenu input[type="radio"] {
	display: none;
}

.tabmenu label {
	display: inline-block;
	width: 33%;
	padding: 15px 0;
	color: #444;
	font-weight: 800;
	background: white;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
}

.tabmenu label:nth-of-type(2) {
	width: 34%;
}

.tabmenu label:hover {
	color: #21A5B5;
}

/*탭의 내용부분*/
.tabmenu>div {
	display: none;
	font-size: 30px;
	min-height: 300px;
	display:block;
}
/* 
.tabmenu #tab1:checked ~ #content1, .tabmenu #tab2:checked ~ #content2,
	.tabmenu #tab3:checked ~ #content3 {
	display: block;
} 
 */
hr {
	margin-top: 20px;
}

/*상세정보 내용*/
#content1 {
	width: 70vw;
}

/* 리뷰 */
#content2 {
	width: 70vw;
}

#content3 {
	width: 70%;
}

#delivery{
	margin-top : 20px;
}

details{
	margin-left : 15%;
}

summary {
	font-size: 13px;
	cursor: pointer;
	list-style: none;
	font-weight: 600;
	padding : 10px 0 0 0;
	text-align: left;
}

.summary1, .summary2, .summary3, .summary4 {
	width: 60%;
	background: #fafafa;
	font-size: 10px;
	line-height: 25px;
	margin: 10px 0;
	text-align: left;
}

/* go-btn */
.go-btn {
	position: fixed;
	width: 40px;
	bottom: 20px;
	right: 25px;
	z-index: 2;
	cursor: pointer;
}

.go-btn span {
	display: block;
	color: #fff;
	background: #f1f3f5;
	text-align: center;
	border-radius: 50%;
	width: 36px;
	height: 34px;
	line-height: 36px;
	font-size: 22px;
	padding-bottom: 40px;
}

.go-btn i {
	color: #ddd;
}

input {
	width: 50px;
}

.dc {
	width: 80px;
	padding: 0px;
	margin: 0px;
	color: #21A5B5;
	font-size: 23px;
	font-weight: bold;
}

@media screen and (max-width: 700px) {
	.main {
		width: 70%
	}
}

@media screen and (max-width: 500px) {
	.main {
		width: 50%
	}
}

.cost {
	text-decoration: line-through;
	width: 70px;
}

.selected_option {
	background: #f1f3f5;
	width: 500px;
	height: 100px;
	border: 1px solid black;
}
#hitDESC{
	background : #21A5B5;
	color : white;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<main>
		<div class="mypage-container">
			<!--상세페이지 상단(사진슬라이드+옵션부분)-->
			<div class="detail_top">
				<!--상세페이지 윗부분의 좌측(사진슬라이드)-->
				<div id="wrapper">
					<div id="slider-wrap">
						<ul id="slider">
							<li><img src="${detailVO.pic1}" alt=""></li>
							<li><img src="${detailVO.pic2}" alt=""></li>
							<li><img src="${detailVO.pic3}" alt=""></li>
							<c:if test="${detailVO.pic4 != null}">
							<li><img src="${detailVO.pic4}" alt=""></li>
							</c:if>
						</ul>
						<input type="hidden" name="pic1" id="pic1" value="${detailVO.pic1}"/>
						<input type="hidden" value="${detailVO.price}" id="cost1">

						<!--사진슬라이드 버튼-->
						<div class="btns" id="next">
							<i class="fa fa-chevron-right"></i>
						</div>
						<div class="btns" id="previous">
							<i class="fa fa-chevron-left"></i>
						</div>
						<div id="pagination-wrap">
							<ul></ul>
						</div>
					</div>
				</div>

				<!--상세페이지 상단의 우측(옵션부분)-->
				<div class="go-btn" onclick="window.scrollTo(0, 0);">
					<span><i class="fa fa-chevron-up"></i></span>
				</div>
				<div class="options">
					<h2><input type="text" value="${detailVO.name}" id="name"></h2>
						<table>
							<colgroup>
								<!--이름쪽은 변하지 않고, 옵션쪽은 유동적이게-->
								<col style="width: 173px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label>가격 </label></th>
									<td><input type="text" value="<fmt:formatNumber value="${detailVO.price}" pattern="#,###" />원" id="cost"><label for="dc"></label>
									<input type="text" value="${detailVO.discount}" name="dc"
										id="dc"><span id="dc-span">%</span></td>
								</tr>
								<tr>
									<th><label>판매가격 </label></th>
									<td><input type="text"
										value="<fmt:formatNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}" pattern="#,###" />"
										id="price"> <span>원</span></td>
								</tr>
								<tr>
									<th><label>상품코드 </label></th>
									<%-- <td><input type="text" value="${detailOptionVO.proNum}"
										id="product_code"></td> --%>
									<td>
									
										<select name="code" id="code" data-size="${vo.proNum}" data-size="${vo.color}">
										<c:forEach var="vo" items="${detailOptionVO}">
											<c:forTokens var="vo1" items="${vo.proNum}" delims=",">
								 				<option value="${vo1}">${vo1}</option>
								 			</c:forTokens>
								 		</c:forEach>
										</select>
								
									</td>
									<td><input type="hidden" value="${detailVO.id}" id="id"></td>
								</tr>
								<tr>
									<th>배송비</th>
									<td><input type="text" value="2,500"><span>원</span></td>
								</tr>
								<tr>
									<th><label>적립금 </label></th>
									<td><input type="text"
										value="<fmt:formatNumber value="${(detailVO.price - (detailVO.price * (detailVO.discount/100))) * 0.05}" pattern="#,###" />"
										id="save"><span>원</span></td>
								</tr>
								
								<%-- <c:if test="${not empty detailOptionVO[2].size}">--%>
								<tr>
									<th>옵션선택(사이즈)</th>
								 	<td>
								 		<select name="opt_select_2" id="select_size" class="form-control opt_select_size">
								 		<c:forEach var="vo2" items="${selectOptionSize}">
								 			<c:forTokens var="vo3" items="${vo2.size}" delims=",">
								 				<option value="${vo3}">${vo3}</option>
								 			</c:forTokens>
								 		</c:forEach>
								 	</select>
								 	</td>
								</tr>
								<%-- </c:if>--%>
								
								<%-- <c:if test="${not empty detailOptionVO[3].color}">--%>
								<tr>
									 <th>옵션선택(색상)</th>
								<td>
									<c:forEach var="vo" items="${selectOptionColor}">
										<select name="opt_select_1" id="select_color" data-size="${vo.size}" class="form-control opt_select_color">
								 			<c:forTokens var="vo1" items="${vo.color}" delims=",">
								 				<option value="${vo1}">${vo1}</option>
								 			</c:forTokens>
								 		</select>
								 	</c:forEach>
								</td>
								</tr>
								<%--</c:if> --%>
								
								<tr>
									<th><label>구매수량</label></th>
									<td><select name="select_count" id="select_count"
										class="form-control">
											<%-- <c:forEach begin="1" end="${detailOptionVO.stock}" var="count">--%>
											<c:forEach begin="1" end="10" var="count">
												<option>${count}</option>
											</c:forEach>
									</select></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="productId" value="${detailVO.id}">
						<%-- <input type="hidden" name="productNum" value="${detailOptionVO.proNum}">--%>
						<!--장바구니/구매하기 버튼-->
						<div class="datail_top_btns">
							<input type="submit" value="장바구니" id="btn1" />
							<input type="submit" value="구매하기" id="btn2" />
						</div>
						<%--</div>--%>
					<%-- </form>--%>
				</div>
			</div>
			<hr width="100%" color="black" size="1">
			<!--탭-->
			<div class="tabmenu">
				<a href="#"><label for="tab1">상세정보</label></a>
				<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}"><label for="tab2" style="color:#21A5B5;">리뷰</label></a>
				<a href="#"><label for="tab3">상품문의</label></a>
				<div id="content1">
<div id="reviewContainer">
    <div id="REVIEW">
        <h2>REVIEW</h2>
        <p>상품의 사용후기를 적어주세요</p>
    </div> 
	

     <h3>REVIEW(${review.size()}개)</h3>
    <div class="Allstar">
        <div class="starsScore">
            <span id="star">★</span><span id="grade">${starGradeAvg}</span>
            <c:if test="${review.size() != 0}">
	           <h3> ${(starGradeCount[4] + starGradeCount[3] + starGradeCount[2]) /reviewCount * 100}%의 구매자가 이 상품을 좋아합니다</h3>
	           </c:if>
	           <c:if test="${review.size() == 0}">
	           	<h3> 아직 리뷰를 남긴 구매자가 없습니다</h3>
	           </c:if>
            <button id="writeReview" style="cursor : pointer;">상품 리뷰 작성하기</button>
        </div>
        <div class="starsGrade">
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">아주 좋아요</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[4] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[4]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">맘에 들어요</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[3] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[3]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">보통이에요&nbsp;</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[2] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[2]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">그냥 그래요</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[1] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[1]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">별로에요&nbsp;&nbsp;&nbsp;&nbsp;</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[0] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[0]}</p>
            </div>
        </div>
    </div>

		<div class="image">
			<span>
				<h3>사진(${picCount}개)</h3> <a href="#" id="allpic">사진 리뷰 전체보기</a>
			</span>
			<div class="imgPreview">
				<c:forEach var="pic" items="${pic}">
						<img src="${pic.pic1}" alt="">
				</c:forEach>
			</div>
		</div>
		
		<!-- 최신순 기본 -->
		<div class="review">
		<c:if test="${review.size() !=0 }">
	        <button id="recentDESC">최신순</button>
	        <button id="starDESC">별점순</button>
	        <button id="hitDESC">추천순</button>
		</c:if>
		<c:if test="${review.size() eq 0 }">
	      	<h6 style="text-align:center; padding-top:30px;">아직 작성된 리뷰가 없습니다</h6>
		</c:if>
        <c:forEach var="review" items="${review}">
        <div class="review-container">
            <div class="reviewContentBox">
                <p id="review-title">
                	<span class="title-star">
         			<c:forEach begin="1" end="${review.stargrade }">★</c:forEach>
         			</span>${review.title }</p>
                <div id="review-content"><p>${review.content }</p></div>
         	   <c:if test="${review.pic1 != null}">
              	  <img src="${review.pic1}" alt="">
               </c:if>
         	   <c:if test="${review.pic2 != null}">
             	  <img src="${review.pic2}" alt="">
               </c:if>
            </div>
				<div class="reviewComment">
					<p id="hits${review.id}" style="cursor:pointer;">👍🏻 도움돼요(${review.hits})</p>
					<p>	
					<!-- 	commentCount.id=review.id 일치하면  -->
						<c:forEach var="count" items="${commentCount}">
							<c:if test="${count.reviewId eq review.id}">
								<a href="" class="commCount" id="commCount">댓글보기(${count.commentCount}개)</a>
							</c:if>
						</c:forEach>
					</p>
					<div class="dropdown" id="dropdown${review.id}">
						<c:forEach var="comment" items="${comment}">
							<c:if test="${comment.reviewId eq review.id}">
								<p>${comment.username}: ${comment.content}</p>
							</c:if>
						</c:forEach>
						<form action="" method="post">
							<textarea name="recomm" id="commentContent${review.id}" cols="40" rows="3"
								placeholder="댓글을 남겨주세요"></textarea>
							<button id="commentInsert${review.id}">등록</button>
						</form>
					</div>
				</div>
				</div>
            </c:forEach>
    </div>
			<!-- =====================페이징========================== -->
            <div class="pageing">
			<c:choose>
				<c:when test="${review.size()==0 }">
					<span class="spanarrow">〈〈 &nbsp;</span>
					<span class="spanarrow"> 〈&nbsp;</span>
					<span class="arrow" id="nowpage">&nbsp;1&nbsp;</span>
					<span class="spanarrow">&nbsp;〉 </span>
					<span class="spanarrow">&nbsp; 〉〉</span>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${1 == page.nowPage}">
						<span class="spanarrow">〈〈 &nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=1" class="arrow" id="prepre">〈〈  &nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${1 == page.nowPage}">
						<span class="spanarrow"> 〈&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=${page.nowPage - 1}"
							class="arrow" id="pre"> 〈&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<c:choose>
						<c:when test="${page.nowPage eq i}">
							<span class="arrow" id="nowpage">&nbsp;${i}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=${i}"
								class="arrow" style="color: #CBCBCB;" id="movePage">&nbsp;${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page.totalPage == page.nowPage}">
						<span class="spanarrow">&nbsp;〉 </span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=${page.nowPage + 1}"
							class="arrow" id="next">&nbsp;〉 </a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.totalPage eq page.nowPage}">
						<span class="spanarrow">&nbsp; 〉〉</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?page=${page.totalPage}"
							class="arrow" id="nextnext">&nbsp; 〉〉</a>
					</c:otherwise>
				</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
    
    <script>
    
    document.getElementById("writeReview").addEventListener("click", function() {
    	location.href = "${pageContext.request.contextPath}/writeReview";
    });
    
    
     for(let i = 0; i< document.getElementsByClassName("commCount").length; i++) {
 	    document.getElementsByClassName("commCount")[i].addEventListener("click", function(e) {
   			e.preventDefault();
   			if(document.getElementsByClassName("dropdown")[i].style.display == 'block') {
   	 	    	document.getElementsByClassName("dropdown")[i].style.display = 'none';
   			} else {
 	        	document.getElementsByClassName("dropdown")[i].style.display = 'block';
   			}
	    });
  	  }; 
 
     <c:forEach var="review" items="${review}">
   		document.getElementById("hits${review.id}").addEventListener("click", function(e) {
   			e.preventDefault();
   			<% if(session.getAttribute("user") != null) {%>
	   		fetch("${pageContext.request.contextPath}/hitsPlus?id=${review.id}&hits=${review.hits+1}")
	   		.then(response => response.json())
			.then(data => {
				document.getElementById("hits${review.id}").innerHTML = '<b>👍🏻 도움돼요('+data+')<b>';	
			 });
	   		<%} else {%>
	   			alert("로그인 후 이용하실 수 있습니다.");
	   		<%} %>
   		}); 
   		
   		document.getElementById("commentInsert${review.id}").addEventListener("click", function(e) {
   			e.preventDefault();

   			<%if (session.getAttribute("user") != null) {
				UserVO user = (UserVO) session.getAttribute("user");%>
   					if(document.getElementById("commentContent${review.id}").value==""
   							|| document.getElementById("commentContent${review.id}").value == null) {
   						alert("내용을 입력해주세요");
   					} else {
   						let commentData = { productId : "${review.code}",
   											reviewId : "${review.id}",
   											userid : "<%=user.getUserid()%>",
   											username : "<%=user.getUsername()%>",
   											content : document.getElementById("commentContent${review.id}").value };
   			
				   		fetch("${pageContext.request.contextPath}/commentInsert", {
				   			method : "PUT",
				   			headers : {"Content-Type" : "application/json"},
				   			body : JSON.stringify(commentData)
				   		})
				   		.then(response => response.json())
						.then(data => {
							let p = document.createElement("p");
							p.append(data.username +" : "+data.content);
							document.getElementById("dropdown${review.id}").lastElementChild.before(p);
							/* 수정삭제 만들기 */
							document.getElementById("commentContent${review.id}").value = "";
						});
			   		}
			<%} else {%>
				 alert("로그인 후 이용하실 수 있습니다.");
			<%}%>
   			
   		}); 
   	</c:forEach>
    </script>
     
     
     <!-- ======================모달=============================== -->
    <div id="modal-overlay">
    <div id="modal">
    	<div id="photo">
    		<c:if test="${pic != null}">
    		 <c:forEach var="review" items="${pic}"  varStatus="status">
    		 	<a href="#" id="pic${status.count}" data-id="${review.id}"><img src="${review.pic1}" /></a>
    		 </c:forEach>
    		 </c:if>
    		 <c:if test="${pic[0] == null}">
    		 	<p><b>아직 등록된 사진리뷰가 없습니다.</b></p>
    		 </c:if>
    	</div>
		<div id="review">
			<div id="review-productInfo">
                <div>
                    <h6>${detailVO.name}</h6>
                    <p><c:forEach begin="1" end="${starGradeAvg+((starGradeAvg%1>0.5)?(1-(starGradeAvg%1))%1:-(starGradeAvg%1))}"><span id="review-star">★</span></c:forEach>
                        리뷰 ${reviewCount}개</p>
                </div>
				<div id="x">✖</div>
			</div>
			<div id="image-box">
				<c:forEach var="review" items="${pic}">
					<a href="#"><img id="reviewInreview-img" src="${review.pic1}" title="이미지를 크게 보려면 클릭하세요"/></a>
				</c:forEach>
			</div>
			<c:if test ="${review[0].title != null}">
			<div id="reviewInreview">
				<p id="reviewInreview-star"><c:forEach begin="1" end="${review[0].stargrade}">★</c:forEach></p>
				<b>제목 : </b><p id="reviewInreview-title">${review[0].title}</p>
				<p id="reviewInreview-content">${review[0].content}</p>
			</div>
			</c:if>
		</div>
	</div>
	</div>
	
	
	<!-- ====================사진 크게보기=======================-->
	<div id="originPic-overlay">
		<div id="originPic">
			<h1 style="text-align:end;">✖</h1>
			<img src="" id="originPic-img">
		</div>
	</div>
	
	<script>
	
	//모달 스크립트
	document.getElementById("allpic").addEventListener("click", function(e) {
   		document.getElementById("modal").style.display = "flex";
   		document.getElementById("modal-overlay").style.display = "flex";
    });
	 
	document.getElementById("x").addEventListener("click", function() {
	        document.getElementById("modal").style.display = "none";
	        document.getElementById("modal-overlay").style.display = "none";	        
	        document.querySelector('body').style.overflow = 'auto';
	});
	

 	 window.addEventListener("DOMContentLoaded", function(){
 		 let pics = document.getElementById("photo").children;
 		 
 		 for(let pic of pics){
 			 pic.addEventListener("click", function(e){
 				e.preventDefault();
 				 
 				 let id = this.dataset.id;
 				 
 				 fetch("${pageContext.request.contextPath}/photoSelect/"+id)
 					.then(response => response.json())
 					.then(data => {
 							let star = "";
 							for(let i=0; i<data.stargrade; i++) {
 								star += "★";
 							}
 				
 							let src = this.children[0].getAttribute("src");
 							
 							document.getElementById("reviewInreview-img").src = src;
 							document.getElementById("reviewInreview-star").innerText = star;
 							document.getElementById("reviewInreview-title").innerText = data.title;
 							document.getElementById("reviewInreview-content").innerText = data.content;
 					}); 
 			 });
 			 
 		 }
 		 
 		  	 
 	 <%-- 버튼이 로딩되기 전에 이벤트 먼저 생성되어 pic1에 이벤트 안먹힘 
 	 	<c:forEach var="review" items="${pic}" varStatus="status">
 	     
		 document.getElementById("pic${status.count}").addEventListener("click", function(e) {
			 e.preventDefault();
			 
			 let id = this.dataset.id;
			 
			 fetch("${pageContext.request.contextPath}/photoSelect/"+id)
				.then(response => response.json())
				.then(data => {
						let star = "";
						for(let i=0; i<data.stargrade; i++) {
							star += "★";
						}
						document.getElementById("reviewInreview-img").src = "${review.pic1}";
						document.getElementById("reviewInreview-star").innerText = star;
						document.getElementById("reviewInreview-title").innerText = data.title;
						document.getElementById("reviewInreview-content").innerText = data.content;
				});
		 });
 		
	 <%--</c:forEach>--%>
 	 });
	 
	 	//사진 크게보기
		 document.getElementById("reviewInreview-img").addEventListener("click", function(e) {
			 e.preventDefault();
		        document.getElementById("originPic-overlay").style.display = "flex";
		        document.getElementById("originPic-img").src = document.getElementById("reviewInreview-img").src;
		        document.getElementById("originPic").style.display = "block";
		  });	 

		 //사진 크게보기 닫기(x버튼, ESC)
		 document.querySelector("#originPic h1").addEventListener("click", function() {
			 document.getElementById("originPic-overlay").style.display = "none";
		     document.getElementById("originPic").style.display = "none";

		 });
		 
		 window.addEventListener("keyup", e => {
			if(document.getElementById("originPic-overlay").style.display === "flex" && e.key === "Escape") {
			   	document.getElementById("originPic-overlay").style.display = "none";
			   	document.getElementById("originPic").style.display = "none";
			}
		 });
	</script>


				</div>

			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp"></jsp:include>


	<script type="text/javascript">
	
	// 옵션 및 사이즈 중복 제거하기
	window.addEventListener("DOMContentLoaded", function(){
		let size = document.getElementById("select_size").value;
		const colorSelects = document.querySelectorAll("select[name='opt_select_1']");
		
		for (let cselect of colorSelects) {
			
			if(size != cselect.dataset.size){
				cselect.style.display = "none";
			}
		}
	});
	
	document.querySelector("select[name='opt_select_2']").addEventListener("change", function(){
		let size = document.getElementById("select_size").value;
		const colorSelects = document.querySelectorAll("select[name='opt_select_1']");
		
		for (let cselect of colorSelects) {
			if(size != cselect.dataset.size){
				cselect.style.display = "none";
			}else{
				cselect.style.display = "block";
			}
		}
	});
	
	window.addEventListener("DOMContentLoaded", function(){
		let color = document.getElementById("select_color").value;
		let size = document.getElementById("select_size").value;
		
		const codeSelects = document.querySelectorAll("select[name='code']");
		
		for (let cselect of codeSelects) {
			
			if(size != cselect.dataset.size){
				cselect.style.display = "none";
			}
		}
	});
	
	document.querySelector("select[name='code']").addEventListener("change", function(){
		let size = document.getElementById("select_size").value;
		let color = document.getElementById("select_color").value;

		const codeSelects = document.querySelectorAll("select[name='code']");
		
		for (let cselect of codeSelects) {
			if(size != cselect.dataset.color){
				cselect.style.display = "none";
			}else{
				cselect.style.display = "block";
			}
		}
	});
	
		// 사진슬라이드
		var slideWrapper = document.getElementById('slider-wrap');
		var slideIndex = 0;
		var slides = document.querySelectorAll('#slider-wrap ul li');
		var totalSlides = slides.length;
		var sliderWidth = slideWrapper.clientWidth;
		slides.forEach(function(element) {
			element.style.width = sliderWidth + 'px';
		})
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';
		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function() {
			plusSlides(1);
		});
		prevBtn.addEventListener('click', function() {
			plusSlides(-1);
		});

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlides(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			slideIndex = n;
			if (slideIndex == -1) {
				slideIndex = totalSlides - 1;
			} else if (slideIndex === totalSlides) {
				slideIndex = 0;
			}

			slider.style.left = -(sliderWidth * slideIndex) + 'px';
			pagination();
		}

		slides.forEach(function() {
			var li = document.createElement('li');
			document.querySelector('#pagination-wrap ul').appendChild(li);
		})

		function pagination() {
			var dots = document.querySelectorAll('#pagination-wrap ul li');
			dots.forEach(function(element) {
				element.classList.remove('active');
			});
			dots[slideIndex].classList.add('active');
		}

		pagination();
		var autoSlider = setInterval(function() {
			plusSlides(1);
		}, 3000);
		
		
		// 장바구니 이동
		$("#btn1").click(function() {
			var id = $("#id").val();
			var count = $("#select_count").val();
			var size = $("#select_size").val();
			var color = $("#select_color").val();
			var name = $("#name").val();
			var code = $("#code").val();
			var dc = $("#dc").val();
			var price = $("#cost1").val();
			var pic1 = $("#pic1").val();
			
			
			console.log("id : " + id);
			console.log("count : " + count);
			console.log("size : " + size);
			console.log("color : " + color);
			console.log("name : " + name);
			console.log("code : " + code);
			console.log("dc : " + dc);
			console.log("price : " + price);
			console.log("pic1 : " + pic1);
			

			var data = {
				id : id,
				count : count,
				size : size,
				color : color,
				name : name,
				code : code,
				dc : dc,
				price : price,
				pic1 : pic1
				
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/cart",
				type : "post",
				data : data,
				success : function(result) {
					if(result ==1){
						if(confirm("장바구니에 담으시겠습니까?")){
							alert("장바구니에 담았습니다.");
							$("#select_count").val("1");
						}
					} else{
						alert("로그인 후 이용해주세요.");
						$("#select_count").val("1");
					}
					},
					error : function() {
					alert("장바구니에 담을 수 없습니다.");
				}
			});
		});
		
		// 구매하기 이동
		$("#btn2").click(function() {
			var id = $("#id").val();
			var count = $("#select_count").val();
			var size = $("#select_size").val();
			var color = $("#select_color").val();
			var name = $("#name").val();
			var price = $("#cost").val();
			var dc = $("#dc").val();
			
			console.log("id : " + id);
			console.log("count : " + count);
			console.log("size : " + size);
			console.log("color : " + color);
			console.log("name : " + name);
			console.log("price : " + price);
			console.log("dc : " + dc);

			var data = {
				id : id,
				count : count,
				size : size,
				color : color,
				name : name,
				price : price,
				dc : dc
			};

			$.ajax({
				url : "${pageContext.request.contextPath}/pay",
				type : "post",
				data : data,
				success : function(result) {
					if(result ==1){
						$("#select_count").val("1");
					} else{
						alert("로그인 후 이용해주세요.");
						$("#select_count").val("1");
					}
					},
					error : function() {
					alert("죄송합니다. 구매하실 수 없습니다.");
				}
			});
		});

	</script>

</body>
</html>