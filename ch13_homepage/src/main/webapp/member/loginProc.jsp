<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="member.MemberDao" />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String msg = "로그인에 실패했습니다.";
	
	boolean result = mDao.loginMember(id, pwd);
	if(result) {
		session.setAttribute("idKey", id);
		msg = "로그인에 성공 하였습니다.";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "login.jsp";
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>