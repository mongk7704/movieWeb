<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sdata" scope="request" class="beans.seat"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script language="javascript">
function rescheck(a,b)
{
	var form = document.forms[b];
	if(a!=0)
		{
		alert('예매 불가');
		return false;
		}
	form.submit();
}
</script>
user : <%=session.getAttribute("IDNAME") %>
<form name=logout method=post action="logout.jsp">
<input type=submit value="로그아웃">
</form>

<form name=mypage method=post action="mypage.jsp">
<input type=submit value="마이페이지">
</form>
<%if(!(sdata.seatCheck()))
{
	out.println("<script language=javascript> alert('예매가 꽉 차있습니다.');history.back();history.back(); </script>");
}
	
	%>
<table border="1">
			<tr><th>좌석 번호</th><th>좌석 현황</th><th>예매</th></tr>
			
			  <tr>
				<td>seat1</td>
				<td><%=sdata.seatState(sdata.getSeat1()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=1&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat1()%>,2)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat2</td>
				<td><%=sdata.seatState(sdata.getSeat2()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=2&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat2()%>,3)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat3</td>
				<td><%=sdata.seatState(sdata.getSeat3()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=3&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat3()%>,4)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat4</td>
				<td><%=sdata.seatState(sdata.getSeat4()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=4&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat4()%>,5)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat5</td>
				<td><%=sdata.seatState(sdata.getSeat5()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=5&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat5()%>,6)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat6</td>
				<td><%=sdata.seatState(sdata.getSeat6()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=6&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat6()%>,7)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat7</td>
				<td><%=sdata.seatState(sdata.getSeat7()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=7&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat7()%>,8)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat8</td>
				<td><%=sdata.seatState(sdata.getSeat8()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=8&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat8()%>,9)" >
				</form>
				</td>
			  </tr>
			   <tr>
				<td>seat9</td>
				<td><%=sdata.seatState(sdata.getSeat9()) %></td>
				<td>
				<form name="frm" method=post action="Control.jsp?seat=9&action=reservation">
				<input type=button value="예매" onclick="rescheck(<%=sdata.getSeat9()%>,10)" >
				</form>
				</td>
			  </tr>
		</table>
		
</body>
</html>