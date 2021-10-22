<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- MemberInfo 클래스를 인스턴스하여 memberInfo 객체를 생성함. -->
<jsp:useBean id="memberInfo" class="kr.or.ddit.chap08.MemberInfo" scope="page"/>
<!-- jsp:setProperty 액션태그 => property: 파라미터 목록의 이름과 memberInfo객체의 필드와 매핑하여 set함 -->
<jsp:setProperty name="memberInfo" property="*"/>
<%
// 	memberInfo.setId(request.getParameter("id"));
// 	memberInfo.setPassword(request.getParameter("password"));
// 	memberInfo.setName(request.getParameter("name"));
// 	memberInfo.setEmail(request.getParameter("email"));
%>
<jsp:setProperty name="memberInfo" property="password" value="<%=memberInfo.getId() %>"/>
<html>
<head>
<title>가입</title>
</head>
<body>
<!-- 
사용자가 입력한 폼 값을 자바빈 객체에 저장할 때에는 jsp:setProperty 액션 태그를 사용할 수 있도록
파라미터 이름과 자바빈 프로퍼티의 이름을 맞춰줘야 함
 -->
	<table border="1" width="400" cellpadding="0" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td>
				<!-- memberInfo.getId() -->
				<jsp:getProperty name="memberInfo" property="id"/>
			</td>
			<td>암호</td>
			<td><jsp:getProperty name="memberInfo" property="password"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><jsp:getProperty name="memberInfo" property="name"/></td>
			<td>이메일</td>
			<td><jsp:getProperty name="memberInfo" property="email"/></td>
		</tr>
	</table>
</body>
</html>