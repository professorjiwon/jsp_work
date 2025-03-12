<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginSe" class="ch07.LoginDB" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(loginSe.loginMethod(id, pw)) {
		session.setAttribute("idKey", id);
%>
	<script type="text/javascript">
		alert("로그인 되었습니다.");
		location.href="05.3.sessionLoginOK.jsp";
	</script>
<%	
	} else {
%>
	<script type="text/javascript">
		alert("로그인 되지 않았습니다.");
		location.href="05.1.sessionLogin.jsp";
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