<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다.");
			<%
				session.setAttribute("lost","lost");
			%>
			
			location.href="${pageContext.request.contextPath}/loginpage";
		</script>
</body>
</html>