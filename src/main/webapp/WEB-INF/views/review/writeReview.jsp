<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>

    <jsp:include page="../header.jsp"></jsp:include>
    <main>
        <div id="review-box">
            <h2>리뷰를 작성해주세요</h2>

			<form action="${pageContext.request.contextPath}/리뷰쓰고 전송" method="post">
            <table>
                <tr>
                    <td>상품명</td>
                    <td>이거 샀어요</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>작성자에요</td>
                </tr>
                <tr>
                    <td>별 점</td>
                    <td>
                        <select>
                            <option value="5" selected>★★★★★</option>
                            <option value="4">★★★★☆</option>
                            <option value="3">★★★☆☆</option>
                            <option value="2">★★☆☆☆</option>
                            <option value="1">★☆☆☆☆</option>
                        </select>
                        <label for="star">별점을 선택해주세요</label>
                        
                    </td>
                </tr>
                <tr>
                    <td>제 목</td>
                    <td><input type="text" placeholder="리뷰 제목을 입력해주세요" /></td>
                </tr>
                <tr>
                    <td>내 용</td>
                    <td><textarea name="" id="" cols="85" rows="25" placeholder="리뷰 내용을 입력해주세요"></textarea></td>
                </tr>
                <tr>
                    <td>사진첨부</td>
                    <td>
                        <label for="file">최대 2개까지 첨부 가능합니다.</label>
                        <input type="file" name="file"/>
                    </td>
                </tr>
            </table>
            <div id="btn">
                <button id="write">등 록</button>
            </div>
            </form>

        </div>
    </main>
     <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>