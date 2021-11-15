$('#addSession').click(()=>{
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		//폼 문의 action 속성 값을 실행
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
});
