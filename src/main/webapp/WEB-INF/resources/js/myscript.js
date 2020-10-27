function validation() {

	var fname = document.getElementById("fname").value;
	var lname = document.getElementById("lname").value;
	var dob = document.getElementById("dob").value;
	var mobile = document.getElementById("mobile").value;
	var hobby = document.getElementById("hobby").value;

	var pannumber = document.getElementById("pannumber").value;
	var panRegex = /[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
	var flag = panRegex.test(pannumber);

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

	if (hobby == "") {
		document.getElementById("hobbyerror").innerHTML = "** Please check atleast one hobby";
		return false;
	} else {
		document.getElementById("hobbyerror").innerHTML = "";
	}

	if (mobile == "") {
		document.getElementById("mobileerror").innerHTML = "** Mobile number should not be empty";
		return false;
	} else if (isNaN(mobile)) {
		document.getElementById("mobileerror").innerHTML = "** Mobile number only numeric value allowe";
		return false;
	} else if (mobile.length < 10) {
		document.getElementById("mobileerror").innerHTML = "** Mobile number must be 10 digit";
		return false;
	} else if (mobile.length > 10) {
		document.getElementById("mobileerror").innerHTML = "** Mobile number must be 10 digit";
		return false;
	} else if (mobile.charAt(0) != 9 && mobile.charAt(0) != 8
			&& mobile.charAt(0) != 7) {
		document.getElementById("mobileerror").innerHTML = "** Mobile number must start with 9, 8 and 7";
		return false;
	} else {
		document.getElementById("mobileerror").innerHTML = "";
	}
	if (pannumber == "") {
		document.getElementById('pannumbererror').innerHTML = "** Pancard Number Can not be empty";
		return false;
	} else if (flag == false) {
		document.getElementById('pannumbererror').innerHTML = "** Invalid Pan Number";
		return false;
	} else {
		document.getElementById('pannumbererror').innerHTML = "";
	}

}

$(document).ready(function() {

	$('.chk').click(function() {
		var text = "";
		$('.chk:checked').each(function() {
			text += $(this).val() + ',';
		});
		text = text.substring(0, text.length - 1);
		console.log(text);
		$('#hobby').val(text);
	});

	$('#state').on('change', function() {
		var sName = $(this).val();
		$.ajax({
			type : 'GET',
			url : '/SpringMVCHibernateCRUD/ajaxStateData',
			data : 'sName=' + sName,
			success : function(city) {
				var res = city.split(",");
				var cities = "<option>---Select city---</option>";
				for (var i = 0; i < res.length; i++) {
					console.log(res[i]);
					cities = cities + "<option>" + res[i] + "</option>";
				}
				document.getElementById("city").innerHTML = cities;
			},
			error : function() {
				console.log("inside error ");
			}
		});
	});
});
