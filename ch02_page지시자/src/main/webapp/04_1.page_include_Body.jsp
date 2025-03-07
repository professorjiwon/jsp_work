<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Directive Ex2</h1>
	
	<%@ include file="04_2.page_include_Top.jsp" %><p/>
	include 지시자의 Body부분입니다.<p/>
	<%@include file="04_3.page_include_Bottom.jsp" %>
</body>
</html>