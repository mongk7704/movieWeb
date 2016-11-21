<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="rmem" scope="request" class="beans.memberbean"/>
<jsp:useBean id="manageMem" scope="application" class="manage.manageMem"/>
<jsp:setProperty name="rmem" property="*"/> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String password = rmem.getPassword();
int age = rmem.getAge_mem();
String mid=(String)session.getAttribute("ID");
manageMem.reform(Integer.parseInt(mid), password, age);
out.println("<script language=javascript> history.back();history.back(); </script>");
%>
</body>
</html>