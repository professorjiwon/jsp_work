<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tjoeun.vo.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1. 기존 방식대로 출력하기</h3>
	<%
		// requestScope 
		String classRoom = (String)request.getAttribute("classRoom");
		Person student = (Person)request.getAttribute("student");
		
		// sessionScope
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
	%>
	 
	<p>
		학원명 : <%=academy %><br>
		강의실 : <%=classRoom %><br>
		강사 정보 : <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %><br><br>
		수강생 정보
		<ul>
			<li>이름 : <%=student.getName() %></li>
			<li>나이 : <%=student.getAge() %></li>
			<li>성별 : <%=student.getGender() %></li>
		</ul>
	</p>
	
	<h3>2. EL 구문으로 출력하기</h3>
	<p>
		EL구문을 이용하면 getXXX을 통해 값을 얻어올 필요 없이
		EL구문내에 키값만 제시하면 바로 접근 가능<br>
		기본적으로 EL은 JSP내장객체를 구분하지 않고 자동으로 모든
		내장객체에 키값을 검색하여 존재하면 값을 가져옴
	</p>
	
	<p>
		학원명 : ${ academy }<br>
		강의실 : ${classRoom}<br>
		강사 : ${teacher.name}, ${teacher.age}, ${teacher.gender}
		수강생 정보
		<ul>
			<li>이름 : ${student.name }</li>
			<li>나이 : ${student.age }</li>
			<li>성별 : ${student.gender}</li>
		</ul>
	</p>
	
	<h3>3. EL 사용시 내장 객체에 동일 키값으로 넣었을 경우</h3>
	<p>
		scope값 : ${scope}<br>
		test값 : ${test}
	</p>
	<!-- 
		EL은 공유범위가 제일 작은 scope부터 키값을 검색함
		page => request => session => application
		application까지 찾았는데 키가 없으면 출력안됨(오류안남)
	 -->
	 
	 <h3>4. 직접 scope를 지정하여 접근하기</h3>
	 <%
	 	// pageScope
	 	pageContext.setAttribute("scope", "page");
	 %>
	 pageScope에 담긴 값 : ${scope} 또는 ${pageScope.scope}<br>
	 reqeustScope에 담긴 값 : ${requestScope.scope}<br>
	 sessionScope에 담긴 값 : ${sessionScope.scope}<br>
	 applicationScope에 담긴 값 : ${applicationScope.scope}<br>
</body>
</html>