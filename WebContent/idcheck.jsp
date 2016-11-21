<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="manage.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="manageMem"  class="manage.manageMem"/>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	boolean flag=manageMem.check(id);
	if(flag)
		out.println(id+"는 이미 존재하는 아이디 입니다.");
	else
		out.println(id+"는 사용 가능 합니다.");
%>
</body>
</html>