<%@page import="kr.or.ddit.chap10.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberVO memberVO = new MemberVO();
	
	//@RequestParam 어노테이션으로 Map<String, Object> map 
    memberVO.setMemId(request.getParameter("memId"));     
    memberVO.setMemPass(request.getParameter("memPass"));   
    memberVO.setMemName(request.getParameter("memName"));   
    memberVO.setMemRegno1(request.getParameter("memRegno1")); 
    memberVO.setMemRegno2(request.getParameter("memRegno2")); 
    memberVO.setMemBir(request.getParameter("memBir"));      
    memberVO.setMemZip(request.getParameter("zipcode"));    
    memberVO.setMemAdd1(request.getParameter("addr1"));   
    memberVO.setMemAdd2(request.getParameter("addr2"));   
    memberVO.setMemHometel(request.getParameter("memHometel"));
    memberVO.setMemMail(request.getParameter("memMail"));   
  	
    // db->insert
    // session에 membeVo 객체를 속성에 set함
    session.setAttribute("memberVo", memberVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<body>
<%=memberVO.getMemName()%>님, 회원가입 완료되었습니다
<a href="./memberMypage.jsp">마이페이지</a>
</body>
</html>