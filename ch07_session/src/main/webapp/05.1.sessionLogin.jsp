<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null) {
%>
	<script>
		alert("로그인 되어 있는 상태입니다.");
		location.href="05.3.sessionLoginOK.jsp";
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
	<form action="05.2.sessionLoginProc.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<th colspan="2"><h2>Session Login</h2></th>
			</tr>
			<tr>
				<td width="50px" align="center">ID</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td align="center">PW</td>
				<td><input name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="LOGIN">&emsp;
					<input type="reset">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>