<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="movieinfo" scope="session" class="beans.moviebean"/>
<jsp:useBean id="mdata" scope="request" class="java.util.ArrayList" />
</head>

<body>
<table>
<tr>
<td>
<form action="insertFilm.jsp">
<input type=submit value="Insert Film" > 
</form>
</td>
<td>
<form action="admin.jsp">
<input type="hidden" name=action value=mem>
<input type=submit value="Member Management" >
</form>
</td>
</tr>
</table> 
<form method=post action="logout.jsp">
<input type=submit value="로그아웃" >
</form>

<table border="1">
			<tr><th>타이틀</th><th>관람가</th><th>총 좌석 수</th><th>상영시간</th><th>operation</th></tr>
			<%
				for(moviebean  ab : (ArrayList<moviebean>)mdata)
				{
					String film_name = ab.getName_film();
					String film_path = "img/"+film_name+".jpg" ;
			%>
			
			  <tr>
				<td><%=film_name %></td>
				<td><%=ab.getAge_phase() %>세이상 관람가</td>
				<td><%=ab.getSeat_num() %></td>
				<td><%=ab.getWatch_date() %></td>
				<td><a href="admin.jsp?FID=<%=ab.getId_film()%>&action=delete">Remove</a></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</body>
</html>