<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> 상영 영화 리스트</h2>
<jsp:useBean id="movieinfo" scope="session" class="beans.moviebean"/>
<jsp:useBean id="mdata" scope="request" class="java.util.ArrayList" />


<table border="1">
			<tr><th>타이틀</th><th>이미지</th><th>관람가</th><th>총 좌석 수</th><th>상영시간</th><th>예매</th></tr>
			<%
				for(moviebean  ab : (ArrayList<moviebean>)mdata)
				{
					String film_name = ab.getName_film();
					String film_path = "img/"+film_name+".jpg" ;
			%>
			
			  <tr>
				<td><%=film_name %></td>
				<td><img src="<%=film_path %>" width=100 height=100></td>
				<td><%=ab.getAge_phase() %>세 이상 관람가</td>
				<td><%=ab.getSeat_num() %></td>
				<td><%=ab.getWatch_date() %></td>
				<td><a href="Control.jsp?FID=<%=ab.getId_film()%>&action=check">예매</a></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</body>
</html>