<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*, java.util.*"%>
<jsp:useBean id="sdata" scope="session" class="beans.seat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="resManage" scope="application" class="manage.manageRes"/>
<jsp:useBean id="rdata" scope="request" class="java.util.ArrayList" />
user : <%=session.getAttribute("IDNAME") %>
<form method=post action="logout.jsp">
<input type=submit value="로그아웃" >
</form>
<form method=post action="mypage.jsp">
<input type=submit value="마이페이지">
</form>
<table border="1">
			<tr><th>영화 제목</th><th>상영 기간</th><th>예약일</th><th>좌석 번호</th><th>예약 상황</th><th>결제 및 취소</th></tr>
			<%
				for(res  ab : (ArrayList<res>)rdata)
				{
			%>
			
			  <tr>
				<td><%=ab.getFilm_name() %></td>
				<td><%=ab.getWatch_date() %></td>
				<td><%=ab.getResv_date() %></td>
				<td><%=ab.getSeat_resv_no()%></td>
				<td><%=ab.getResv_status() %></td>
				<td>
				<form method="post" action="pay.jsp?RID=<%=ab.getId_resv() %>">
				<input type=submit value="결제"></form>
				<form method="post" action="delete.jsp?RID=<%=ab.getId_resv()%>&seat=<%=ab.getSeat_resv_no() %>">
				<input type=submit value="예매내역 삭제"></form>
				</td>
			  </tr>
			 <%
				}
			 %>
		</table>
</body>
</html>