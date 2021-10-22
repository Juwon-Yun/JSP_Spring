<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
jsp:useBean 액션 태그 => JSP 페이지에서 사용할 자바빈 객체를 지정할 때 사용함
<scope => 영역>
page(기본), request, session, application

page의 경우 makeObject.jsp -> 요청 이동 -> useObject.jsp 시
member 객체가 전달되지 않음
page 영역의 경우 JSP 페이지와 일대일로 연결된 영역이기 때문에 다른 JSP 페이지로
영역 공유가 되지 못하기 때문이고,
request 영역의 경우 하나의 요청에 포함된 JSP라면 영역이 공유가 되기 때문임

page 영역 : 각 jsp 페이지 내에서 공유
request 영역 : 하나의 요청 흐름에 속한 jsp 페이지 내에서 공유
session 영역 : 하나의 웹브라우저에 속한 jsp 페이지 내에서 공유
application 영역 : 하나의 웹 프로젝트에 속한 jsp 페이지 내에서 공유
 -->
<jsp:useBean id="member" scope="request" 
class="kr.or.ddit.chap08.MemberInfo"/>
<%
	//makeObject.jsp를 실행하면 MemberInfo의 객체를 생성해서
	//request 기본 객체의 member 속성에 저장한 후 useObject.jsp로
	//forwarding함(요청 이동함)
	member.setId("madvirus");
	member.setName("이준석");
%>
<jsp:forward page="/chap08/useObject.jsp"/>
