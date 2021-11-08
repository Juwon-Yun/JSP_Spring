<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 정적으로 만든 sub.jsp -->
<%@ include file="sub.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	main.jsp에서 생성한 내용. <br>
	
	<!-- jsp: => 액션태그
		액션태그란 JSP 페이지 내에서 어떤 동작을 하도록 지시하는 태그 입니다.
	    페이지 이동, 페이지 include, 자바 빈 생성 등이 있습니다.
	 -->
	 
	 <!-- 
	 include :  JSP 페이지 내에 다른 페이지를 삽입하는 액션태그, flush false => 같은 버퍼에 담아라, flush true 다른버퍼에 담아라
	 
	 flush : true => 출력 버퍼를 플러시한다는 의미
	 액션태그를 실행하는 시점에서 출력 버퍼에 저장된 [main.jsp에서 생성한 내용.]을 화면에 보인후 sub.jsp페이지로 흐름이 이동함
	 이 떄 응답 상태 코드와 HTTP 응답 헤더가 웹 브라우저와 함께 전송됨 그래서 sub.jsp에서 response.setHeader()를 실행해도 헤더가 추가되지
	 않음// 헤더에는 어떤 정보가 들어가나? 응답의 몸체가 어떤 데이터인지, 길이는 어떻게되는지 정보.
	   
	 액션태그에서만 동적으로 처리할 수 있다 
	    -->
	<jsp:include page="sub.jsp" flush="false">
	<!-- 동적으로 만든 include는 매개변수를 넘길수 있다. -->
		<jsp:param value="a001" name="id"/>
	</jsp:include>
	
	include 이후의 내용.
</body>
</html>