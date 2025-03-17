<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="member.MemberDao" />
<jsp:useBean id="mBean" class="member.Member" />
<jsp:setProperty name="mBean" property="*" />
<%
	boolean result = mDao.insertMember(mBean);
	String msg = "회원가입에 실패 하였습니다";
	String url = "member.jsp";
	
	if(result) {
		msg = "축하합니다. 회원이 되셨습니다.";
		url = "login.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	파일
</body>
</html>