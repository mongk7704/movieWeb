<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Insert Film</h2>
<form method=post action="admin.jsp">
<input type="hidden" name=action value=insert>
<table>
<tr>
<td> Title </td><td> <input type=text name=name_film></td>
</tr>
<tr>
<td> Age </td><td> <input type=text name=age_phase></td>
</tr>
<tr>
<td> Total_seat </td><td> <input type=text name=seat_num></td>
</tr>
<tr>
<td> Date </td><td> <input type=text name=watch_date></td>
</tr>
<tr>
<td align=center><input type=submit value="submit" >
<input type=reset value="reset" >
</td>
</tr>
</table>
</form>
<form method=post action="Control.jsp?action=cancle">
<input type=submit value="취소">
</form>
</body>
</html>