<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	* 디렉티브
	1) page(***) : 문서의 타입, 캐릭터셋, 인코딩
	2) taglib(**) : 태그라이브러리 지정. c, fmt, fn...
	3) include(*) : 다른 문서를 포함
	
	*text/html *** <= MIME 타입
	 text/xml
	 application/json (json을 쓸때는 application을 붙이기로 약속함)
	 
 -->
 <%!
	//선언부(Declaration) : 메소드
 	int add(int p_a,int p_b){
	 return p_a + p_b;
	}
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 구조</title>
</head>
<body>
<!-- 스크립트 요소? 스크립트릿, 표현식, 선언부 -->
<%
	//스크립트릿(ScriptLet) : 자바 코드 실행
	String bookTitle = "JSP 프로그래밍";
	String author = "이준석";
	int result = add(3, 5);	
	
%>
<!-- 
	표현식
 -->
<b><%=bookTitle %></b>(<%=author %>)입니다.

</body>
</html>