    function checkUser() {
		var username = document.getElementById("username").value;
		var spanNode = document.getElementById("usernamespan");
		var reg = /^([a-zA-Z0-9]){6,12}$/i;
		if (reg.test(username)) {
			spanNode.innerHTML = "".fontcolor("green"); 
			return true;
		} else {
			spanNode.innerHTML = "Invalid username, try again!".fontcolor("red");   
			return false;
		}
	}
	function checkPassword() {
		var password = document.getElementById("password").value;
		var spanNode = document.getElementById("passwordspan");
		var reg = /^([a-zA-Z0-9]){6,16}$/i;
		if (reg.test(password)) {
			spanNode.innerHTML = "".fontcolor("green");  
			return true;
		} else {
			spanNode.innerHTML = "Invalid password, try again!".fontcolor("red");
			return false;
		}
	}
	function checkAll() {
		var user = checkUser();
		var password = checkPassword();
		if (user && password) {
			return true;
		} else {
			return false;
		}
	}