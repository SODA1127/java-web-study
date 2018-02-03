

function guestCreateForm() {
	document.f.action = 'guest_write_form.jsp';
	document.f.submit();
}
function guestModifyAction() {
	document.f.action = "guest_modify_action.jsp";
	document.f.submit();
}

function guestList() {
	document.f.action = "guest_list.jsp";
	document.f.submit();
}

function guestModify() {
	f.action = "guest_modify_form.jsp";
	f.method = "POST";
	f.submit();
}
function guestRemove() {
	if (window.confirm("삭제하시겠습니까?")) {
		f.action = "guest_remove_action.jsp";
		f.submit();
	}
}
function guestCreate() {
	if (document.f.guest_name.value == "") {
		alert("게스트란이 비었습니다.");
		f.guest_name.focus();
		return false;
	}
	if (f.guest_email.value == "") {
		alert("이메일란이 비었습니다.");
		f.guest_email.focus();
		return false;
	}
	if (f.guest_homepage.value == "") {
		alert("홈피란이 비었습니다.");
		f.guest_homepage.focus();
		return false;
	}

	if (f.guest_title.value == "") {
		alert("제목란이 비었습니다.");
		f.guest_title.focus();
		return false;
	}
	if (f.guest_content.value == "") {
		alert('내용란이 비었습니다.');
		f.guest_content.focus();
		return false;
	}

	f.action = "guest_write_action.jsp";
	f.method = "GET";
	f.submit();
}