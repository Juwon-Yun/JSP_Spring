<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	if(type == null){
		return;
	}
%>
<br>
<table style="width: 100%; border:1px solid gray; cellpadding:0px; cellspacing:0px;"border="1">
<tr>
	<td>타입</td>
	<td><b><%=type %></b></td>
</tr>
<tr>
	<td>특징</td>
	<td>
<%
	if(type.equals("A")){%>
		강한내구성.
<%	} else if (type.equals("B")){%>
		뛰어난 대처 능력
<%
}
%>
	</td>
</tr>
</table>