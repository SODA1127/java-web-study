function isNull(obj){
				if(obj.value==""){
					obj.focus();
						return true;
				}
			return false;
}
function isSame(obj1,obj2){
	var str1=obj1.value;
	var str2=obj2.value;
	
	if(str1.length==0 || str2.length==0){
		return false;
	}
	
	if(str1==str2){
		return true;
	}
	return false;
}

// ���� �Էµ� ������ ���̰� ���ϴ� ���̺��� ª������ ���� 
function isShort(obj, len, msg) {
	var str = obj.value;
	if(str.length < len) {
		if(msg) {
			alert(msg);	
		}
		obj.focus();
		obj.select();
		return true;
	}
	return false;
}

// �������� �ԷµǾ������� ����
function isAlphabet(obj) {
	var str = obj.value;
	if(str.length == 0){
		return false;
	}
	str = str.toUpperCase();
    var first=  str.charAt(0); 
	
	if(('A' <=first) &&(first <= 'Z')){
			return true;
	}
	return false;
}