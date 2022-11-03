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
        table tr:nth-child(4) td:nth-child(4){
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
        #pic1File, #pic2File {
        	padding : 10px 0;
        }
        #fileadd {
        	padding : 1px 6px;
        }
        #file1, #file2 {
        	display : flex;
        	border : 1px solid #21A5B5;
        	margin : 10px 0;
        	padding : 0 10px;
        	border-radius : 5px;
        	width : 31%;
        	align-items : center;
        }
        #file1 #defile1, #file2 #defile2 {
        	width : 90px;
        	height: 30px;
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
			<form:form modelAttribute="detail" action="${pageContext.request.contextPath}/modify?category=${detail.category}&id=${detail.id}" method="post">
			<table>
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
					<td>${detail.owner}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td>${detail.createDate}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><form:textarea type="text" path="content"/></td>
				</tr>
				<tr>
					<td>사진첨부</td>
					<td>
                        <label for="file">최대 2개까지 첨부 가능합니다. (이미지 파일만 업로드 가능)</label><br />
	                    <div id="file1">
	                       <form:input type="file" path="pic1File" accept="image/*" /> <button id="defile1">파일 삭제</button>
	                    </div>
	                    <div id="file2">
	                        <form:input type="file" path="pic2File" accept="image/*"/> <button id="defile2">파일 삭제</button>
	                    </div>
                    </td>
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
      <script>
	  document.getElementById("defile1").addEventListener("click", function(e){
	  	e.preventDefault();
	  	document.getElementById("pic1File").value = null;
	  });
	  document.getElementById("defile2").addEventListener("click", function(e){
	  	e.preventDefault();
	  	document.getElementById("pic2File").value = null;
	  });
     </script>
</body>
</html>