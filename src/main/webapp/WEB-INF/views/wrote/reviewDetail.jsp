<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        #coverContainer{
            position: relative;
            top: 33%;
            width: 100%;
            justify-content: center;
            align-items: center;
            padding: 20px;
            min-width: 1200px;
        }
        #container {
            margin: 0 auto;
            width: 90%;
            max-width: 1400px;
            background-color: white;
            padding : 30px;
        }
        h2{
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 3px solid #21A5B5;
        }
        table {
            border-collapse: collapse;
        }
        td {
            border-bottom: 1px solid #CBCBCB;
            padding: 20px;
            width : 90%;
        }
        table tr td:first-child{
            width: 180px;
            font-weight: 900;
        }
        table tr:last-child td:last-child{
            height : 30vh; 
        }
        #btn {
            padding: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 20px;
        }
        #btn button {
            width: 100px;
            height: 50px;
            font-size: 16px;
            font-weight: 600;
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            border-radius: 15px;
            border: none;
            cursor: pointer;
            color: white;
        }
        /* 푸터 */
        footer {
            width: 100%;
            background-color: #FFECC8;
            z-index: 10;
            font-size: 12px;
            padding: 20px 40px;
            color: #848484;
            display: flex;
        }
        .footer1 {
            width: 70%;
            border-right: 1px solid #848484;
        }
        footer p:nth-child(1) {
            font-size: 15px;
            color: #2C2C2C;
        }
        footer p:nth-child(2) {
            font-size: 15px;
        }
        #footer-tel {
            color:#21A5B5;
            font-size: 25px;
            font-weight: 900;
        }
        footer ul {
            display: flex;
        }
        footer ul li {
            padding: 10px 20px 0 0;
        }
        .footer2 {
            width: 30%;
            align-self: center;
            display: flex;
            justify-content: center;
        }
        .footer2 img{
            width: 50px;
            height: 50px;
            margin: 15px;
            cursor: pointer;
        }
        #comment-container{
        	padding : 30px;
        	border-top : 3px solid #21A5B5;
        }
        #comment-container b{
        	padding : 10px 0 20px 0;
        	margin : 10px;
        	display : block;
        }
        .comment {
        	padding : 10px;
        	border-top : 1px solid gray;
        	min-height : 50px;
        }
        .comment:last-child {
        	border-bottom : 1px solid gray;
        }
        #reviewPhoto img{
        	width : 220px;
        	height : 220px;
        	padding : 10px;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"></jsp:include>
    </header>
    <div id="coverContainer">
      <div id="container">
			<h2>QnA</h2>
			<table>
				<c:if test="${not empty proName}">
				<tr>
					<td>상품명</td>
					<td>${proName}</td>
				</tr>
				</c:if>
				<tr>
					<td>제목</td>
					<td>${detail.title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${detail.owner}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${detail.createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${detail.content}</td>
				</tr>
				<tr>
					<td>사진</td>
					<td id="reviewPhoto"><img src="${pageContext.request.contextPath}/upload/${detail.pic1}" alt="" /><img src="${pageContext.request.contextPath}/upload/${detail.pic2}" alt="" /></td>
				</tr>
			</table>
			<c:if test="${not empty comment}">
			<div id="comment-container">
				<b>해당 리뷰에 달린 댓글입니다</b>
				<c:forEach var="comm" items="${comment}">
				<div class="comment">
					<p><span style="color:#21A5B5;"> ➥ </span>${comm.username } : ${comm.commContent}</p>
				</div>
				</c:forEach>
			</div>
			</c:if>
			<div id="btn">
				<form action="${pageContext.request.contextPath}/list" method="post">
					<button>목 록</button>
				</form>
				<form action="/delete" method="post">
					<button id="delete">삭 제</button>
				</form>
				<form action="/modify" method="post">
					<button id="modify">수 정</button>
				</form>
			</div>
        </div>
    </div>
   	 <script>
         document.getElementById("delete").addEventListener("click", function(e){
           e.preventDefault();
            if(confirm("게시글을 삭제하시겠습니까?")){
                location.href = "${pageContext.request.contextPath}/delete/${detail.id}?category=${detail.category}";
            }
        });
        document.getElementById("modify").addEventListener("click", function(e){
            e.preventDefault();
                location.href = "${pageContext.request.contextPath}/reviewModify/${detail.id}";
        });
    </script>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
    </footer>
</body>
</html>