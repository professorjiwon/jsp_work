<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	다음과 같은 예외가 발생되었습니다<p/>
	에러타입 : <%=exception.getClass().getName() %><p/>
	에러메시지 : <%=exception.getMessage() %>
</body>
</html>