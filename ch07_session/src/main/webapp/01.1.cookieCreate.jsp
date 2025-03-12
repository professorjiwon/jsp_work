<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠기의 값에 띄어쓰기, 특수기호 안됨
	Cookie cookie = new Cookie("myCookie", "Apple");
	cookie.setMaxAge(60);
	cookie.setValue("Banana");
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie 사용하여 연결 유지</h2>
	쿠기를 만듭니다<p/>
	쿠키 내용은 <a href="01.2.testCookie.jsp">클릭하세요</a>
</body>
</html>