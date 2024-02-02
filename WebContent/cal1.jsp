<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
	String yy = request.getParameter("year");
	String mm = request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	
	// 현재상태
	int y = cal.get(Calendar.YEAR); // 출력 년도
	int m = cal.get(Calendar.MONTH); // 출력 개월(출력시 +1 필요)
	//int y = 2023;
	//int m = 11;
	
	if( yy != null && mm != null && !yy.equals("") && !mm.equals("")) { // null이 아니어야되고 공백도 아니여야 될경우
		y = Integer.parseInt(yy);
		m = Integer.parseInt(mm)-1;
	}
	
	cal.set(y ,m, 1);
	// 출력 년월의 1일날의 요일
	int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // 2, (일:1 ~ 토:7)
	
	// 출력 년월의 마지막 날짜
	int lastday = cal.getActualMaximum(Calendar.DATE);
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

	<form name="frm" method="post" action="cal1.jsp">
		<input type="text" name="year" size="3">년 &nbsp;
		<input type="text" name="month" size="3">월 &nbsp;
		<input type="submit" value="달력보기"> &nbsp;
	</form>
	
	<br><br>
	

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
					// 개행을 위한 설정
					if( count == 7 ) {
						out.print("</tr><tr>");
						count = 0; // 변수 초기화
					}
				}
			%>
		</tr>
		
	</table>
</body>
</html>