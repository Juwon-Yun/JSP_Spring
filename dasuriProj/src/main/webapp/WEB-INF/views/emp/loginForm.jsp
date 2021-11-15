<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>직원 로그인</title>
    <style type="text/css">
    </style>
</head>
<body class="bg-gradient-primary">
<div class="container">
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">
<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-0">
        <div class="row">
            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
            <div class="col-lg-6">
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">직원 로그인</h1>
                    </div>
                    <form:form class="user" id="frm" method="post" action="/emp/loginForm" modelAttribute="emp">
                    	<input type="hidden" name="nm" value="0" />
                      	<input type="hidden" name="addr" value="0" />
                      	<input type="hidden" name="hp" value="0" />
                      	<input type="hidden" name="postNo" value="0" />
                        <div class="form-group">
                            <form:input path="empNo" class="form-control form-control-user"
                                id="exampleInputEmail" placeholder="직원 ID 입력"/>
                            <font color="red"><form:errors path="empNo"></form:errors></font>
                        	<c:if test="${loginFail ne null }">
                        		<font color="red" size="1">${loginFail}</font>
                        	</c:if>
                        </div>
                        <div class="form-group">
                            <form:password path="password" class="form-control form-control-user"
                                id="exampleInputPassword" placeholder="비밀번호 입력" />
                             <font color="red"><form:errors path="password"></form:errors></font>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-checkbox small">
                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                            </div>
                        </div>
                        <button id="idLogin" class="btn btn-primary btn-user btn-block">
                            Login
                        </button>
                        <hr>
                        <a href="index.html" class="btn btn-google btn-user btn-block">
                            <i class="fab fa-google fa-fw"></i> Login with Google
                        </a>
                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                        </a>
                    </form:form>
                    <hr>
                    <div class="text-center">
                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                    </div>
                    <div class="text-center">
                        <a class="small" href="register.html">Create an Account!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
$(function(){
	$('#idLogin').click(()=>{
		$('#frm').submit();
	});//click
});//window.onload end
</script>
</body>
</html>