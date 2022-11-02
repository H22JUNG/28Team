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
            height : 400px; 
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
        #container p{
        	text-align :center;
        }
    </style>
</head>
<body>
    <header>
         <jsp:include page="../header.jsp"></jsp:include>
    </header>
    <div id="coverContainer">
      <div id="container">
			<p>작성한 게시글에 달린 답변입니다</p>
			<h2>${detail.category}</h2>
			<table>
				<tr>
					<td>문의유형</td>
					<td>${detail.qnaCategory}</td>
				</tr>
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
			<div id="btn">
				<form action="${pageContext.request.contextPath}/list" method="post">
					<button>목 록</button>
				</form>
			</div>
        </div>
    </div>

	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
    </footer>
</body>
</html>