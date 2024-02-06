<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
	String yy = request.getParameter("year");
	String mm = request.getParameter("month");

	Calendar cal = Calendar.getInstance();
	
	int h_y = cal.get(Calendar.YEAR);

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
	// dayOfweek = 2;
	
	// 출력 년월의 마지막 날짜
	int lastday = cal.getActualMaximum(Calendar.DATE);
	// lastday = 31;
	
	// 이전버튼
	int b_y = y;
	int b_m = m;
	
	// if( b_m == 0 )
	if(m == 0) {
		b_y = b_y -1;
		b_m = 12;
	} 
	
	// 다음버튼
	int n_y = y;
	int n_m = m+2;
	
	// if( n_m == 13 )
	if(m == 11) {
		n_y = n_y +1;
		n_m = 1;
	}
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

	<form name="frm" method="post" action="cal2.jsp">
		<select name="year">
			<%
				for(int y1=(h_y-20); y1<=(h_y+20); y1++) {
					
					String chk1 = "";
					try {
						if( y1 == Integer.parseInt(yy) ) {
							chk1 = "selected";
						}
					} catch(NumberFormatException e) {
					}
			%>
			<option value="<%=y1 %>" <%=chk1 %> > <%=y1 %>년 </option> 
			<%
				}
			%>
		</select>
		
		<select>
			<%
				for( int m1=1; m1<=12; m1++ ) {	
					
					String chk2 = "";
					try {
						if( m1 == Integer.parseInt(mm) ) {
							chk2 = "selected";
						}
					} catch(NumberFormatException e) {
						
					}
					
			%>
			<option value="<%=m1 %>" <%=chk2 %>> <%=m1 %>월 </option> 
			<%
				}
			%>
		</select>
		<input type="submit" value="달력보기">
	</form>
	
	<br><br>
	

	<table>
		<caption>
			<button type="button" onclick="location='cal2.jsp?year=<%=b_y %>&month=<%=b_m %>'" >이전</button> &nbsp;&nbsp;
				<%=y %>년 <%=m+1 %>월 &nbsp;&nbsp;
			<button type="button" onclick="location='cal2.jsp?year=<%=n_y %>&month=<%=n_m %>'" >다음</button> 
		</caption>
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
					String color="#555";
					if(count == 7) {
						color = "blue";
					} else if (count == 1) {
						color = "red";
					}
			%>
				<td style="color:<%=color %>"><%=d %></td>
			<%
					// 개행을 위한 설정
					if( count == 7 ) {
						out.print("</tr><tr>");
						count = 0; // 변수 초기화
					}
				}
				
				// 4, 5, 6, 
				while( count < 7 ) {
					out.print("<td></td>");
					count++;
				}
			%>
		</tr>
		
	</table>
</body>
</html>