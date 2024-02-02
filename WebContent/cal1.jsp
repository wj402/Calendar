<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
	Calendar cal = Calendar.getInstance();
	//int y = cal.get(Calendar.YEAR); // 출력 년도
	//int m = cal.get(Calendar.MONTH); // 출력 개월(출력시 +1 필요)
	int y = 2023;
	int m = 11;
	
	cal.set(y ,m, 1);
	int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // 2, (1 ~ 7) 1일날의 요일
	int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막 날짜
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	body {
		font-size: 9pt;
		color: #555555;
	}
	table {
		border-collapse:collapse;
	}
	th, td {
		border:1px sholid #ccc;
		width: 30px;
		height:25px;
		text-align:center;
	}
	
	caption {
		margin-bottom: 10px;
		font-size: 15px;
	}
</style>

<body>

	<table>
		<caption><%=y %>년 <%=m+1 %>월</caption>
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		<tr>
			<%
				// 빈공간 count
				int count = 0;
				// 1일을 출력하기 전 빈칸을 출력하는 설정
			
				for(int s=1; s<dayOfweek; s++) {
					out.print("<td></td>");
					count++;
				}
				
				// 날자 출력하는 설정
				for( int d=1; d<=lastday; d++ ) {
					count++;
			%>
				<td><%=d %></td>
			<%
					if( count%7 == 0 ) {
						out.print("</tr><tr>");
					}
				}
			%>
		</tr>
		
	</table>
</body>
</html>