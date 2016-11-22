<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*,manage.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="res" scope="request" class="beans.res" />
<jsp:useBean id="resManage" scope="application" class="manage.manageRes"/>
<jsp:useBean id="sdata" scope="request" class="beans.seat"/>
<jsp:useBean id="seatManage" scope="application" class="manage.manageSeat"/>
<jsp:useBean id="memdata" scope="session" class="beans.memberbean"/>
<jsp:useBean id="manageMem" scope="application" class="manage.manageMem"/>
<jsp:useBean id="moviebook" scope="application" class="manage.moviebook"/> 
<jsp:useBean id="movieinfo" scope="session" class="beans.moviebean"/>
<jsp:setProperty name="movieinfo" property="*"/> 
<jsp:setProperty name="memdata" property="*"/> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String action=request.getParameter("action");
if(action.equals("list"))
{
	ArrayList<moviebean> mdata = moviebook.getDBList();
	request.setAttribute("mdata",mdata);
	request.setAttribute("age", request.getParameter("age"));
	pageContext.forward("ListView.jsp");
}
if(action.equals("check"))
{
	if(session.getAttribute("ID")!=null)
	{
		String sfid=(String)request.getParameter("FID");
		session.setAttribute("FID", sfid);
		sdata=seatManage.getDBList(Integer.parseInt(sfid));
		request.setAttribute("sdata",sdata);
		pageContext.forward("rsList.jsp");
	}
	else
	{
		request.setAttribute("FID",request.getAttribute("FID"));
		pageContext.forward("Login.jsp");
	}
		
}
else if(action.equals("login"))
{
	String id , password;
	id=request.getParameter("name_mem");
	password=request.getParameter("password");
	if(id.equals("admin")&&password.equals("admin"))
	{
		pageContext.forward("admin.jsp?action=main");
	}
	memdata =manageMem.login(id, password);

	if(memdata.getId_mem()!=0)
	{
		String mid=String.valueOf(memdata.getId_mem());
		session.setAttribute("IDNAME", id);
		session.setAttribute("ID",mid);
		String sfid=request.getParameter("FID");
		moviebean minfo=moviebook.getMovie(Integer.parseInt(sfid));
		sdata=seatManage.getDBList(Integer.parseInt(sfid));
		if(memdata.getAge_mem()>=Integer.parseInt(minfo.getAge_phase()))
		{
			session.setAttribute("FID", sfid);
			request.setAttribute("sdata",sdata);
			pageContext.forward("rsList.jsp");
			}
		else
		{
			session.invalidate();
			out.println("<script language=javascript> alert('나이가 어립니다');history.back();history.back(); </script>");
		}
	}
	else
	{
		out.println("<script language=javascript> alert('로그인 실패'); history.back();</script>");
	}
	
}
else if(action.equals("regist"))
{
	manageMem.regist(memdata);
	pageContext.forward("index.jsp");
}
else if(action.equals("reservation"))
{
	int fid= Integer.parseInt((String)session.getAttribute("FID"));
	int mid=Integer.parseInt((String)session.getAttribute("ID"));
	int seatno;
	if(!(request.getParameter("seat").equals("not")))
	{
		seatno= Integer.parseInt(request.getParameter("seat"));
		String sno=(String)request.getParameter("seat");
		String Sseat="seat"+sno;
		seatManage.makePay(mid, fid, Sseat);
		session.setAttribute("seat",seatno);
		moviebean minfo=moviebook.getMovie(fid);
		resManage.regist(mid,fid,minfo.getName_film(),minfo.getWatch_date(),seatno);
	}
	
	ArrayList<res> rdata = resManage.getDBList(mid);
	request.setAttribute("rdata",rdata);
	pageContext.forward("reservation.jsp");
}
else if(action.equals("cancle"))
{
	out.println("<script language=javascript> history.back();history.back(); </script>");
}
%>
	
</body>
</html>