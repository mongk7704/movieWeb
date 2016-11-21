<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*,manage.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">
function idck(id)
{
	url="idcheck.jsp?id="+id;
	window.open(url,"아이디 검색",width=300,heigh=150);
}
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 가입</h2>
<form name="frm" method=post action=Control.jsp>
<input type="hidden" name="action" value="regist">
<table>
<tr>
<td> ID </td><td> <input type=text name=name_mem></td>
<td><input type=button value="아이디 중복검사" onclick="idck(this.form.name_mem.value)" ></td>
</tr>
<tr>
<td> 비밀번호 </td><td> <input type=password name=password></td>
</tr>
<tr>
<td> 비밀번호 재확인 </td><td> <input type=password name=password2></td>
</tr>
<tr>
<td> 나이 </td><td> <input type=text name=age_mem></td>
</tr>
<tr>
<td align=center><input type=button value="확인" onclick="check()">
<input type=reset value=초기화 ></td>
</tr>
</table>
</form>


</body>
</html>