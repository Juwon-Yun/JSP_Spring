<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<title>아작스를 통한 이미지 업로드</title>
<style type="text/css">
.imgs_wrap{
	width: 300px;
	margin-top: 50px;
}
.imgs_wrap img{
	max-width: 100%;
}
</style>
</head>
<body>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">아작스를 통한 이미지 업로드</h1>
	</div>
</div>

<div class="container">
	<div class="form-group row">
		<label class="col-sm-2">이미지</label>
		<div class="col-sm-3">
			<input type="file" name="uploadFile" id="input_img" multiple>		
		</div>
		<div class="col-sm-offset-2 col-sm-10">
			<input id="uploadBtn" type="button" class="btn btn-primary" value="업로드">
		</div>
		<div>
			<div class="imgs_wrap">
			</div>
		</div>
	</div>
</div>

<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
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
				$(".imgs_wrap").append(img_html);
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
	
	$('#uploadBtn').click((e)=>{
		// jQuery를 이용하여 파일 업로드 하기위해
		// FormData 객체(가상의 form 태그)를 이용한다.
		// 해당 객체에 필요한 파라미터를 담아서 전송함
		var formData = new FormData();
		
		// input 요소에 name 속성의 값이 uploadFile인 것을 찾아서
		// 자바스크립트의 inputFile 객체에 할당
		var inputFile =  $('input[name="uploadFile"]');		
		// 첫 번째 파일 요소 안에 업로드 할 이미지들이 있는데
		// 그 이미지 객체들을 files 객체에 할당
		var files = inputFile[0].files;
		
		// console.log("files : " + files);
		// 결과) files : [object FileList]
		
		// 파일 객체(files)를 가상의 form(formData)에 추가
		for(var i = 0; i < files.length; i++){
			// 조건식이 false이면 if문 실행됨
			// true면 통과, false면 문제발생
			if(!ckeckExtension(files[i].name, files[i].size)){
				//프로그램 종료
				return false;
			}
			
			//uploadFile이라는 이름으로 files[i] 하나씩 붙인다
			formData.append("uploadFile", files[i]);	
		}

		// console.log("formData : "+formData);
		// 결과) formData : [object FormData]
		
		// ajax를 통해서 formData 자체를 전송 할 경우
		// processData : false, contentType : false 를 꼭 기재해야 함.
		$.ajax({
			url: '/uploadAjaxAction',
			processData : false,
			contentType : false,
			type: 'POST',
			data: formData,
			async : false,
			success:function(result){
				alert("uploaded");
				console.log(result);				
			},
			error:function(){},
		});
	})
})
</script>
</body>
</html>












