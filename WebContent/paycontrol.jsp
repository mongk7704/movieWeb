<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="resManage" scope="application" class="manage.manageRes"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String resv=(String)request.getParameter("RID");
resManage.changeState(Integer.parseInt(resv)); 
out.println("<script language=javascript> alert('결제 완료'); </script>");
pageContext.forward("Control.jsp?action=reservation&seat=not");
%>
</body>
</html>