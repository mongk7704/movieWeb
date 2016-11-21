<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
<form method=post action=Control.jsp>
<input type="hidden" name="action" value="login">
<input type="hidden" name="FID" value="<%=request.getParameter("FID") %>">
<table border="1">
	<tr>
		<td>아이디</td> <td><input type=text name=name_mem></td>
	</tr>
	<tr>
		<td>비밀번호</td> <td><input type=password name=password></td>
	</tr>
	
	<tr>
	<td colspan=2 align=center>
	<input type=submit value=로그인 style=background-color:blue>
	<input type=reset value=초기화 style=background-color:blue>
	</td>
	</tr>
	
</table>
</form>
<form method=post action=member.jsp>
	<input type=submit value=회원가입 style=background-color:blue></form>
</body>
</html>