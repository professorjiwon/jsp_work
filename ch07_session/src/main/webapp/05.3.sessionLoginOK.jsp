<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Session 로그인</h2>
	<b><%=id %>님 로그인 되었습니다. 반갑습니다</b>
	<a href="05.4.sessionLogout.jsp">로그아웃</a>
</body>
</html>