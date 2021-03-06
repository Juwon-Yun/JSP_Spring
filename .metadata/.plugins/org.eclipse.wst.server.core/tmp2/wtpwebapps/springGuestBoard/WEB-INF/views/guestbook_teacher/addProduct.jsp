<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>/guestbook/addProduct.jsp</title>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/validation.js"></script>
<style type="text/css">
.imgs_wrap{
	width:300px;
	margin-top:50px;
}
.imgs_wrap img{
	max-width:100%;
}
</style>
</head>
<body>
<!-- 
fmt:bundle => 태그 몸체에서 사용할 리소스 번들을 지정함
fmt:message => 메시지를 출력
fmt:setBundle => 특정 메시지 번들을 사용할 수 있도록 로딩함

위치 : src/bundle/message.properties 및 src/bundle/message_en.properties
-->
<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<c:import url="/guestbook_teacher/menu" />
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><fmt:message key="title" /></h1>
	</div>
</div>
<div class="container">
	<div class="text-right">
		<a href="?language=ko">Korean</a>|
		<a href="?language=en">English</a>&nbsp;
	</div>
	<form name="newProduct" action="addProductPost" 
		class="form-horizontal" method="post" enctype ="multipart/form-data">
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productId" /></label>
			<div class="col-sm-3">
				<input type="text" name="productId" id="productId" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="pname" /></label>
			<div class="col-sm-3">
				<input type="text" name="pname" id="name" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
			<div class="col-sm-3">
				<input type="text" name="unitPrice" id="unitPrice" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="description" /></label>
			<div class="col-sm-3">
			<!-- 
				WYSIWYG 에디터
				1) ckeditor
				2) 서머노트
			 -->
				<textarea name="description" id="content" style="width: 1000px;" cols="50" rows="10" class="form-control"></textarea>
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="category" /></label>
			<div class="col-sm-3">
				<input type="text" name="category" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
			<div class="col-sm-3">
				<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" />
			</div>			
		</div>	
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="condition" /></label>
			<div class="col-sm-3">
				<input type="radio" name="condition" value="New" /><fmt:message key="condition_New" />
				<input type="radio" name="condition" value="Old" /><fmt:message key="condition_Old" />
				<input type="radio" name="condition" value="Refurbished" /><fmt:message key="condition_Refurbished" />
			</div>			
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productImage" /></label>
			<div class="col-sm-5">
				<input type="file" name="productImage" id="input_img" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" 
					onclick="CheckAddProduct()" />
			</div>
		</div>
	</form>
</div>
<div class="imgs_wrap"></div>
</fmt:bundle>
<c:import url="/guestbook_teacher/footer" />
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace("content");
		//이미지 미리보기
		var sel_file = [];
		
		//input type=file의 id=input_img...
		$('#input_img').on('change', handleImgFileSelect);
		
		function handleImgFileSelect(e){
			// 이벤트가 발생된 타겟 안에 들어있는 이미지 파일들
			var files = e.target.files;
			// 이미지가 여러개 있을 수 있으므로 이미지들을 분리해서 배열로 만든다 
			var filesArr = Array.prototype.slice.call(files);
			
			// 파일 타입의 배열 반복, f는 배열 안에 들어있는 이미지 파일 객체
			filesArr.forEach(function(f){
				// 이미지 파일이 아닌 경우 이미지 미리보기 실패
	 			if(!f.type.match("image.*")){
					alert("이미지 확장자만 사용 가능합니다.");
					return;
				}
				
				// 미리 선언된 전역변수(배열)에 이미지 객체를 f 대신 전역변수에 할당
				sel_file.push(f);
				
				// 이미지 객체를 읽을 reader 객체 생성
				var reader = new FileReader();
				
				// e : onchange 이벤트가 발생된 그 객체
				reader.onload = function(e){
					// e.target(이미지 객체)
					// e.target.result(reader가 이미지를 다 읽은 결과)
					var img_html = "<img src=\"" + e.target.result + "\" />";
					// div 사이에 이미지가 렌더링되어 화면에 보임
					$(".imgs_wrap").html(img_html);
				}
				
				// reader를 다음 이미지 파일(f)을 위해 초기화
				reader.readAsDataURL(f);
				
			}); // end foreach
		}
		
		// 정규식 변수 선언
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf|txt|pptx|word)$");
		// 해당 확장자들은 쓰지 못하게막는다.
		
		// 5Mb
		var maxSize = 5242880;
		
		// 파일명과 파일크기를 체크하는 함수
		function ckeckExtension(fileName, fileSize){
			// 파일 크기 체크
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			// 파일명의 정규식 체크
			if(regex.test(fileName)){
				alert("해당 확장자 파일을 업로드할 수 없습니다.");
				return false;
			}
			
			//문제가 없다면
			return true;
		}
	});
</script>
</body>
</html>





