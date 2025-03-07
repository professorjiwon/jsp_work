<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String name = "Korea web JSP";
%>
	<h1>Include Action Tag Ex</h1>
	
	<jsp:include page="05_3.action_includeTag3.jsp"/><p/>
	
	include ActionTag의 Body입니다<br>
	<%=name %> 본문의 이름입니다.
</body>
</html>