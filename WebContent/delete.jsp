<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="manage.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<jsp:useBean id="resManage" scope="application" class="manage.manageRes"/>
<jsp:useBean id="seatManage" scope="application" class="manage.manageSeat"/>

<body>
<%
int fid= Integer.parseInt((String)session.getAttribute("FID"));
int mid=Integer.parseInt((String)session.getAttribute("ID"));
String sno=(String)request.getParameter("seat");
String Sseat="seat"+sno;
seatManage.deleteRes(mid, fid, Sseat);	
String rid=(String)request.getParameter("RID");
	resManage.delete(Integer.parseInt(rid));
	pageContext.forward("Control.jsp?action=reservation&seat=not");
%>
</body>
</html>