<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
 <style>

        #coverContainer{
            background-color:#FFF7E7;
            width: 100%;
            position: relative;
            top: 33%;
            padding-top: 2%;
        }

        #container {
            margin: 0 auto;
            width: 90%;
            max-width: 1400px;
            background-color: white;
            display: flex;
            justify-content: center;
            /* align-items: center; */
            padding-top: 2%;
            padding-bottom: 2%;
            gap: 20px;
          
        }
        #container form {
		display: flex;
    	justify-content: center;
		gap : 20px;
		}

        .itembox {
            border-bottom: 2px solid #71B2B4;
            padding: 10px 0;
            width: 100%;
        }
        .smallItembox{
            display: flex;
            align-items: center;
            width: 100%;
        }
        .itemboxText{
            flex: 1;
        }
        .delete{
            float: right;
        }
        

        .itemImage img {
            width: 100px;
            height : 130px;
        }

        .itemImage {
            margin: 0px 10px;
        }

        #right {
            width: 350px;
            height: 500px;
            border: 1px solid white;
        }

        .number {
            width: 40px;
            border-style: none;
        }

        .btn1 {
            background-color: white;
            border: 2px solid #fff7e7;
            width: 25px;
            height: 25px;
            border-radius: 10px 10px;
            cursor: pointer;
        }
        #infor{
            margin: 20px 0;
        }

        .inforInput {
            border-style: none;
            background-color: #D9D9D9;
            width: 250px;
            height: 40px;
            margin: 10px 0;
            border-radius: 10px 10px;
            padding-left: 10px;
        }
        #postcode{
            background-color: #D9D9D9;
            border : 2px solid #D9D9D9;
            margin-left: 5px;
            border-radius: 5px 5px;
        }
        #addBtn{
            background-color:#71B2B4;
            border: 1px solid #71B2B4;
            color: white;
            border-radius: 5px 5px;
            font-size: 12px;
            cursor: pointer;
        }
        #address{
            width: 70%;
        }

        .checkItems {
            border-bottom: 2px solid#71B2B4;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        label{
            display: block;
            border-bottom: 2px solid #71B2B4;
            padding:15px 0;
        }
        #selectPay p{
            font-size: 11px;
        }
        #messageContainer{
            margin: 15px 0;
        }
        #message{
            resize: none; 
            
        }
        #point{
            text-align: right;
        }
        #allPay{
            width: 100%;
            background-color:  #71B2B4;
            height: 60px;
            border-radius: 20px 20px;
            margin-top: 10px;
            align-items: center;
            display: flex;
            padding-left: 20px;
            color: white;
        }
        #rightPrice{
            
            border: 2px solid #71B2B4;
            height: 300px; 
            border-radius: 20px 20px;
            justify-content: center;
            align-items: center;
            display: flex;
            flex-direction: column;
            gap: 15px;
            
        }
        #nowButton{
            background-color: #71B2B4;
            color: white;
            font-size: 18px;
            font-style: bold;
            border: 2px solid #71B2B4;
            border-radius: 15px 15px;
            width: 300px;
            height: 60px;
        }
        #nowButton:hover{
            font-size: 22px;
            cursor: pointer;
        }
        #rightBottom {
	border: 2px solid #71B2B4;
	border-radius: 20px 20px;
	height: 120px;
	margin-top: 20px;
	font-size:12px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding:0 10px;
	}
	#rightBottom div{
	display:inline-block;
	width:130px;
	height:20px;
	}
	#rightBottom h4{
	display:inline-block;
	}
	#userPointDiv{
	display:flex;
	}

        @media  (max-width : 700px){
            *{
                box-sizing: content-box;
            }
            #container form{
                flex-direction: column;

            }
          
            .infor{
                flex-direction: column;
             
            }
            .inforBox{
                flex-direction: column;
                display: flex;
                padding: 20px 5%;
                
            }
            .inforBox input{
                width: 400px;
            }
            .checkItems{
                padding-left: 20px;
            }
            #selectPayForm{
                padding-left: 5%;
            }
            #message{
                width: 100%;
            }
            #allPay {
                width: 70%;
                margin-left: 10%;
            }
            #right{
                margin-left: 20%;
            }
             #postcode{
                width: 100px;
            }
            #addBtn{
                width: 50px;
            }
        }
        @media (max-width:500px) {
            #right{
                margin-left: 10%;
            }
        }
        
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div id="coverContainer">
    <div id="container">
    <form action="${pageContext.request.contextPath}/InforController" method="get" id="payform">
        <div class="left">
            <div id="top">
            	<c:forEach var="vo" items="${sessionScope.cartList}">
						<div class="itembox">
							<div class="smallItembox">
								<div class="itemImage">
									<img
										src="${vo.pic1}">
								</div>
								<div class="itemboxText">
									<h4>상품 이름 : ${vo.itemName}</h4>
									<p>Size : ${vo.size}</p> <p>Color : ${vo.color}</p>
									<h4>상품 수량 : ${vo.count}</h4>
									<h4>상품 가격 : ${vo.price}</h4>
								</div>
							</div>
						</div>
					</c:forEach>
            </div>
            <!--여기까지 top끝-->
             <div id="infor">
               <h3>고객 정보 입력</h3>
				<div class="inforBox">
					<div>
						<input type="text" id="postcode" placeholder="우편번호">
						<input type="button" onclick="execDaumPostcode()"
						  value="우편번호 찾기" id="addBtn"><br>
					</div>
					주소<input type="text" class="inforInput" required id="address" name="address" placeholder="주소"><br> 
					상세 주소<input type="text" class="inforInput" id="detailAddress" name="detailAddress" required placeholder="상세주소를 입력해주세요"> 
					<input type="text" name="extraAddress" id="extraAddress" placeholder="(동, 건물)" class="inforInput">
				</div>
				<div class="inforBox">
					주문자 <input type="text" id="ordername" class="inforInput" placeholder="이름을 입력해주세요"required name="orderName" > 
					연락처 <input type="text" id="orderTel" class="inforInput" placeholder="숫자로만 입력해주세요" required name="orderTel" >
				</div>
            <!--여기까지 infor끝-->
            <div id="checkItem">
             <h3>결제 목록</h3>
				<c:set var="total" value="0"/>
				<c:forEach var="vo" items="${sessionScope.cartList}">
				<div class="checkItems">
					<h4>${vo.itemName}</h4>
					<p>${vo.price}</p>
					<p>수량 : ${vo.count}</p>
					<p>${vo.size}</p><p>${vo.color}</p>
				</div>
				<c:set var="total" value="${total+vo.price*(vo.count)}"/>
				</c:forEach>
            </div>
            <!--여기까지 결제 할 물건 -->
            <div id="selectPay">
                <h3>결제 방법 선택</h3>
               <label for="cash">무통장입금<input type="radio" class="pay"
						name="pay" value="cash" id="cash"></label> <label for="card">카드결제<input
						type="radio" class="pay" name="pay" value="card" id="card"></label>
					<p>사용가능 적립금 :${user.point}</p>
					
					<label for="point">사용할 적립금 <input type="text" class="pay" id="point" name="point" onkeyup='printName()' value="0" autocomplete="off"></label>
            </div>
            <!--여기 까지 결제 할 물건-->
            <div id="messageContainer">
              	<h3>배송 요청 사항</h3>
				<textarea name="" id="message" cols="100" rows="10">
            </textarea>
				<div id="allPay">
					<h3>총 결제 금액 :</h3>
					<p>${total+2500}원</p>
				</div>
            </div>
            <!--여기까지 총 결제 끝-->
        </div>
 </div><!-- left 닫기 -->

        <div id="right">
            <div id="rightPrice">
               <h3>총 결제 금액 : ${total+2500}</h3>
				<p>총 상품 금액 : ${total}</p>
				<button id="nowButton">바로 결제 하기</button>
				<div id="userPointDiv"><p id="usePoint"></p><p>원 사용</p></div>
				<p>배송비 : 2500원</p>
            </div>
            <div id="rightBottom">
             <div><input type="checkbox" /><h4>주문내역확인동의</h4></div>
				<p>주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며,
				구매에 동의 하시겠습니까?(전자상거래법 제8조, 제2항)</p>
            </div>
        </div>
       
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    };
    function printName()  {
    	  const point = document.getElementById("point").value;
    	  document.getElementById("usePoint").innerText = point;
    	  if (${user.point} < point) {
    	  		var notice = '보유포인트보다 입력한 포인트값이 더 큽니다';
    	        alert(notice);
    			}
    	};
    	document.getElementById("point").addEventListener("focus",function(){
      		if(this.value==0){
      			this.value="";
      		};
      	});
      	document.getElementById("point").addEventListener("blur",function(){
      		if(this.value==""){
      			this.value=0;
      		};
      	});
</script>
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  <script type="text/javascript">

  const usertel = document.getElementById("orderTel").value;
  const address = document.getElementById("address").value;
  const postcode = document.getElementById("postcode").value;
  const point = document.getElementById("point").value;
  
  var IMP = window.IMP; // 생략 가능
  IMP.init("imp28442011"); // 예: imp00000000
 
  function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card", 
          merchant_uid: "merchant-"+new Date().getTime(), //가맹점 주문번호(아임포트를 사용하는 가맹점에서 중복되지않은 임의의 문자열)
          name: "${cartList[0].itemName} 외 ${fn:length(cartList)}건", //결제창에 노출될 상품명
          amount: "${total+2500}"-document.getElementById("point").value, //금액 (적립금사용한 만큼 빠지게 적용되었음)
          buyer_email: "${payInfor.email}",	// 이메일 -> payInfor로 끌어와서 씀
          buyer_name: "${payInfor.username}", // 위에 input에 입력한 값
          buyer_tel: document.getElementById("orderTel").value,	// 전화번호 -> payInfor
          buyer_addr: document.getElementById("address").value,	// 주소 위에 input에 입력한 값
          buyer_postcode: document.getElementById("postcode").value	// 우편번호 위에 input에 입력된 값
      }, function (rsp) { // callback
          if (rsp.success) {
    	  	var msg = '주문해주셔서 감사합니다';
              	alert(msg); 
              	document.getElementById("payform").submit();
              	
          } else {
              // 결제 실패 시 로직,
              var msg = '결제에 실패하였습니다';
              alert(msg);
          }
      });
    }
	
  	document.getElementById("nowButton").addEventListener("click",function(e){
  		if(document.querySelector('input[name="pay"]:checked') == null) {
  			e.preventDefault();
  			alert("결제 방법을 선택해 주세요");
  		} else if(document.querySelector('input[name="pay"]:checked').value == "card") {
  			e.preventDefault();
  			requestPay();
  		};
  	});

  
  </script>
  
    </body>
</html>