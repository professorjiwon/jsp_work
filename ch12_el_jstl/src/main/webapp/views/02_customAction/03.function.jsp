<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL Function Library</h3>
	
	<c:set var="str" value="How are you?" />
	
	str : ${str}<br>
	
	문자열의 길이 : ${ str.length() }<br>
	문자열의 길이 : ${ fn:length(str) }<br>
	
	모두 소문자로 출력 : ${ fn:toLowerCase(str) }<br>
	모두 대문자로 출력 : ${ fn:toUpperCase(str) }<br>
	
	are의 시작 인덱스 : ${ fn:indexOf(str, 'are') }<br>
	are를 ware로 변경 : ${ fn:replace(str, 'are', 'ware') }<br><!--  원본 안바뀜 -->
	
	str : ${str}<br>
	
	<c:if test="${ fn:contains(str,'are') }">
		포함되어 있음
	</c:if>
</body>
</html>