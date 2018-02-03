var a, b;
function test(a, b) {
	document.write(a + b);
}

var value;
function alertMsg(value) {
	alert(`밸류값은 ${value}입니다`);
}

var stringFactory;
var count = 0;
function factory(stringFactory){
	var a = document.getElementById('ul');
	a.innerHTML+=`<li>${++count}</li>`;
}

