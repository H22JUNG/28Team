<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
    <style>
      
        /* 메인페이지 */
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
           main .event {
            width: 900px;
            height: 400px;
        }

        main .event img {
            width: 100%;
            height: 100%;
        }

        main .best {
            width: 800px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 10px;
            gap: 10px;
        }
        main .best ul{
            display: flex;
            width: 100%;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        main .best ul li {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 150px;
            height: 150px;
            border: 1px solid black;
        }
        
    </style>
</head>

<body>

    <jsp:include page="header.jsp"></jsp:include>

  
    <main>
        <div class="event">
			<img src="image/event.png" alt="">
        </div>
        <div class="best">
            <h1>Best</h1>
            <ul>
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
            </ul>
        </div>
    </main>
   <jsp:include page="footer.jsp"></jsp:include>
    <div id="popup1">
   		<img src="image/event2" alt="" />	 
 		
    </div>
     <script>
        var slideIndex = 0;

        window.onload = function () {
            showSlides(slideIndex);

            var sec = 3000;
            setInterval(function () {
                slideIndex++;
                showSlides(slideIndex);
            }, sec);
        }

        function showSlides(n) {
            if ((n + 1) > 7) {
                slideIndex = 0; n = 0;
            } else if (n < 0) {
                slideIndex = (7 - 1);
                n = (7 - 1);
            }
            var slide = document.querySelector(".event img");
            for (let i = 0; i < 7; i++) {
                slide.setAttribute("src", "image/event" + slideIndex + ".png");
            }
        }

        
    </script>
</body>

</html>