<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page info = "JSP 사용방법 공부하기" %>
<%@ page import="java.util.*" 
		 session="false" 
		 buffer="16kb" 
		 autoFlush="true"  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=this.getServletInfo() %>
	<% Date date = new Date(); %>
	<p>현재 날짜와 시간</p>
	<%=date.toLocaleString() %>
</body>
</html>