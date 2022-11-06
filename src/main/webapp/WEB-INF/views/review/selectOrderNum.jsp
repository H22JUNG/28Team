<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
        main {
            background-color: white;
        }
        #selectReview-container {
            width: 95%;
            margin: 0 auto;
            border: 3px solid #21A5B5;
            border-radius: 30px;
            padding: 0 10px 20px 10px;
        }
        #selectReview-container h3 {
            text-align: center;
            color: grey;
        }
        .selectReview {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px;
            border: 1px solid #71B2B4;
            border-radius: 30px;
            margin-bottom: 10px;
        }
        .selectReview-radio {
            padding: 5px;
            max-width: 180px;
            min-width: 190px;
        }
        .ordernum {
            color: blue;
            text-decoration: underline;
        }
        .selectReview-table {
            padding: 5px;
            border-left: 1px solid #71B2B4;
            width: 70%;
        }
        table tr>td {
            padding: 5px;
        }
        table tr>td:nth-child(1) {
            color: gray;
            text-align: end;
        }
        #btn {
            text-align: center;
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
</style>
</head>
<body>
    <main>
        <div id="selectReview-container">
            <h3>리뷰를 작성하실 주문번호를 선택해주세요</h3>
            <form action="#" method="get">
            	<c:forEach var="detail" items="${detail}">
                <div class="selectReview">
                    <div class="selectReview-radio">
                        <input type="radio" name="orderNum" id="${detail.orderNum}" value="${detail.orderNum}">
                        <label for="${detail.orderNum}">주문번호<br><span class="ordernum">${detail.orderNum}</span></label>
                    </div>
                    <div class="selectReview-table">
                        <table>
                            <tr>
                                <td>주문날짜</td>
                                <td>${detail.orderDate}</td>
                            </tr>

                            <tr>
                                <td>해당 상품명</td>
                                <td>${proVO.name}</td>
                            </tr>
                            <tr>
                                <td>총 주문금액</td>
                                <td>${detail.totalPrice}</td>
                            </tr>
                            <tr>
                                <td>결제방법</td>
                                <td>
	                                <c:choose>
		                                <c:when test="${detail.pay eq 'cash'}">
		                               		무통장입금
		                                </c:when>
										<c:otherwise>
											카드
										</c:otherwise>
	                                </c:choose>                 
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </c:forEach>
                <div id="btn">
                    <button id="write">등 록</button>
                </div>
            </form>
        </div>
    </main>
    <script>
  		document.getElementById("write").addEventListener("click", function(e) {
  			e.preventDefault();
  			let num = document.querySelector('input[name="orderNum"]:checked').value;
  			opener.location.href = "${pageContext.request.contextPath}/writeReview/${id}?orderNum=" + num;
  			window.close();
  		});
    </script>
</body>
</html>