/**
 * 멤버 자바스크립트 파일
 */

function loadingFocus() {
	document.join.id.focus();
}

function join_form_submit() {
	if (is_null(document.join.id.value)) {
		document.join.id.focus();
		alert("아이디를 입력하세요!!!");
		return;
	}
	if(!checkId(document.join.id.value)){
		document.join.id.select();
		alert("5 ~ 10글자 이상이며 숫자 영문 소문자의 조합(첫 글자는 숫자가 오면 안됨)");
		return;
	}
	if(!checkIdSpecialChar(document.join.id.value)){
		document.join.id.select();
		alert("특수문자는 포함될 수 없습니다.");
		return;
	}
	if (is_null(document.join.pass.value)) {
		document.join.pass.focus();
		alert("패쓰워드를 입력하세요!!!");
		return;
	}
	if (is_null(document.join.repass.value)) {
		document.join.repass.focus();
		alert("패쓰워드확인을 입력하세요!!!");
		return;
	}

	if (!isSame(document.join.pass.value, document.join.repass.value)) {
		alert("패쓰워드와 패쓰워드확인은 일치하여야합니다.");
		document.join.pass.select();
		return;
	}

	/*
	 * 아이디 유효성 체크
	 * 1. 길이는 5~10자 사이
	 * 2. 숫자 영문 소문자의 조합(첫 글자는 숫자가 오면 안됨)
	 */

	if (!confirm("진짜로 가입할래요?")) {
		return;
	}

	document.join.action = '4.join_action.jsp';
	document.join.method = 'POST';
	document.join.submit();
}