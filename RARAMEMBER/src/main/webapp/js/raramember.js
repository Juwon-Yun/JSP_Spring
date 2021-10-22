$(function() {
	var nameRE = /^[가-힣]{2,5}$/;
	var ps1Val = $('#ps1').val();
	var passRE = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
	var idRE = /^[a-zA-Z0-9].{5,20}$/;
	var emailChk = 0;
	// 이름 일치 확인
	$('#name').keyup(()=>{
		if( !nameRE.test($('name').val()) ){
			$('#name').css('color', 'red');
		}else{
			$('#name').text("사용 가능한 이름입니다.");
			$('#name').css('color', 'green');
		}
	});
	
	// 아이디 일치확인
	$('#memid').keyup(()=>{
		if( !idRE.test($('#memid').val()) ){
			$('#idRECheck').css('color', 'red');
		}else{
			$('#idRECheck').text("사용 가능한 아이디 입니다.");
			$('#idRECheck').css('color', 'green');
		}
	});//아이디 일치확인 끝
	
	// 아이디 중복체크
	$('#idBtn').click(() => {
		var idVal = $('#memid').val();
		$.ajax({
			url: '/memberController.rara',
			type: 'post',
			data: {
				'opt': 'idCheck',
				'id': idVal
			},
			success: function(res) {
				if (res == 1) {
					$('#idBtnResDiv').text("이미 존재하는 아이디 입니다");
					$('#idBtnResDiv').css('color', 'red');
				} else {
					$('#idBtnResDiv').text("아이디 중복체크 완료");
					$('#idBtnResDiv').css('color', 'green');
				}
			},
			error: function() { },
			dataType: 'json'
		});//ajax

	});//click
	
	// 비밀번호 일치확인
	$('#ps1').keyup(() => {
		if (!passRE.test(ps1Val)) {
			$('#psdiv').text("영문, 숫자, 특수문자를 포함한 8~20자리 이내로 입력");
			$('#psdiv').css('color', 'red');
		} else {
			if ($('#ps1').val() != $('#ps2').val()) {
				$('#psdiv').text("비밀번호가 일치하지않음.");
				$('#psdiv').css('color', 'red');
			}
		}
	});

	$('#ps2').keyup(() => {
		if ($('#ps1').val() == $('#ps2').val()) {
			$('#psdiv').text("비밀번호가 일치합니다.");
			$('#psdiv').css('color', 'green');
		} else {
			if ($('#ps1').val() != $('#ps2').val()) {
				$('#psdiv').text("비밀번호가 일치하지않음.");
				$('#psdiv').css('color', 'red');
			}
		}
	});
	// 여기까지 비밀번호 일치확인
	
	// 이메일 선택
	$('#selectBtn').on('click', ()=>{
		var selectVal = $("#selectBtn option:selected").val();
		if( selectVal == "네이버" ){
			$('#email').val("naver.com");
		}else if( selectVal == "다음" ){
			$('#email').val("daum.net");
		}else if( selectVal == "구글" ){
			$('#email').val("google.com");
		}else if( selectVal == "직접 입력" ){
			$('#email').val("");
		}
	});
	// 여기까지 이메일 선택
	
	// 이메일 수신체크
	$('#mailChk').on('click', ()=>{
		if($("input:checkbox[id=mailChk]").is(":checked") == true) {
			emailChk = 1;
		}
	});
	// 이메일 수신체크
	
	// 회원등록
	$('#insertBtn').click(() => {
		var name = $('#name').val();
		var memid = $('#memid').val();
		ps1Val = $('#ps1').val();
		var emailid = $('#emailid').val();
		var email = $('#email').val();
		email = emailid +"@"+ email;
		$.ajax({
			url: '/memberController.rara',
			type: 'post',
			data: {
				'opt': 'insert',
				'name':name,
				'memid':memid,
				'ps1Val':ps1Val,
				'email':email,
				'emailChk':emailChk
			},
			success: function(res) {
				alert("회원가입이 완료되었습니다.");
			},
			error: function(){},
			dataType: 'json'
		});//ajax

	});//click
	// 회원 등록 완료
	
	
});//window.onload








