<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body {background-color : #E7EDEC;}
</style>
</head>
<body>
<% if(id != null) { %>
	<b><%=id %></b>님 환영합니다<p/>
	즐거운 쇼핑되십시요<p/>
	<a href="logout.jsp">로그아웃</a>	
<% } else { %>
	<form method="post" action="loginProc.jsp" >
		<table align="center">
			<tr>
				<td align="center" colspan="2"><h4>로그인</h4></td>
			</tr>
			<tr>
				<td>아 이 디</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">&emsp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">
				</td>
			</tr>
		</table>
	</form>
<% } %>
</body>
</html>