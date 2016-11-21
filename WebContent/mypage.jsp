<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script language="javascript">

function check()
{
	var form = document.frm;
	if(form.age_mem.value=="")
		{
		alert('나이값 입력 하세요');
		form.age_mem.focus();
		return false;
		}
	if(form.password.value!=form.password2.value)
		{
			alert('비밀전호 재확인 요망');
			form.password2.focus();
			return false;
		}
	form.submit();
}
</script>
<%
String id=(String)session.getAttribute("IDNAME");
%>
<form name="frm" method=post action=memberControl.jsp>
<table>
<tr>
<td>ID</td> <td> <%=id %></td>
</tr>
<tr>
<td>비밀번호 </td><td><input type=text name=password></td>
</tr>
<tr>
<td>비밀번호 확인 </td><td><input type=text name=password2></td>
</tr>
<tr>
<td>나이 </td><td><input type=text name=age_mem></td>
</tr>
<tr>
<td colspan=2>
<input type=button value="승인" onclick="check()"></td>
</tr>
</table>
</form>
<form method=post action="Control.jsp?action=cancle">
<input type=submit value="취소">
</form>
</body>
</html>