var i = 0;

function checkId() {
		var id = document.getElementById("userID").value;
		var spanNode = document.getElementById("userIDspan");
		var reg = /^([a-zA-Z0-9]){6,12}$/i;
		if (reg.test(id)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("userIDclass").className = "icon ticker";   
			return true;
		} else {
			spanNode.innerHTML = "Use 6-12 letters or digits for your username!".fontcolor("red");
			//document.getElementById("userIDlass").className = "icon into";    
			return false;
		}
	}
	function checkFname() {
		var name = document.getElementById("fName").value;
		var spanNode = document.getElementById("fNamespan");
		var reg = /^([a-zA-Z])+$/i;
		if (reg.test(name)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("nameclass").className = "icon ticker";   
			return true;
		} else {
			spanNode.innerHTML = "Invalid name, please try again!".fontcolor("red");
			//document.getElementById("nameclass").className = "icon into";    
			return false;
		}
	}
	function checkLname() {
		var name = document.getElementById("lName").value;
		var spanNode = document.getElementById("lNamespan");
		var reg = /^([a-zA-Z])+$/i;
		if (reg.test(name)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("nameclass").className = "icon ticker";   
			return true;
		} else {
			spanNode.innerHTML = "Invalid name, please try again!".fontcolor("red");
			//document.getElementById("nameclass").className = "icon into";    
			return false;
		}
	}
	function checkPassword() {
		var password = document.getElementById("password").value;
		var spanNode = document.getElementById("passwordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("passwordclass").className = "icon ticker";   
			return true;
		} else {
			spanNode.innerHTML = "Use 6-16 letters or digits for your password!".fontcolor("red");
			//document.getElementById("passwordclass").className = "icon into";    
			return false;
		}
	}
	function checkNewPassword() {
		var password = document.getElementById("newpassword").value;
		var spanNode = document.getElementById("newpasswordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("passwordclass").className = "icon ticker";   
			return true;
		} else {
			spanNode.innerHTML = "Use 6-16 letters or digits for your password!".fontcolor("red");
			//document.getElementById("passwordclass").className = "icon into";    
			return false;
		}
	}
	function checkSame() {
		var password = document.getElementById("password").value;
		var password2 = document.getElementById("confirmpassword").value;
		var spanNode = document.getElementById("confirmpasswordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password2)) {
			if (password == password2) {
				spanNode.innerHTML = "".fontcolor("green");
				//document.getElementById("confirmpasswordclass").className = "icon ticker";   
				return true;
			} else {
				spanNode.innerHTML = "Those passwords didn't match. Please try again!".fontcolor("red");
				//document.getElementById("confirmpasswordclass").className = "icon into";    
				return false;
			}
		} else {
			spanNode.innerHTML = "Use 6-16 letters or digits for your password!".fontcolor("red");
			//document.getElementById("confirmpasswordclass").className = "icon into";    
			return false;
		}
	}
	function checkAgain(n) {
		i = n;
		var password = document.getElementById("password").value;
		var spanNode = document.getElementById("passwordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password)) {
			if (password == n) {
				spanNode.innerHTML = "".fontcolor("green");
				//document.getElementById("confirmpasswordclass").className = "icon ticker";   
				return true;
			} else {
				spanNode.innerHTML = "Those passwords didn't match. Please try again!".fontcolor("red");
				//document.getElementById("confirmpasswordclass").className = "icon into";    
				return false;
			}
		} else {
			spanNode.innerHTML = "Use 6-16 letters or digits for your password!".fontcolor("red");
			//document.getElementById("confirmpasswordclass").className = "icon into";    
			return false;
		}
	}
	function checkNewSame() {
		var password = document.getElementById("newpassword").value;
		var password2 = document.getElementById("confirmnewpassword").value;
		var spanNode = document.getElementById("confirmnewpasswordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password2)) {
			if (password == password2) {
				spanNode.innerHTML = "".fontcolor("green");
				//document.getElementById("confirmpasswordclass").className = "icon ticker";   
				return true;
			} else {
				spanNode.innerHTML = "Those passwords didn't match. Please try again!".fontcolor("red");
				//document.getElementById("confirmpasswordclass").className = "icon into";    
				return false;
			}
		} else {
			spanNode.innerHTML = "Use 6-16 letters or digits for your password!".fontcolor("red");
			//document.getElementById("confirmpasswordclass").className = "icon into";    
			return false;
		}
	}
	function checkTel() {
		var tel = document.getElementById("userTel").value;
		var spanNode = document.getElementById("userTelspan");
		var reg = /^([0-9]){11}$/i;
		if (reg.test(tel)) {
			spanNode.innerHTML = "".fontcolor("green");
			//document.getElementById("userTelclass").className = "icon ticker";    
			return true;
		} else {
			spanNode.innerHTML = "Invalid phone number, please enter 11 digits!".fontcolor("red");
			//document.getElementById("userTelclass").className = "icon into";    
			return false;
		}
	}
	function checkAll() {
		var id = checkId();
		var fname = checkFname();
		var lname = checkLname();
		var password = checkPassword();
		var same = checkSame();
		var tel = checkTel();
		if (id && fname && lname && password && same && tel) {
			return true;
		} else {
			return false;
		}

	}
	function checkAll_change() {
		var id = checkId();
		var fname = checkFname();
		var lname = checkLname();
		var opassword = checkAgain(i);
		var npassword = checkNewPassword();
		var nsame = checkNewSame();
		var tel = checkTel();
		if (id && fname && lname && opassword && npassword && nsame && tel) {
			return true;
		} else {
			return false;
		}

	}