<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginPro" class="ch07.LoginDB" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(loginPro.loginMethod(id, pw)) {
		Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie);
%>
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href = "04.3.cookieLoginOK.jsp";
	</script>
<%	
	} else {
%>
	<script type="text/javascript">
		alert("로그인 되지 않았습니다");
		location.href = "04.1.cookieLogin.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>