<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Application Ex</h1>
	서블릿 컨테이너의 이름과 버전 : <%=application.getServerInfo() %><p/>
	01.1.request.html 파일의 MIME Type : <%=application.getMimeType("01.1.request.html") %><p/>
	웹 어플리케이션의 URL 경로 : <%=application.getContextPath() %><p/>
	로컬 파일 시스템의 경로 : <%=application.getRealPath("/") %>
	<% application.log("application 내부 객체 로그 테스트"); %>
</body>
</html>