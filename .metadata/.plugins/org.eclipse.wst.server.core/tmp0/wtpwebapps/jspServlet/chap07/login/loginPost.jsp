<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	 Map<String, Object> getMember(String memId, String memPwd){
		Map<String, Object> map = new HashMap<>();	
	
		if(memId.equals("a001")&&memPwd.equals("java")){
			map.put("memId", "a001");		 
			map.put("memName", "개똥이");		 
			map.put("memGubun", "관리자");		 
		}
		else{
			return null;
		}		
		return map; 
		
	 }	
%>
<%


// /chap07/login/loginPost.jsp

//memId=a001&memPwd=1234

String memId = request.getParameter("memId");
String memPwd = request.getParameter("memPwd");

// 데이터베이스 작업
Map<String, Object> member = getMember(memId, memPwd);

if(member == null){ //회원정보가 업거나 비밀번호 오류
	response.sendRedirect("/chap07/login/loginPost.jsp?message=error");
}else{
	//session객체의 이름 member에 map을 넣음
	session.setAttribute("member", member);
%>
	<jsp:forward page="/chap07/login/loginSuccess.jsp"/>
<%
}
%>
