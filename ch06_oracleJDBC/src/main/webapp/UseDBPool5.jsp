<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch06_oracleJDBC.*, java.util.*" %>
<jsp:useBean id="uBean" class="ch06_oracleJDBC.UseDBPool5" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 사용한 ORACLE연동</h1>
	<table border="1">
		<tr>
			<th>부서코드</th>
			<th>부서명</th>
			<th>사무실 위치코드</th>
		</tr>
	<%
		ArrayList<Bean> list = uBean.getList();
		for(int i=0; i<list.size(); i++) {
			Bean bean = list.get(i);
	%>
		<tr>
			<td><%=bean.getDept_id() %></td>
			<td><%=bean.getDept_title() %></td>
			<td><%=bean.getLocation_id() %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>