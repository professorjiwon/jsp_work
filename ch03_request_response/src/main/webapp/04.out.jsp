<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="5kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 객체</title>
</head>
<body>
	<h1>Out 객체</h1>
	<%
		int totalBuffer = out.getBufferSize();
		int remaining = out.getRemaining();
		int useBuffer = totalBuffer - remaining;
	%>
	현재 페이지의 Buffer 상태<p/>
	총 Buffer 크기 : <%=totalBuffer %>byte<p/>
	남은 Buffer 크기 : <%=remaining %>byte<p/>
	현재 사용한 Buffer 크기 : <%=useBuffer %>byte
</body>
</html>