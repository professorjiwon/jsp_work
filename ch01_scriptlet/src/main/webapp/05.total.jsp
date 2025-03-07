<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>total</title>
</head>
<body>
	<%
		float f = 3.789f;
		int num = Math.round(f);
		java.util.Date date = new java.util.Date();
		int hour = date.getHours();
		
		int num2 = 83;
		int num3 = 23;
	%>
	<%!
		public int op(int i, int j) {
			return i > j ? i : j;
		}
	%>
	실수 f의 값을 반올림한 값은 : <%=num %><br>
	현재의 날짜와 시간은 : <%=date %><br>
	두 수중 큰 숫자는 : <%=op(num2, num3) %><br>
	지금은 오전일까요? 오후 일까요? <%= hour < 12 ? "오전" : "오후" %>
</body>
</html>