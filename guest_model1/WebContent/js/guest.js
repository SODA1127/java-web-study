/**
 * 
 */

function guestCreateForm() {
	document.f.action = 'guest_write.jsp';
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
	document.f.action = "guest_modify.jsp";
	document.f.method = "POST";
	document.f.submit();
}
function guestRemove() {
	if (window.confirm("���� �����Ͻðڽ��ϱ�?")) {
		document.f.action = "guest_remove_action.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
}
function guestCreate() {
	if (document.f.guest_name.value == "") {
		alert("�̸��� �Է��Ͻʽÿ�.");
		document.f.guest_name.focus();
		return false;
	}
	if (document.f.guest_email.value == "") {
		alert("�̸����� �Է��Ͻʽÿ�.");
		document.f.guest_email.focus();
		return false;
	}
	if (document.f.guest_homepage.value == "") {
		alert("Ȩ�������� �Է��Ͻʽÿ�.");
		document.f.guest_homepage.focus();
		return false;
	}

	if (document.f.guest_title.value == "") {
		alert("������ �Է��Ͻʽÿ�.");
		document.f.guest_title.focus();
		return false;
	}
	if (document.f.guest_content.value == "") {
		alert("������ �Է��Ͻʽÿ�.");
		document.f.guest_content.focus();
		return false;
	}

	document.f.action = "guest_write_action.jsp";
	document.f.method = "POST";
	document.f.submit();
}
