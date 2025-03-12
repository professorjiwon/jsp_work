<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* Cookie cookie = new Cookie("","");
	response.addCookie(cookie); */
	
	response.addCookie(new Cookie("NAME","홍길동"));
	response.addCookie(new Cookie("GENDER","Male"));
	response.addCookie(new Cookie("AGE","24"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 여러개 생성</h2>
	쿠키의 내용은 <a href="02.2.testCookies.jsp">클릭하세요</a>
</body>
</html>