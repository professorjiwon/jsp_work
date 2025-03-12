<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="04.2.cookieLoginProc.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<th colspan="2"><h2>Cookie Login</h2></th>
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