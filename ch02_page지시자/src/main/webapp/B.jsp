<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b><%=name %></b>님의 혈액형은 <b><%=bloodType %></b>형이고 성격은
규격을 싫어하는 자유주의자입니다.
</body>
</html>