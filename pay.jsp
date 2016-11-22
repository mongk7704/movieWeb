<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>카드결제</h2>
<table>
<tr>
<td>카드 번호</td> <td> <input type="text" name="card"></td>
</tr>
<tr>
<td>요효 날짜</td> 
<td>
<select name="date">
<%	
for(int i=0;i<31;i++)
{
%>
<option value="<%=i %>>"><%=i %></option>
<%} %>
</select>
<select name="year">
<%
for(int i=2000;i<2025;i++)
{
%>
<option value="<%=i %>>"><%=i %></option>
<%} %>
</select>
</td>
</tr>
<tr>
<td>cvc 번호</td>
<td> <input type="text" name="cvc"></td>
</table>
<form method=post action="paycontrol.jsp?RID=<%=request.getParameter("RID") %>">
<input type=submit value="결제">
</form>
<form method=post action="Control.jsp?action=cancle">
<input type=submit value="취소">
</form>
</body>
</html>