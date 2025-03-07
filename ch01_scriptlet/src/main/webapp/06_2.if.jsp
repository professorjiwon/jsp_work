<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name1");
	String color = request.getParameter("color");
	if(color.equals("etc")) {
		color = "green";
	}
	String koColor="";
	/*
	switch(color) {
	case "blue" :
		koColor = "파란색";
		break;
	case "red" :
		koColor ="빨간색";
		break;
	case "orange" :
		koColor = "오렌지색";
		break;
	default :
		koColor = "기타";
	}
	*/
	
	if(color.equals("blue"))
		koColor = "파란색";
	else if(color.equals("red"))
		koColor = "빨간색";
	else if(color.equals("orange"))
		koColor = "오렌지색";
	else
		koColor = "기타";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=color%>">
	<b><%=name %></b>님이 좋아하는 색상은 <b><%=koColor %></b>입니다.
</body>
</html>