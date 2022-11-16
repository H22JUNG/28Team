<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
            height : 90%;
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
        #title {
            width: 80%;
            height: 35px;
            border: none;
            border-bottom: 1px solid #21A5B5;
        }
        #content {
            width: 80%;
            height: 400px;
            border: none;
            border: 1px solid #21A5B5;
        }
        input:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="../header.jsp"></jsp:include>
    </header>
    <div id="coverContainer">
      <div id="container">
			
			<h2>${qnamodi.category}</h2>
			<form:form modelAttribute="qnamodi" action="${pageContext.request.contextPath}/modifyQnA?category=${qnamodi.category}&id=${qnamodi.id}" method="post">
			<table>
				<tr>
					<td>문의유형</td>
					<td>${qnamodi.qnaCategory}</td>
				</tr>
				<c:if test="${not empty proName}">
				<tr>
					<td>상품명</td>
					<td>${proName}</td>
				</tr>
				</c:if>
				<tr>
					<td>제목</td>
					<td><form:input type="text" path="title" /></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${qnamodi.owner}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${qnamodi.createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><form:textarea type="text" path="content"/></td>
				</tr>
			</table>
			<div id="btn">
				<button id="modify">수 정</button>
			</div>
			</form:form>
			
        </div>
    </div>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
    </footer>
</body>
</html>