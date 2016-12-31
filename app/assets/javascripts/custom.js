/*
window.onload = function(){
	var allNode = document.getElementById("account_info");
	var buttonGroup = document.getElementById("btnGroup");

	var myButton = buttonGroup.getElementsByTagName("button");
	var myDiv = allNode.getElementsByTagName("div");

	for(var i=0; i < myButton.length; i++)
	{
		myButton[i].index = i;
		myButton[i].onclick = function(){
			for(var j = 0; j < myButton.length; j++){
				myButton[j].className= "off";
				myDiv.className = "hide";
			}
			this.display = "inline";
			myDiv[this.index].style.display = "inline"
		}
	}
	alert(myButton);

}
*/
window.onload = function(){
	var hide = document.getElementById('account_info');
	hide.style.display = "none";
}

function changeResult(myHide,myShow){
	var account1 = document.getElementById(myHide);
	account1.style.display = "none"
	var account2 = document.getElementById(myShow);
	account2.style.display = "inline"
}
