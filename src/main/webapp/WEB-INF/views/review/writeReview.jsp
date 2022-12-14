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
        table tr:nth-child(6)>td:nth-child(2) {
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
            <h2>????????? ??????????????????</h2>

			<form:form modelAttribute="revo" action="${pageContext.request.contextPath}/writeReviewDone/${proVO.id}" method="post" enctype="multipart/form-data">
            <table>
            	<tr>
            		<td>????????????</td>
            		<td><form:input path="orderNum" type="text" readonly="true" value="${orderNum}"></form:input></td>
            	</tr>
                <tr>
                    <td>?????????</td>
                    <td><form:input path="itemName" type="text" readonly="true" value="${proVO.name}"></form:input></td>
                </tr>
                <tr>
                    <td>?????????</td>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <td>??? ???</td>
                    <td>
                         <form:select path="stargrade">
                            <form:option value="5">???????????????</form:option>
                            <form:option value="4">???????????????</form:option>
                            <form:option value="3">???????????????</form:option>
                            <form:option value="2">???????????????</form:option>
                            <form:option value="1">???????????????</form:option>
                        </form:select> 
                        <label for="stargrade">????????? ??????????????????</label>
                        
                    </td>
                </tr>
                <tr>
                    <td>??? ???</td>
                    <td><form:input path="title" type="text" placeholder="?????? ????????? ??????????????????"  required="required"/></td>
                </tr>
                <tr>
                    <td>??? ???</td>
                    <td><form:textarea path="content" cols="85" rows="25" placeholder="?????? ????????? ??????????????????"  required="required"></form:textarea></td>
                </tr>
                <tr>
                    <td>????????????</td>
                    <td>
                        <label for="file">?????? 2MB, 2????????? ?????? ???????????????. (????????? ????????? ????????? ??????)</label><br />
                        <div id="file1">
                       		<form:input type="file" path="pic1File" accept="image/*" /> <button id="defile1">?????? ??????</button>
                        </div>
                        <button id="fileadd">?????? ??????</button>
                        <div id="file2">
                      		<form:input type="file" path="pic2File" accept="image/*"/> <button id="defile2">?????? ??????</button>
                    	</div>
                    </td>
                </tr>
            </table>
            <div id="btn">
                <button id="write">??? ???</button>
            </div>
            </form:form>

        </div>
    </main>
     <jsp:include page="../footer.jsp"></jsp:include>
     <script>
     const maxSize = 2 * 1024 * 1024;
     document.getElementById("pic1File").onchange = function(){
 	    //?????? ????????????
 	    if(document.getElementById("pic1File").files[0].size > maxSize) {
 	    	alert("?????? ????????? ??????????????????.");
 	    	document.getElementById("pic1File").value = null;
 	    }    	 
     };
     document.getElementById("pic2File").onchange = function(){
 	    //?????? ????????????
 	    if(document.getElementById("pic2File").files[0].size > maxSize) {
 	    	alert("?????? ????????? ??????????????????.");
 	    	document.getElementById("pic2File").value = null;
 	    }    	 
     };
     
     
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