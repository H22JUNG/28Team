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
	min-width: 500px;
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

/*?????????????????? - ??????????????? ????????? ??????*/
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

/*?????? ???????????? ??????*/
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

/*?????????????????? ???*/
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

/*?????????????????? ???????????????*/
#slider-wrap ul, #pagination-wrap ul li {
	-webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-moz-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	-ms-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
	transition: all 0.3s cubic-bezier(1, .01, .32, 1);
}

/*???????????? - ??????????????? ????????? ???*/
.detail_top table {
	border: none;
}

.detail_top h2 #itemName{
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

/*????????????*/
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

/*????????????*/
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

/*??? ??????*/
.tabmenu {
	font-size: 0;
	text-align: center;
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

/*?????? ????????????*/
.tabmenu>div {
	display: none;
	font-size: 28px;
	padding: 20px;
	min-height: 300px;
	display: block;
}

hr {
	margin-top: 20px;
}

/*???????????? ??????*/
#content1 img {
	width: 70%;
}

/* ?????? */
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

#discount {
	width: 30px;
	padding: 0px;
	margin: 0px;
	color: #21A5B5;
	font-size: 23px;
	font-weight: bold;
}

#discount-span {
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

#cost {
	text-decoration: line-through;
	width: 71px;
}

.selected_option {
	background: #f1f3f5;
	width: 500px;
	height: 100px;
	border: 1px solid black;
}

.options #itemName:focus{
	outline : none;
}
#procode{
	display : none;
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
			<!--??????????????? ??????(??????????????????+????????????)-->
			<div class="detail_top">
				<!--??????????????? ???????????? ??????(??????????????????)-->
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
			
						<!--?????????????????? ??????-->
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
				
				<!--??????????????? ????????? ??????(????????????)-->
				<div class="go-btn" onclick="window.scrollTo(0, 0);">
					<span><i class="fa fa-chevron-up"></i></span>
				</div>
				<div class="options"><!-- ???????????? -->
				<form action="${pageContext.request.contextPath}/NowBuyController" method="post" id="now-buy">
				
					<h2>
						<input type="text" value="${detailVO.name}" id="itemName" name="itemName">
					</h2>
					<table id="productTable">
						<colgroup>
							<!--???????????? ????????? ??????, ???????????? ???????????????-->
							<col style="width: 173px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th><label>?????? </label></th>
								<td><input type="text"
									value="<fmt:formatNumber value="${detailVO.price}" pattern="#,###" />???"
									id="cost"><label for="discount"></label> <input type="text"
									value="${detailVO.discount}" name="discount" id="discount"><span
									id="discount-span">%</span></td>
							</tr>
							<tr>
								<th><label>???????????? </label></th>
								<td><input type="text"
									value="<fmt:formatNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}" pattern="#,###" />"
									id="price"> <span>???</span></td>
							</tr>
							<tr id = "procode">
								<th><label>???????????? </label></th>
								<td><select name="proNum" id="code">
										<c:forEach var="vo" items="${detailOptionVO}">
											<c:forTokens var="vo1" items="${vo.proNum}" delims=",">
												<option value="${vo1}">${vo1}</option>
											</c:forTokens>
										</c:forEach>
								</select></td>
								<td><input type="hidden" value="${detailVO.id}" id="id"></td>
							</tr>
							<tr>
								<th>?????????</th>
								<td><input type="text" value="2,500"><span>???</span></td>
							</tr>
							<tr>
								<th><label>????????? </label></th>
								<td><input type="text"
									value="<fmt:formatNumber value="${(detailVO.price - (detailVO.price * (detailVO.discount/100))) * 0.05}" pattern="#,###" />"
									id="save"><span>???</span></td>
							</tr>

							<c:if test="${detailOptionVO[1].size != null}">
								<tr>
									<th>????????????(?????????)</th>
									<td><select name="size" id="select_size"
										class="form-control opt_select_size">
											<option value="????????????">-????????????-</option>
											<c:forEach var="vo2" items="${selectOptionSize}">
												<c:forTokens var="vo3" items="${vo2.size}" delims=",">
													<option value="${vo3}">${vo3}</option>
												</c:forTokens>
											</c:forEach>
									</select></td>
								</tr>
							</c:if>

							<c:if test="${detailOptionVO[1].color != null}">
							<c:choose>
								<c:when test="${detailOptionVO[1].size != null}">
									<tr>
										<th>????????????(??????)</th>
										<td>
											<select name="color" id="select_color"
												data-size="10" class="form-control opt_select_color">
												<option value="????????????">-????????????-</option>
											</select>
										</td>
									</tr>
								</c:when>
								<c:otherwise> 
									<tr>
										<th>????????????(??????)</th>
										<td>
											<select name="color" id="select_color"
												data-size="10" class="form-control opt_select_color">
												<option value="????????????">-????????????-</option>
												<c:forEach var="vo2" items="${selectOptionSize}">
													<c:forTokens var="vo3" items="${vo2.color}" delims=",">
														<option value="${vo3}">${vo3}</option>
													</c:forTokens>
												</c:forEach>
											</select>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</c:if>
								
							<tr>
								<th><label>????????????</label></th>
								<td><select name="count" id="select_count"
									class="form-control">
										<c:forEach begin="1" end="${detailOptionVO[0].stock}"
											var="count">
											<option>${count}</option>
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
					<div id="selectoption">
					
					</div>
					<input type="hidden" name="productId" id="proid" value="${detailVO.id}">

					<!--????????????/???????????? ??????-->
					<div class="datail_top_btns">
						<input type="submit" value="????????????" id="btn1" /> 
						<input type="submit" value="????????????" id="btn2" />
					</div>
					<input type="hidden" name="pic1" id="pic1" value="${detailVO.pic1}" /> 
					<input type="hidden" value="${detailVO.price}" id="cost1" name="price">
					<input type="hidden" name="salePrice" id="salePrice" value= "<fmt:parseNumber value="${detailVO.price - (detailVO.price * (detailVO.discount/100))}"/>" />
				</form>
				</div><!-- ?????? ??? -->
			</div><!-- ?????????-??? -->
			<hr width="100%" color="black" size="1">
			<!--???-->
			<div class="tabmenu">
				<a href="${pageContext.request.contextPath}/detail/${detailVO.id}"><label for="tab1" id="detaillabel">????????????</label></a>
				<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}#detaillabel"><label for="tab2" style="color:#21A5B5;">??????</label></a>
				<a href="${pageContext.request.contextPath}/detail_qna/${detailVO.id}#detaillabel"><label for="tab3">????????????</label></a>
				<div id="content2">
<div id="reviewContainer">
    <div id="REVIEW">
        <h2>REVIEW</h2>
        <p>????????? ??????????????? ???????????????</p>
    </div> 
	

     <h3>REVIEW(${review.size()}???)</h3>
    <div class="Allstar">
        <div class="starsScore">
            <span id="star">???</span><span id="grade">${starGradeAvg}</span>
            <c:if test="${review.size() != 0}">
	         	<h3>
	        	   <fmt:parseNumber var="percent" value="${(starGradeCount[4] + starGradeCount[3] + starGradeCount[2]) /reviewCount * 100}" integerOnly="true" />
	         	   ${percent}%??? ???????????? ??? ????????? ???????????????</h3>
	           </c:if>
	           <c:if test="${review.size() == 0}">
	           	<h3> ?????? ????????? ?????? ???????????? ????????????</h3>
	           </c:if>
            <button id="writeReview" style="cursor : pointer;">?????? ?????? ????????????</button>
        </div>
        <div class="starsGrade">
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">?????? ?????????</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[4] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[4]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">?????? ?????????</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[3] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[3]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">???????????????&nbsp;</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[2] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[2]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">?????? ?????????</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[1] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[1]}</p>
            </div>
            <div class="starsGrade-detail">
                <p class="starsGrade-detail-p">????????????&nbsp;&nbsp;&nbsp;&nbsp;</p>
                <div class="starsBack">
                    <div class="starsfront" style="width: ${starGradeCount[0] / reviewCount * 100}%;"></div>
                </div>
                <p class="starsGrade-detail-p">${starGradeCount[0]}</p>
            </div>
        </div>
    </div>

		<div class="image">
			<span>
				<h3>??????(${picCount}???)</h3> <a href="#" id="allpic">?????? ?????? ????????????</a>
			</span>
			<div class="imgPreview">
				<c:forEach var="pic" items="${pic}">
						<img src="${pageContext.request.contextPath}/upload/${pic.pic1}" alt="">
				</c:forEach>
			</div>
		</div>
		
		<!-- ????????? ?????? -->
		<div class="review">
		<c:if test="${review.size() !=0 }">
	        <button id="recentDESC">?????????</button>
	        <button id="starDESC">?????????</button>
	        <button id="hitDESC">?????????</button>
		</c:if>
		<c:if test="${review.size() eq 0 }">
	      	<h6 style="text-align:center; padding-top:30px;">?????? ????????? ????????? ????????????</h6>
		</c:if>
        <c:forEach var="review" items="${review}">
        <div class="review-container">
            <div class="reviewContentBox">
                <p id="review-title">
                	<span class="title-star">
         			<c:forEach begin="1" end="${review.stargrade }">???</c:forEach>
         			</span>${review.title }</p>
                <div id="review-content"><p>${review.content }</p></div>
         	   <c:if test="${review.pic1 != null}">
              	  <img src="${pageContext.request.contextPath}/upload/${review.pic1}" alt="">
               </c:if>
         	   <c:if test="${review.pic2 != null}">
             	  <img src="${pageContext.request.contextPath}/upload/${review.pic2}" alt="">
               </c:if>
            </div>
				<div class="reviewComment">
					<p id="hits${review.id}" style="cursor:pointer;">???????? ????????????(${review.hits})</p>
					<p>	
					<!-- 	commentCount.id=review.id ????????????  -->
						<c:forEach var="count" items="${commentCount}">
							<c:if test="${count.reviewId eq review.id}">
								<a href="" class="commCount" id="commCount">????????????(${count.commentCount}???)</a>
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
								placeholder="????????? ???????????????"></textarea>
							<button id="commentInsert${review.id}">??????</button>
						</form>
					</div>
				</div>
				</div>
            </c:forEach>
    </div>
			<!-- =====================?????????========================== -->
            <div class="pageing">
			<c:choose>
				<c:when test="${review.size()==0 }">
					<span class="spanarrow">?????? &nbsp;</span>
					<span class="spanarrow"> ???&nbsp;</span>
					<span class="arrow" id="nowpage">&nbsp;1&nbsp;</span>
					<span class="spanarrow">&nbsp;??? </span>
					<span class="spanarrow">&nbsp; ??????</span>
				</c:when>
				<c:otherwise>
				<c:choose>
					<c:when test="${1 == page.nowPage}">
						<span class="spanarrow">?????? &nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits&page=1#hitDESC" class="arrow" id="prepre">??????  &nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${1 == page.nowPage}">
						<span class="spanarrow"> ???&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits&page=${page.nowPage - 1}#hitDESC"
							class="arrow" id="pre"> ???&nbsp;</a>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<c:choose>
						<c:when test="${page.nowPage eq i}">
							<span class="arrow" id="nowpage">&nbsp;${i}&nbsp;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits&page=${i}#hitDESC"
								class="arrow" style="color: #CBCBCB;" id="movePage">&nbsp;${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page.totalPage == page.nowPage}">
						<span class="spanarrow">&nbsp;??? </span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits&page=${page.nowPage + 1}#hitDESC"
							class="arrow" id="next">&nbsp;??? </a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.totalPage eq page.nowPage}">
						<span class="spanarrow">&nbsp; ??????</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits&page=${page.totalPage}#hitDESC"
							class="arrow" id="nextnext">&nbsp; ??????</a>
					</c:otherwise>
				</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
    
    <script>
    
    document.getElementById("writeReview").addEventListener("click", function() {
    	<% if(session.getAttribute("user") != null) {%>
				if(${authority.size() eq 1}) {
	    			location.href = "${pageContext.request.contextPath}/writeReview/${detailVO.id}?orderNum=${authority[0].orderNum}";		
				} else if(${authority.size() gt 1}) {
					window.open("${pageContext.request.contextPath}/selectOrderNum/${detailVO.id}", "_blank",`resizable=yes,left=500,top=150,width=900,height=450`);
				} else {
					alert("?????? ?????? ????????? ????????????.");
				}
    	<%} else {%>
   				alert("????????? ??? ???????????? ??? ????????????.");
   				location.href="${pageContext.request.contextPath}/loginpage";
   		<%} %>
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
				document.getElementById("hits${review.id}").innerHTML = '<b>???????? ????????????('+data+')<b>';	
			 });
	   		<%} else {%>
	   			alert("????????? ??? ???????????? ??? ????????????.");
   				location.href="${pageContext.request.contextPath}/loginpage";
	   		<%} %>
   		}); 
   		
   		document.getElementById("commentInsert${review.id}").addEventListener("click", function(e) {
   			e.preventDefault();

   			<%if (session.getAttribute("user") != null) {
				UserVO user = (UserVO) session.getAttribute("user");%>
   					if(document.getElementById("commentContent${review.id}").value==""
   							|| document.getElementById("commentContent${review.id}").value == null) {
   						alert("????????? ??????????????????");
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
							/* ???????????? ????????? */
							document.getElementById("commentContent${review.id}").value = "";
						});
			   		}
			<%} else {%>
				 alert("????????? ??? ???????????? ??? ????????????.");
	   			location.href="${pageContext.request.contextPath}/loginpage";
			<%}%>
   			
   		}); 
   	</c:forEach>
   	
   	document.getElementById("recentDESC").addEventListener("click", function() {
   		location.href = "${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=recent#recentDESC";
   	});
   	document.getElementById("starDESC").addEventListener("click", function() {
   		location.href = "${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=star#starDESC";
   	});
   	document.getElementById("hitDESC").addEventListener("click", function() {
   		location.href = "${pageContext.request.contextPath}/moveReview/${detailVO.id}?desc=hits#hitDESC";
   	});
    </script>
     
     
     <!-- ======================??????=============================== -->
    <div id="modal-overlay">
    <div id="modal">
    	<div id="photo">
    		<c:if test="${pic != null}">
    		 <c:forEach var="review" items="${pic}"  varStatus="status">
    		 	<a href="#" id="pic${status.count}" data-id="${review.id}"><img src="${pageContext.request.contextPath}/upload/${review.pic1}" /></a>
    		 </c:forEach>
    		 </c:if>
    		 <c:if test="${pic[0] == null}">
    		 	<p><b>?????? ????????? ??????????????? ????????????.</b></p>
    		 </c:if>
    	</div>
		<div id="review">
			<div id="review-productInfo">
                <div>
                    <h6>${detailVO.name}</h6>
                    <p><c:forEach begin="1" end="${starGradeAvg+((starGradeAvg%1>0.5)?(1-(starGradeAvg%1))%1:-(starGradeAvg%1))}"><span id="review-star">???</span></c:forEach>
                        ?????? ${reviewCount}???</p>
                </div>
				<div id="x">???</div>
			</div>
			<div id="image-box">
				<c:forEach var="review" items="${pic}">
					<a href="#"><img id="reviewInreview-img" src="${pageContext.request.contextPath}/upload/${review.pic1}" title="???????????? ?????? ????????? ???????????????"/></a>
				</c:forEach>
			</div>
			<c:if test ="${review[0].title != null}">
			<div id="reviewInreview">
				<p id="reviewInreview-star"><c:forEach begin="1" end="${review[0].stargrade}">???</c:forEach></p>
				<b>?????? : </b><p id="reviewInreview-title">${review[0].title}</p>
				<p id="reviewInreview-content">${review[0].content}</p>
			</div>
			</c:if>
		</div>
	</div>
	</div>
	
	
	<!-- ====================?????? ????????????=======================-->
	<div id="originPic-overlay">
		<div id="originPic">
			<h1 style="text-align:end;">???</h1>
			<img src="" id="originPic-img">
		</div>
	</div>
	
	<script>
	
	//?????? ????????????
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
 								star += "???";
 							}
 				
 							let src = this.children[0].getAttribute("src");
 							
 							document.getElementById("reviewInreview-img").src = src;
 							document.getElementById("reviewInreview-star").innerText = star;
 							document.getElementById("reviewInreview-title").innerText = data.title;
 							document.getElementById("reviewInreview-content").innerText = data.content;
 					}); 
 			 });
 			 
 		 }
 		 
 		  	 
 	 <%-- ????????? ???????????? ?????? ????????? ?????? ???????????? pic1??? ????????? ????????? 
 	 	<c:forEach var="review" items="${pic}" varStatus="status">
 	     
		 document.getElementById("pic${status.count}").addEventListener("click", function(e) {
			 e.preventDefault();
			 
			 let id = this.dataset.id;
			 
			 fetch("${pageContext.request.contextPath}/photoSelect/"+id)
				.then(response => response.json())
				.then(data => {
						let star = "";
						for(let i=0; i<data.stargrade; i++) {
							star += "???";
						}
						document.getElementById("reviewInreview-img").src = "${review.pic1}";
						document.getElementById("reviewInreview-star").innerText = star;
						document.getElementById("reviewInreview-title").innerText = data.title;
						document.getElementById("reviewInreview-content").innerText = data.content;
				});
		 });
 		
	 <%--</c:forEach>--%>
 	 });
	 
	 	//?????? ????????????
		 document.getElementById("reviewInreview-img").addEventListener("click", function(e) {
			 e.preventDefault();
		        document.getElementById("originPic-overlay").style.display = "flex";
		        document.getElementById("originPic-img").src = document.getElementById("reviewInreview-img").src;
		        document.getElementById("originPic").style.display = "block";
		  });	 

		 //?????? ???????????? ??????(x??????, ESC)
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
	
$(document).ready(function(){
	
	var move_product_qna = '${move_product_qna}';
	if ( move_product_qna ) {
		$('#tab3').click();	
	}
});
	// ???????????? ??????
	$("#select_color option:eq(1)").prop("selected",true);
	$("#select_color option:eq(2)").prop("selected",true);

	// ?????????????????? 
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
	
	// ???????????? ??????
	$("#btn1").click(function(e) {
		e.preventDefault();
		var id = $("#id").val();
		var count = $("#select_count").val();
		var size = $("#select_size").val();
		var color = $("#select_color").val();
		var itemName = $("#itemName").val();
		var proNum = $("#code").val();
		var discount = $("#discount").val();
		var price = $("#cost1").val();
		var pic1 = $("#pic1").val();
		
		
		console.log("id : " + id);
		console.log("count : " + count);
		console.log("size : " + size);
		console.log("color : " + color);
		console.log("itemName : " + itemName);
		console.log("proNum : " + proNum);
		console.log("discount : " + discount);
		console.log("price : " + price);
		console.log("pic1 : " + pic1);
		

		var data = {
			id : id,
			count : count,
			size : size,
			color : color,
			itemName : itemName,
			proNum : proNum,
			discount : discount,
			price : price,
			pic1 : pic1
			
		};

		$.ajax({
			url : "${pageContext.request.contextPath}/detailcart",
			type : "post",
			data : data,
			success : function(result) {
				if(result ==1){
					if(confirm("??????????????? ??????????????????????")){
						alert("??????????????? ???????????????.");
						$("#select_count").val("1");
						if(confirm("??????????????? ?????????????????????????")){
							cancelButton:'?????????'
							location.href = "${pageContext.request.contextPath}/cart/${user.userid}";
						}
					}
				} else{
					alert("????????? ??? ??????????????????.");
					$("#select_count").val("1");
				}
				},
				error : function() {
				alert("??????????????? ?????? ??? ????????????.");
			}
		});
	});
	
	// ???????????? ??????
	document.getElementById("btn2").addEventListener("click",function(e){
		e.preventDefault();
		if("${sessionScope.user.userid}" == "") {
			alert("????????? ??? ??????????????????.");
		} else {
			if(confirm("?????? ?????????????????????????")){
				document.getElementById("now-buy").submit();
			}
		}
	});
	
	
	// ??????????????? div???
	document.querySelector("select[name='count']").addEventListener("change", function(){
		let size = document.getElementById("select_size");
		let color = document.getElementById("select_color");
		let count = document.getElementById("select_count").value;
		let price = document.getElementById("price1").value;
		
		//html ????????? ?????? ??????
		$('.optionSize').remove();
		var html = '';
		html += '<div class="optionSize">????????? : ${detailVO.name}<div>';
		if(size != null){
			html += '<div class="optionSize">????????? : '+ size.value +'</div>';
		}
		if(color != null){
			html += '<div class="optionSize">?????? : '+ color.value +'</div>';
		}
		html += '<div class="optionSize">?????? : '+ count +'</div>';
		html += '<div class="optionSize">??? ?????? : ???'+(price*count).toLocaleString()+'</div>';
		console.log(price);
		console.log(count);
		console.log(parseFloat(price*count));
		
		$('#selectoption').append(html);
		
		 $(".optionSize").css("width", 500);
		
	});
	
	// ??????????????? ??? ??????select???
	$( "#select_size" ).change(function() {
		  $('#select_color').empty();
		  let??option??=??$("<option value='????????????'>-????????????-</option>");????????????????????????????????
		  $('#select_color').append(option);
		$.ajax({
			url : "${pageContext.request.contextPath}/colorbyidandsize",
			type : "post",
			data : {id: $("#proid").val(), size: $("#select_size").val()},
			success : function(result) {
				result.forEach(function(item) {
					let??option??=??$("<option value='"+item+"'>"+item+"</option>");????????????????????????????????
					$('#select_color').append(option);
				});
			},
			error : function() {
				alert("???????????????. ???????????? ??? ????????????.");
			}
		});	  
	});
	
	//???????????? ??? ???????????? ?????????
	$( "#select_color" ).change(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/pronumbysizeandcolor",
			type : "post",
			data : {id: $("#proid").val(), size: $("#select_size").val(), color: $("#select_color").val()},
			success : function(result) {
				console.log(result);
				$("#code").val(result).prop("selected", true);
			},
			error : function() {
				alert("???????????????. ???????????? ??? ????????????.");
			}
		});	  
	});

	</script>

</body>
</html>