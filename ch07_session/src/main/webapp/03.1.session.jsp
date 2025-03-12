<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("idKey", "user01");
	session.setAttribute("name", "홍길동");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션에 속성 넣기</h2>
	세션 정보는 <a href="03.2.testSession.jsp">클릭하세요</a>
</body>
</html>