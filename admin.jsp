<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="manage.*,beans.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:useBean id="res" scope="request" class="beans.res" />
<jsp:useBean id="resManage" scope="application" class="manage.manageRes"/>
<jsp:useBean id="sdata" scope="request" class="beans.seat"/>
<jsp:useBean id="seatManage" scope="application" class="manage.manageSeat"/>
<jsp:useBean id="memdata" scope="session" class="beans.memberbean"/>
<jsp:useBean id="manageMem" scope="application" class="manage.manageMem"/>
<jsp:useBean id="moviebook" scope="application" class="manage.moviebook"/> 
<jsp:useBean id="movieinfo" scope="session" class="beans.moviebean"/>
<jsp:setProperty name="movieinfo" property="*"/> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String action=request.getParameter("action");
if(action.equals("main"))
{
	ArrayList<moviebean> mdata = moviebook.getDBList();
	request.setAttribute("mdata",mdata);
	pageContext.forward("adminMain.jsp");
}
if(action.equals("delete"))
{
	String fid=request.getParameter("FID");
	ArrayList<Integer> mdata=resManage.RidfromFid(Integer.parseInt(fid));
	for(int  ab : (ArrayList<Integer>)mdata)
	{
		resManage.delete(ab);
	}
	moviebook.delete(Integer.parseInt(fid));
	seatManage.delete(Integer.parseInt(fid));
	pageContext.forward("admin.jsp?action=main");
}
if(action.equals("insert"))
{
	int id=moviebook.regist(movieinfo);
	seatManage.regist(id);
	pageContext.forward("admin.jsp?action=main");
}
if(action.equals("mem"))
{
	ArrayList<memberbean> mdata = manageMem.getDBList();
	request.setAttribute("memdata",mdata);
	pageContext.forward("manageMem.jsp");
}
if(action.equals("memdelete"))
{
	String mid=request.getParameter("MID");
	String sname;
	
	ArrayList<Integer> mdata=resManage.RidfromMid(Integer.parseInt(mid));
	for(int  ab : (ArrayList<Integer>)mdata)
	{
		res=resManage.getReservation(ab);
		sname="seat"+res.getSeat_resv_no();
		seatManage.deleteRes(Integer.parseInt(mid), res.getId_film(), sname);
		resManage.delete(ab);
	}
	manageMem.delete(Integer.parseInt(mid));
	pageContext.forward("admin.jsp?action=main");
}
%>
</body>
</html>