<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Response Ex1</h1>
	<h3>sendRedirect 예제입니다</h3>
	<%
		// response.sendRedirect("03.2.response.jsp");
		response.sendRedirect("https://kn.tjoeun.co.kr/"); // 뒤로가기 비활성화됨
	%>
</body>
</html>