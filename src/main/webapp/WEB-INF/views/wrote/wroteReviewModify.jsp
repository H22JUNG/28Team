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
        	flex-direction : column;
        	border : 1px solid #21A5B5;
        	margin : 10px 0;
        	padding : 10px;
        	border-radius : 5px;
        	width : 45%;
        	align-items : start;
        }
        #file1 #defile1, #file2 #defile2 {
        	width : 90px;
        	height: 30px;
        }
        #pic1del, #pic2del {
        	margin : 0px 0px 10px 0px;
        	padding : 1px 5px;
        }
        #pic1, #pic2 {
        	border :none;
        	outline: none;
        	padding : 0;
 			height : 20px;
 			font-size : 14px;
        }
    </style>
</head>
<body>
    <header>
         <jsp:include page="../header.jsp"></jsp:include>
    </header>
    <div id="coverContainer">
      <div id="container">
			
			<h2>${detail.category}</h2>
			<form:form modelAttribute="detail" action="${pageContext.request.contextPath}/modify?category=${detail.category}&id=${detail.id}" method="post" enctype="multipart/form-data">
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
                        <label for="file">최대 2MB, 2개까지 첨부 가능합니다. (이미지 파일만 업로드 가능)</label><br />
	                    <div id="file1">
	                    	<div>
	                    		<p>첨부된 이미지 : <form:input type="text" value="${detail.pic1}" path="pic1" readonly="readonly"/></p>
	                       	</div>
	                        <div>
	                       		 <form:input type="file" path="pic1File" accept="image/*" /> <button id="defile1">파일 삭제</button>
	                        </div>
	                    </div>
	                    <div id="file2">
	                    	<div>
	                   	 		<p>첨부된 이미지 : <form:input type="text" value="${detail.pic2}" path="pic2" readonly="readonly"/></p>
	                    	</div>
	                    	<div>
	                      		<form:input type="file" path="pic2File" accept="image/*"/> <button id="defile2">파일 삭제</button>
	                        </div>
	                    </div>
                    </td>
				</tr>
			</table>
			<div id="btn">
				<button id="exit">취 소</button>
				<button id="modify">수 정</button>
			</div>
			</form:form>
        </div>
    </div>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
    </footer>
      <script>
    	const maxSize = 2 * 1024 * 1024;
     // pic1File에 파일 추가가 되면 input태그 value를 그 값으로 바꾸기
    	document.getElementById("pic1File").onchange = function(){
    	    //사진 용량검사
    	    if(document.getElementById("pic1File").files[0].size > maxSize) {
    	    	alert("파일 용량을 확인해주세요.");
    	    	document.getElementById("pic1File").value = null;
    	    }    	 
    		if(document.getElementById("pic1File").value != null) {
    			document.getElementById("pic1").value= document.getElementById("pic1File").value;
    		} else {
    			document.getElementById("pic1").value = null;
    		}
    	};
    	document.getElementById("pic2File").onchange = function(){
    	    if(document.getElementById("pic2File").files[0].size > maxSize) {
    	    	alert("파일 용량을 확인해주세요.");
    	    	document.getElementById("pic2File").value = null;
    	    }  
    		if(document.getElementById("pic2File").value != null) {
    			document.getElementById("pic2").value = document.getElementById("pic2File").value;
    		} else {
    			document.getElementById("pic2").value = null;
    		}
    	};
      
    //파일 삭제버튼 누르면 값 없애기
	  document.getElementById("defile1").addEventListener("click", function(e){
	  	e.preventDefault();
	  	document.getElementById("pic1").value = null;
	  	document.getElementById("pic1File").value = null;
	  	
	  });
	  document.getElementById("defile2").addEventListener("click", function(e){
	  	e.preventDefault();
		document.getElementById("pic2").value = null;
	  	document.getElementById("pic2File").value = null;
	  });
      
      //뒤로가기
      document.getElementById("exit").addEventListener("click", function(e){
	  	 	e.preventDefault();
	  	 	window.history.back();
  	  });
      

     </script>
</body>
</html>