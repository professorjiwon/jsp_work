<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.tjoeun.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성, attribute)</h3>
	<h4>1.1 변수 선언과 초기화</h4>
	
	<pre>
	* 변수 선언과 동시에 초기화
	  (c:set var="변수명" value="값" [scope=""])
	  - 변수를 선언하고 초기값을 대입해두는 기능을 제공
	  - 해당 변수를 어떤 scope에 담아 둘것인지 지정 가능함(생략시 pageScope)
	    => 해당 scope에 setAttribute를 통해서 key-value형태로 데이터를 담아 놓는다
	  - 변수 타입을 별도로 지정하지 않음
	  - 초기값은 반드시 지정해야됨 
	  
	  > c:set으로 선언된 변수는 EL구문으로만 접근가능(스크립팅원소로 접근 불가) 
	</pre>
	
	<c:set var="num1" value="10"/>  <!-- pageContext.setAttribute("num1","10") -->
	<c:set var="num2" value="20" scope="request" />
	
	num1 변수 값 : ${num1}<br>
	num2 변수 값 : ${num2}<br>
	<%-- num1 변수 값 : <%=num1 %><br> 사용불가 --%>
	
	<%-- <c:set var="result" value="num1+num2" scope="session" /> 문자열을 변수에 넣은 것--%>
	<c:set var="result" value="${num1 + num2}" scope="session" />
	session.result : ${session.result}<br><br>
	
	pageScope.num1 : ${pageScope.num1}<br>
	pageScope.num2 : ${pageScope.num2}<br>
	requestScope.num2 : ${requestScope.num2}<br><br>
	
	<!-- value속성대신 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">
		777
	</c:set>
	
	request.result : ${request.result}<br>
	
	<hr>
	
	<h4>1.2 변수 삭제</h4>
	<pre>
	* 변수 삭제 (c:remove var="제거하고자하는 변수명" [scope=""])
	- 해당 scope영역에서 해당 변수를 찾아 제거하는 태그
	- scope를 지정하지 않으면 모든 scope에서 해당 변수를 모두 다 찾아서 제거함
	</pre>
	
	삭제전 result : ${result}<br><br>
	
	1) 특정 scope(request) 지정하여 삭제<br>
	<c:remove var="result" scope="request" />
	request의 result 삭제 후 : ${result}<br><br>
	
	2) 모든 scope에서 삭제<br>
	<c:remove var="result" />
	모두 삭제 후 result : ${result}<br><br>
	
	<hr>
	
	<h4>1.3 변수 출력</h4>
	
	<pre>
	* 변수 출력 (c:out value="출력하고자하는 값" [default="기본값"] [escapeXml="true|false"])
	  데이터를 출력하고자 할 때 사용하는 태그
	</pre>
	
	num1 : <c:out value="${num1}" /><br>
	abc : <c:out value="${abc}" default="없음" /><br><br>
	
	
	<c:set var="outTest" value="<b>출력테스트</b>" />

	<c:out value="${outTest}" /><br><!-- escapeXml생략시 기본값 true => 문자열로 인식 -->
	<c:out value="${outTest}" escapeXml="false" />
	
	<hr>
	
	<h3>2. 조건문 - if</h3>
	<pre>
	- (c:if test="조건식")
	- 조건식은 test속성에 작성(단, EL구문으로 작성해야 됨)
	</pre>
	
	<c:if test="${num1 ge num2}">
		<b>num1이 num2보다 크거나 같다</b>
	</c:if>
	
	<c:if test="${num1 lt num2}">
		<b>num1이 num2보다 작다</b>
	</c:if>
	
	<br>
	
	<c:set var="str" value="안녕하세요" />
	
	<c:if test="${str eq '안녕하세요'}">
		<h4>Hello!!!</h4>
	</c:if>
	
	<c:if test="${str ne '안녕하세요'}">
		<h4>Bye!!!</h4>
	</c:if>
	
	<h3>3. choose</h3>
	<pre>
	- (c: choose, c:when, c:otherwise)
	- java의 if-else if-else
	- 각 조건들을 c:choose하위요소로 c:when을 통해서 작성(else의 역할 c:otherwise)
	</pre>
	
	<c:choose>
		<c:when test="${num1 gt 20 }">
			<b>num1이 20보다 크다</b>
		</c:when>
		<c:when test="${num1 ge 10 }">
			<b>num1이 10보다 크거나 같다</b>
		</c:when>
		<c:otherwise>
			<b>num1이 10보다 작다</b>
		</c:otherwise>
	</c:choose>

	<hr>
	
	<h3>4. 반복문 - forEach</h3>
	<pre>
	* for loop문(일반 for문)
	  - (c:forEach var="변수명" begin="초기값" end="끝값" [step="반복시 증가값"])
	* 향상된 for문
	  - (c:forEach var="변수명" items="순차적으로 접근할 객체(배열|컬렉션)" [vatStatus="현재 접근한 요소의 상태값을 보관할 변수명"])  
	</pre>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red, yellow, green, pink
	</c:set>
	
	color 변수 값 : ${colors}<br>
	
	<ul>
		<c:forEach var="col" items="${colors}">
			<li style="color:${col}">${col}</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("홍길동", 20, "남자"));
		list.add(new Person("이순희", 25, "여자"));
		list.add(new Person("강감찬", 23, "남자"));
	%>
	
	<c:set var="pList" value="<%=list %>"/>
	
	<table border="1">
		<thead>
			<tr>
				<th>index번호</th>
				<th>count번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty pList}">
					<tr>
						<td colspan="5">조회된 사람이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${pList}" varStatus="status">
						<tr>
							<td>${status.index}</td>
							<td>${status.count}</td>
							<td>${p.name}</td>
							<td>${p.age}</td>
							<td>${p.gender}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>	
	</table>
	
	<hr>
	
	<h3>5. 반복문 forTokens</h3>
	<pre>
	* 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하여 반복 수행
	  - (c:forTokens var="변수명" items="분리시키고자하는 문자열" delims="구분자")
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV.에어컨/냉장고.세탁기" />
	
	<ol>
		<c:forTokens var="d" items="${device}" delims=",./">
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리 스트링</h3>
	
	<pre>
	- url 경로를 생성하고 쿼리스트링을 정의해 둘 수 있는 태그
	
	  &lt;c:url var="변수명" value="요청할url"&gt;
		&lt;c:param name="키" value="값" /&gt;
		&lt;c:param name="키" value="값" /&gt;
	  &lt;/c:url&gt;
	</pre>
	
	<a href="list.do?Page=1&num=2">기존 방식</a><br>
	
	<c:url var="u" value="list.do">
		<c:param name="nowPage" value="1" />
		<c:param name="num" value="2" />
	</c:url>
	
	<a href="${u}">c:url을 이용한 방식</a>
</body>
</html>