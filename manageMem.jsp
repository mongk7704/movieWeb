<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> Member Management</h2>
<form method=post action="admin.jsp">
<input type="hidden" name=action value=main>
<input type=submit value="back">
</form>
<jsp:useBean id="meminfo" scope="session" class="beans.memberbean"/>
<jsp:useBean id="memdata" scope="request" class="java.util.ArrayList" />
<table border="1">
			<tr><th>ID</th><th>Age</th><th>Registration Date</th><th>Operation</th>
			<%
				for(memberbean  ab : (ArrayList<memberbean>)memdata)
				{
			%>
			
			  <tr>
				<td><%=ab.getName_mem() %></td>
				<td><%=ab.getAge_mem() %>세</td>
				<td><%=ab.getRdate() %></td>
				<td><a href="admin.jsp?action=memdelete&MID=<%=ab.getId_mem() %>">Remove</a></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</body>
</html>