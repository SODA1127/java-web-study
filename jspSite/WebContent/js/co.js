/*
 * 공통 자바 스크립트 파일
 */
function is_null(v) {
	if (v == null || v == '') {
		return true;
	}
	return false;
}
function isSame(v1, v2) {
	if (v1 == null || v2 == null || v1.length == 0 || v2.length == 0) {
		return false;
	}
	if (v1 != v2) {
		return false;
	}
	return true;
}

function checkId(v3) {
	if (!(v3.length >= 5 && v3.length <= 10) || !(('A' <= v3.charAt(0)) && (v3.charAt(0) <= 'z'))) {
		return false;
	}
	return true;
}
var stringRegx = /[~!@\#$%<>^&*\()\-=+_\’]/gi;
function checkIdSpecialChar(v3){
	if(stringRegx.test(v3)){
		return false;
	}
	return true;
}