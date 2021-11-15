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
	<title>직원 상세정보</title>
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
<form method="post" action="/emp/deletePost" id="frm">
	<input type="hidden" name="empNo" value="${param.empNo}" >
</form>
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">직원 상세</h1>
                            </div>
                            <form:form class="user" method="post" modelAttribute="empVo" action="/emp/detailPost">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:input path="empNo" class="form-control form-control-user" 
                                            placeholder="직원번호" readonly="true" />
                                        <font color="red" size="1">
                                           <form:errors path="empNo"/>
                                        </font>
                                    </div>
                                    <div class="col-sm-6">
                                        <form:input path="nm" class="form-control form-control-user" 
                                            placeholder="이름" readonly="true" />
                                        <font color="red" size="1">
                                           <form:errors path="nm"/>
                                        </font>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:input path="hp" class="form-control form-control-user"
                                        placeholder="연락처" readonly="true"/>
                                    <font color="red" size="1">
                                       <form:errors path="hp"/>
                                      </font>
                                </div>
                                <div class="form-group">
                                    <form:input path="postNo" class="form-control form-control-user"
                                        placeholder="우편번호" readonly="true"/>
                                    <font color="red" size="1">
                                       <form:errors path="postNo"/>
                                      </font>
                                </div>
                                <div class="form-group">
                                    <form:input path="addr" class="form-control form-control-user"
                                        placeholder="주소" readonly="true"/>
                                    <font color="red" size="1">
                                       <form:errors path="addr"/>
                                      </font>
                                </div>
                                <div class="form-group">
                                    <form:input path="addr2" class="form-control form-control-user"
                                        placeholder="상세주소" readonly="true"/>
                                    <font color="red" size="1">
                                       <form:errors path="addr2"/>
                                    </font> 
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <input type="password" id="password2" class="form-control form-control-user"
                                            placeholder="비밀번호 확인" readonly>
                                        <font color="red" size="1" id="idFont" style="display:none;">
                                          비밀번호가 다릅니다.
                                       </font> 
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <form:hidden path="password" class="form-control form-control-user"
                                            placeholder="비밀번호" readonly="true" />
                                        <font color="red" size="1">
                                          <form:errors path="password"/>
                                       </font>
                                    </div>
                                </div>
                                <div class="form-group row" id="divEdit">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   <a href="#" id="idUpdate" class="btn btn-primary btn-user btn-block">
                                       수정
                                   </a>
                                   </div>
                                   <div class="col-sm-6">
                                   <a href="#" id="idDelete" class="btn btn-primary btn-user btn-block">
                                       삭제
                                   </a>
                                   </div>
                                </div>
                                <div class="form-group row" id="divConfirm" style="display:none;">
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                   <a href="#" id="idOk" class="btn btn-primary btn-user btn-block">
                                       확인
                                   </a>
                                   </div>
                                   <div class="col-sm-6">
                                   <a href="#" id="idCancel" class="btn btn-primary btn-user btn-block">
                                       취소
                                   </a>
                                   </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Modal 추가 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">ddit</h4>
         </div>
         <div class="modal-body">처리가 완료되었습니다.</div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
      </div>
   </div>
</div>
<!-- Modal 추가 끝 -->

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/resources/js/sb-admin-2.min.js"></script>
<script type="text/javascript">
$(function(){
	//수정 버튼 클릭을 하면 수정모드가 됨
	$('#idUpdate').click(()=>{
		//수정 가능하도록 함
		$('form:input').removeAttr('readonly');
		//단, 직원번호는 수정할 수 없음
		$('#empNo').attr('readonly', true);
		
		$('#divEdit').css('display', 'none');
		
		$('#divConfirm').css('display', 'block');
		
	 //취소 버튼 클릭을 하면 보기모드가 됨
        $("#idCancel").on("click",function(){
           $("input").attr("readonly","readonly");
           
           $("#divEdit").css("display","");
           $("#divConfirm").css("display","none");
        });
       
	 //확인 버튼 클릭 시 직원 정보를 수정
     $("#idOk").on("click",function(){
       //비밀번호 확인 처리
       if($("#password").val()==$("#password2").val()){
          //폼을 submit함
          $(".user").submit();                
       }else{
          //모달창의 내용을 변경
          $(".modal-body").html("비밀번호가 다릅니다.");
          //모달창을 보여주는 구문
          $("#myModal").modal("show");
          
          $("#idFont").css("display","block");
       }
     
     // 퇴직 처리
     $('#idDelete').click(()=>{
    	 let yn = confirm("해당 사원을 퇴직처리 하시겠습니까?");
    	 if(yn){
			$('#frm').submit();
    	 }
     });
         
	});
});
</script>
</body>
</html>