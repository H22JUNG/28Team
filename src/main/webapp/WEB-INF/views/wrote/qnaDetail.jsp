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
        .re-qna-container {
      		display: flex;
        }
        .re-qna-container h3{
      		color : #21A5B5;
      		padding : 20px;
        }
        .re-qna {
        	border-top : 1px solid #21A5B5;
        	width : 60%;
        	padding : 10px;
        	margin-top : 10px;
        }
        .re-qna td {
        	padding : 10px;
        }
        .re-qna table {
        	width:100%;
        }
        .re-qna table tr td:first-child {
        	width:17%;
        }
        h4 {
       		padding : 20px 0 10px 65px;
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
				<tr>
					<td>문의유형</td>
					<td>${detail[0].qnaCategory}</td>
				</tr>
				<c:if test="${not empty proName}">
				<tr>
					<td>상품명</td>
					<td>${proName}</td>
				</tr>
				</c:if>
				<tr>
					<td>제목</td>
					<td>${detail[0].title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${detail[0].owner }</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${detail[0].createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${detail[0].content}</td>
				</tr>
			</table>
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
         <c:if test="${detail.size() > 1}">
			 <h4>이 글에 달린 답변입니다.</h4>
			 <c:forEach var="detail" items="${detail}" begin="1">
			 	<div class="re-qna-container">
				<h3>➥</h3>
				<div class="re-qna">
				<table>
				<tr>
					<td>제목</td>
					<td>${detail.title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${detail.owner }</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${detail.createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${detail.content}</td>
				</tr>
				</table>
				</div>
				</div>
			 </c:forEach>
		</c:if>
        </div>
    </div>
   	 <script>
         document.getElementById("delete").addEventListener("click", function(e){
           e.preventDefault();
            if(confirm("게시글을 삭제하시겠습니까?")){
                location.href = "${pageContext.request.contextPath}/delete/${detail[0].id}?category=${detail[0].category}";
            }
        });
        document.getElementById("modify").addEventListener("click", function(e){
            e.preventDefault();
                location.href = "${pageContext.request.contextPath}/qnaModify/${detail[0].id}";
        });
    </script>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
    </footer>
</body>
</html>