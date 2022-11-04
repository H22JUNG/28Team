<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        main {
            background-color: white;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            gap: 30px;
            min-width: 1200px;
        }
        #review-box h2 {
            text-align: start;
            padding : 10px 0;
        }
        table {
            border-top: 3px solid gray;
            border-bottom: 1px solid gray;
            border-collapse: collapse;
            width: 60vw;
            margin-bottom: 20px;
        }
        table tr>td {
            padding: 10px;
            border-bottom: 1px solid gray;
        }
        table tr>td:nth-child(1) {
            text-align: center;
            border-right: 1px solid gray;
        }
        table tr>td:nth-child(2) {
            width: 80%;
        }
        table tr:nth-child(5)>td:nth-child(2) {
            height: 50vh;

        }
        table input {
            border: none;
            width: 100%;
            height: 100%;
            outline: none;
            background: #fff;
        }
        table textarea {
            border: none;
            outline: none;
            resize: none;
        }
        #btn {
            text-align: end;
        }
        #btn button {
            width: 100px;
            height: 50px;
            font-size: 16px;
            font-weight: 550;
            background: linear-gradient(90deg, #21A5B5 0%, #71B2B4 100%);
            border-radius: 20px;
            border: none;
            cursor: pointer;
            color: white;
        }
        label {
            font-size: 13px;
        }
        select {
            color: #21A5B5;
            font-size: 20px;
            outline: none;
            border: none;
        }
        option {
            color: #21A5B5;
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
        	width : 60%;
        	align-items : center;
        }
        #file1 #defile1, #file2 #defile2 {
        	width : 90px;
        	height: 30px;
        }
        #file2 {
        	display : none;
        }
    </style>
</head>
<body>

    <jsp:include page="../header.jsp"></jsp:include>
    <main>
        <div id="review-box">
            <h2>리뷰를 작성해주세요</h2>

			<form:form modelAttribute="revo" action="${pageContext.request.contextPath}/writeReviewDone/${proVO.id}" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>상품명</td>
                    <td>${proVO.name}</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <td>별 점</td>
                    <td>
                         <form:select path="stargrade">
                            <form:option value="5">★★★★★</form:option>
                            <form:option value="4">★★★★☆</form:option>
                            <form:option value="3">★★★☆☆</form:option>
                            <form:option value="2">★★☆☆☆</form:option>
                            <form:option value="1">★☆☆☆☆</form:option>
                        </form:select> 
                        <label for="stargrade">별점을 선택해주세요</label>
                        
                    </td>
                </tr>
                <tr>
                    <td>제 목</td>
                    <td><form:input path="title" type="text" placeholder="리뷰 제목을 입력해주세요"  required="required"/></td>
                </tr>
                <tr>
                    <td>내 용</td>
                    <td><form:textarea path="content" cols="85" rows="25" placeholder="리뷰 내용을 입력해주세요"  required="required"></form:textarea></td>
                </tr>
                <tr>
                    <td>사진첨부</td>
                    <td>
                        <label for="file">최대 2MB, 2개까지 첨부 가능합니다. (이미지 파일만 업로드 가능)</label><br />
                        <div id="file1">
                       		<form:input type="file" path="pic1File" accept="image/*" /> <button id="defile1">파일 삭제</button>
                        </div>
                        <button id="fileadd">파일 추가</button>
                        <div id="file2">
                      		<form:input type="file" path="pic2File" accept="image/*"/> <button id="defile2">파일 삭제</button>
                    	</div>
                    </td>
                </tr>
            </table>
            <div id="btn">
                <button id="write">등 록</button>
            </div>
            </form:form>

        </div>
    </main>
     <jsp:include page="../footer.jsp"></jsp:include>
     <script>
   	  document.getElementById("fileadd").addEventListener("click", function(e){
   		e.preventDefault();
   		document.getElementById("file2").style.display = "flex";
   		document.getElementById("fileadd").style.display = "none";
   	  });
   	  
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