var allCheck = document.querySelector(".allCheck");
	var list = document.querySelectorAll(".check");
	
	allCheck.onlick = () => {
		if(allCheck.checked) {
			for(var i=0; i<list.length; i++) {
				list[i].checked = true;
			}
		} else {
			for(var i=0; i<list.length; i++) {
				list[i].checked = false;
			}
		}
	}
	
var del =document.querySelector(".del");
	
del.onclick = () => {
	for(var i=0; i<list.length; i++) {
		if(list[i].checked) {
			list[i].parentElement.parentElement.remove();
		}
	}
}