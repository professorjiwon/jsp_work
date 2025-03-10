<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	
	session.setAttribute("idKey", id);
	session.setMaxInactiveInterval(60*5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>Session Ex</h1>
	<form action="05.3.session.jsp">
		1. 가장 좋아하는 계절은?<p/>
		<input type="radio" name="season" value="봄">봄&emsp;
		<input type="radio" name="season" value="여름">여름&emsp;
		<input type="radio" name="season" value="가을">가을&emsp;
		<input type="radio" name="season" value="겨울">겨울&emsp;
		<p/><p/>
		
		2. 가장 좋아하는 과일은?<p/>
		<input type="radio" name="fruit" value="사과">사과&emsp;
		<input type="radio" name="fruit" value="딸기">딸기&emsp;
		<input type="radio" name="fruit" value="포도">포도&emsp;
		<input type="radio" name="fruit" value="멜론">멜론&emsp;
		<p/><p/>
		
		<input type="submit" value="전송">&emsp;
		<input type="reset">	
	</form>
</body>
</html>