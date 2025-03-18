<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h3>1. 산술연산</h3>
	기존방식 <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	<br><br>
	
	EL 방식<br>
	10 + 3 = ${big + small}<br>
	10 - 3 = ${big - small}<br>
	10 * 3 = ${big * small}<br>
	10 / 3 = ${big / small} 또는 ${big div small}<br>
	10 % 3 = ${big % small} 또는 ${big mod small}<br>
	
	<h3>2. 대소 비교 연산</h3>
	10 > 3 = ${big > small} 또는 ${big gt small}<br>
	10 < 3 = ${big < small} 또는 ${big lt small}<br>
	10 >= 3 = ${big >= small} 또는 ${big ge small}<br>
	10 <= 3 = ${big <= small} 또는 ${big le small}<br>
	
	<h3>3. 동등 비교 연산</h3>
	sOne과 sTwo는 일치합니까? ${sOne == sTwo} 또는 ${sOne eq sTwo}<br>
	sOne과 sTwo는 일치하지 않습니까? ${sOne != sTwo} 또는 ${sOne ne sTwo}<br>
	
	big에 담긴값은 10과 일치합니까? ${big == 10} 또는 ${big eq 10}<br>
	sThree에 담긴값은 '안녕'과 일치합니까? ${sThree == '안녕'} 또는 ${sThree eq "안녕"}<br>
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h3>
	pOne은 null입니까? ${pOne == null} 또는 ${pOne eq null} 또는 ${empty pOne}<br>
	pTwo은 null입니까? ${pTwo == null} 또는 ${pTwo eq null} 또는 ${empty pTwo}<br>
	pOne은 null이 아닙니까? ${pOne != null} 또는 ${pOne ne null} 또는 ${not empty pOne}<br>
	
	aOne이 텅 비어있습니까? ${empty aOne}<br>
	aTwo이 텅 비어있습니까? ${empty aTwo}<br>
	
	<h3>5. 논리 연산자</h3>
	${true && true} 또는 ${true and true}<br>
	${true || true} 또는 ${true or true}<br>
	
	big이 small보다 크고 aOne이 텅 비어있습니까? ${big gt small and empty aOne}
</body>
</html>






