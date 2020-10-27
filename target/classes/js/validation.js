function validation() {
	
	var fname = document.getElementById("fname").value;
	var lname = document.getElementById("lname").value;
	var dob = document.getElementById("dob").value;
	var mobile = document.getElementById("mobile").value;
	var pannumber = document.getElementById("pannumber").value;

	var mobileCheck = /^[789][0-9]{9}$/;
	var pannumberCheck = /[A-Z]{5}[0-9]{4}[A-Z]{1}$/;

	if (fname == "") {
		document.getElementById('fnameerror').innerHTML = "** First name empty";
		return false;
	} else {
		document.getElementById('fnameerror').innerHTML = "";
	}

	if (lname == "") {
		document.getElementById('lnameerror').innerHTML = "** Last name empty";
		return false;
	} else {
		document.getElementById('lnameerror').innerHTML = "";
	}

	if (dob == "") {
		document.getElementById('dobnameerror').innerHTML = "** select date of birth";
		return false;
	} else {
		document.getElementById('dobnameerror').innerHTML = "";
	}

	if (mobile == "") {
		document.getElementById('mobileerror').innerHTML = "** mobile number empty";
		return false;
	} else {
		document.getElementById('mobileerror').innerHTML = "";
	}
	if (pannumber == "") {
		document.getElementById('pannumbererror').innerHTML = "** pancard number empty";
		return false;
	} else {
		document.getElementById('pannumbererror').innerHTML = "";
	}
}