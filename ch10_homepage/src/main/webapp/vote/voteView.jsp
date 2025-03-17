<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals("")))      
		num = Integer.parseInt(request.getParameter("num"));
	
	int sum = vDao.sumCount(num);  // count합계
	ArrayList<VoteItem> vitem = vDao.getView(num);  // 각 항목의 count
	VoteList vlist = vDao.getOneVote(num); // q를 가져오기 위해
	
	String q = vlist.getQuestion();
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<title>결과</title>
<style type="text/css">
	* {margin: 0 auto;}
	div {width: 500px;}
	.m30 {margin-top : 30px;}
</style>
</head>
<body>
	<div class="m30">
		<table class="table">
			<tr>
				<th colspan="4">Q : <%=q %></th>
			</tr>
			<tr>
				<th colspan="4">총 투표수 : <%=sum %>표</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>item</th>
				<th>그래프</th>
				<th>득표수</th>
			</tr>
		<%
		for(int i=0; i<vitem.size(); i++) {
			VoteItem v = vitem.get(i);
			String[] item = v.getItem();
			
			// rgb값 추출
			int rgbR = r.nextInt(256); // 0~255
			int rgbG = r.nextInt(256);
			int rgbB = r.nextInt(256);
			String rgb = "rgb(" + rgbR + "," + rgbG + "," + rgbB + ")";
			
			// 각 항목이 몇 %인지
			int ratio = (int)(Math.ceil((v.getCount() / (double)sum) * 100));
		%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=item[0] %></td>
				<td>
					<table width="<%=ratio%>" height="15" align="left">
						<tr>
							<td bgcolor="<%=rgb%>" style="border:none"></td>
						</tr>
					</table>
				</td>
				<td><%=v.getCount() %></td>
			</tr>
		<%
		}
		%>
		</table>
	</div>


</body>
</html>