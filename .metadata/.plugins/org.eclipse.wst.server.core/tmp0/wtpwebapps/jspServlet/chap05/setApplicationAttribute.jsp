<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
//서로 다른 기기간에 sesstion, request 는 공유가안되는데 application 객체는 공유가된다 
	String name = request.getParameter("name");
	String value = request.getParameter("value");

	if(name != null && value != null){
		application.setAttribute(name, value);
		//이름이 myname인 속성의 값으로 YJW를 지정함
		application.setAttribute("myname", "YJW");
		//이름이 myage인 속성의 값으로 25를 지정함
		application.setAttribute("myage", "25");
		//만약 4번째 줄의 value의 값이 remove이면
		//해당 속성을 삭제함
		
		//http://localhost:8100/jspServlet/chap05/setApplicationAttribute.jsp?name=juwon&value=remove
		if(value.equals("remove")){
			// application.removeAttribute("juwon");
			application.removeAttribute(name);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(name != null && value != null){
%>
application 기본 객체의 속성 설정:
	<%=name %>, <%=value %>
<%		
	}else{
%>
application 기본 객체의 속성 설정 안 함
<%		
	}
%>
</body>
</html>