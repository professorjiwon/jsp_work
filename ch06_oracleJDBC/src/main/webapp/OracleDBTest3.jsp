<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JDBC를 이용한 ORACLE 연동</h1>
<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
		st = con.createStatement();
		rs = st.executeQuery("select * from department");
%>
	<table border="1">
		<tr>
			<th>DeptId</th>
			<th>DeptTitle</th>
			<th>LOCATION</th>
		</tr>
	
<%		
		while(rs.next()) {
			String deptId = rs.getString(1);
			String deptTitle = rs.getString(2);
			String location = rs.getString(3);
%>
		<tr>
			<td><%=deptId %></td>
			<td><%=deptTitle %></td>
			<td><%=location %></td>
		</tr>
<%
		}
%>
	</table>
<%
	} catch(Exception e) {
		
	} finally {
		if(st != null) {
			st.close();
		}
		if(rs != null) {
			rs.close();
		}
		if(con != null) {
			con.close();
		}
	}
	%>
</body>
</html>