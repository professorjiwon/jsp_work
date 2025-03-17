<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>Insert title here</title>
<style type="text/css">
	* {margin: 0 auto;}
	div {width: 800px;}
	h2, h5, .cen {text-align: center;}
	.m30 {margin-top : 30px;}
	a {text-decoration: none !important; color:black !important; cursor:pointer !important;}
</style>
</head>
<body>
	<div>
		<h2 class="m30">투표 프로그램</h2>
		<hr>
		
		<h5 class="m30">설 문 폼</h4>
		<jsp:include page="voteForm.jsp" />
		<hr>
		
		<h5 class="m30">설문 리스트</h4>
		<table class="table">
			<tr class="cen">
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
		<%
			ArrayList<VoteList> alist = vDao.getList();
			for(int i=0; i<alist.size(); i++) {
				VoteList vlist = alist.get(i);
				int num = vlist.getNum();
				String question = vlist.getQuestion();
				String sdate = vlist.getSdate();
				String edate = vlist.getEdate();
				
				out.print("<tr>");
				out.print("		<td>"+ (alist.size()-i) +"</td>");
				out.print("		<td><a href='voteList.jsp?num="+ num +"'>"+ question +"</a></td>");
				out.print("		<td>"+ sdate.substring(0,10) + " ~ " + edate.substring(0,10)+"</td>");
				out.print("</tr>");
			}
		%>
			<tr>
				<td colspan="3" align="right">
					<input type="button" onclick="location.href='voteInsert.jsp'" value="설문작성하기">&emsp;
					<input type="button" onclick="location.href='../index.jsp'" value="홈으로">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>