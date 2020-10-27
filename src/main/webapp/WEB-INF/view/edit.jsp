<%@page import="java.util.Map"%>
<%@page import="com.model.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit page</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/validation.js"/>"></script> --%>



<!-- DatePicker -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<script src="/SpringMVCHibernateCRUD/resources/js/myscript.js"></script>

<!-- 
<script type="text/javascript">
	$(document).ready(function() {

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
		});

		$('#state').on('change', function() {
			var sName = $(this).val();
			console.log(sName);
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

	function validation() {

		alert("inside edit");

		var fname = document.getElementById("fname").value;
		var lname = document.getElementById("lname").value;
		var dob = document.getElementById("dob").value;
		var mobile = document.getElementById("mobile").value;
		var pannumber = document.getElementById("pannumber").value;

		if (fname == "") {
			document.getElementById('fnameerror').innerHTML = "** First name empty";
			return false;
		} else {
			document.getElementById('fnameerror').innerHTML = "";
		}

		alert("lname " + lname);
		if (lname == "") {
			alert("inside lname if");
			document.getElementById('lnameerror').innerHTML = "** Last name empty";
			return false;
		} else {
			alert("inside lname else");
			document.getElementById('lnameerror').innerHTML = "";
		}
		alert("inside dob");
		if (dob == "") {
			document.getElementById('dobnameerror').innerHTML = "** select date of birth";
			return false;
		} else {
			document.getElementById('dobnameerror').innerHTML = "";
		}

		/* if (mobile == "") {
			document.getElementById('mobileerror').innerHTML = "** mobile number empty";
			return false;
		} else {
			document.getElementById('mobileerror').innerHTML = "";
		} */
		alert("mobile if");
		if (mobile == "") {
			alert("inside if");
			document.getElementById("mobileerror").innerHTML = "** Mobile number should not be empty";
			return false;
		} else if (isNaN(mobile)) {
			alert("inside isNAN");
			document.getElementById("mobileerror").innerHTML = "** Mobile number only numeric value allowe";
			return false;
		} else if (mobile.length < 10) {
			alert("inside < 10");
			document.getElementById("mobileerror").innerHTML = "** Mobile number must be 10 digit";
			return false;
		} else if (mobile.length > 10) {
			alert("inside > 10");
			document.getElementById("mobileerror").innerHTML = "** Mobile number must be 10 digit";
			return false;
		} else if (mobile.charAt(0) != 9 && mobile.charAt(0) != 8
				&& mobile.charAt(0) != 7) {
			alert("inside 789");
			document.getElementById("mobileerror").innerHTML = "** Mobile number must start with 9, 8 and 7";
			return false;
		} else {
			document.getElementById("mobileerror").innerHTML = "";
		}
		if (pannumber == "") {
			document.getElementById('pannumbererror').innerHTML = "** pancard number empty";
			return false;
		} else {
			document.getElementById('pannumbererror').innerHTML = "";
		}
	}
</script> -->
<script type="text/javascript">
	$(function() {
		var date = new Date();
		date.setDate(date.getDate());
		$('#datepicker1').datepicker({
			endDate : date,
			dateFormat : 'mm-dd-yy',
		});
	});
</script>
</head>
<body>
	<%
		UserDetails userDetails = (UserDetails) request.getAttribute("userDetails");
		System.out.println("inside jsp gender " + userDetails.getGender());
		System.out.println("inside jsp getHobby " + userDetails.getHobby());
		String checked = "checked";
		String selected = "selected";
	%>
	<div class="container">
		<h2 class="text-center">Update Details</h2>
		<form action="/SpringMVCHibernateCRUD/updateUserDetails" method="post"
			onsubmit="return validation()">
			<div class="form-group">
				<label for="fname">First Name</label> <input type="text"
					class="form-control" id="fname" name="fName"
					value="<%=userDetails.getfName()%>"> <span
					class="text-danger font-weight-bold" id="fnameerror"></span>
			</div>

			<div class="form-group">
				<label for="lname">Last Name</label> <input type="text"
					class="form-control" id="lname" name="lName"
					value="<%=userDetails.getlName()%>"> <span
					class="text-danger font-weight-bold" id="lnameerror"></span>
			</div>

			<%-- <div class="form-group">
				<label for="dob">Date of Birth</label> <input type="date"
					class="form-control" id="dob" name="dob"
					value="<%=userDetails.getDob()%>"> <span
					class="text-danger font-weight-bold" id="dobnameerror"></span>
			</div> --%>

			<div class="form-group">
				<label for="dob">Date of Birth</label>
				<div class='input-group date' id='datepicker1'>
					<input type="text" class="form-control" name="dob" id="dob"
						value="<%=userDetails.getDob()%>" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				<span class="text-danger font-weight-bold" id="dobnameerror"></span>
			</div>

			<div class="form-group">
				<input type="hidden" class="form-control" name="creationDate"
					value="<%=userDetails.getCreationDate()%>">
			</div>

			<label> Gender : &nbsp;&nbsp;</label>
			<%
				if ("male".equals(userDetails.getGender())) {
			%>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender" id="male"
					value="male" checked="checked"> <label
					class="form-check-label" for="male"> Male </label>
			</div>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender"
					id="female" value="female"> <label class="form-check-label"
					for="female"> Female</label>
			</div>
			<%
				} else {
			%>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender" id="male"
					value="male"> <label class="form-check-label" for="male">
					Male </label>
			</div>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender"
					id="female" value="female" checked="checked"> <label
					class="form-check-label" for="female"> Female</label>
			</div>
			<%
				}
			%>

			<br> <label> Hobbies : &nbsp;&nbsp;</label>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="cricket"
					<%=userDetails.getHobby().contains("cricket") == true ? checked : ""%>>Cricket
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="dancing"
					<%=userDetails.getHobby().contains("dancing") == true ? checked : ""%>>Dancing
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="singing"
					<%=userDetails.getHobby().contains("singing") == true ? checked : ""%>>Singing
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="reading"
					<%=userDetails.getHobby().contains("reading") == true ? checked : ""%>>Reading
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="writing"
					<%=userDetails.getHobby().contains("writing") == true ? checked : ""%>>Writing
				</label>
			</div>

			<div class="form-group">
				<input type="hidden" class="form-control" id="hobby" name=hobby
					value="<%=userDetails.getHobby() == null ? "" : userDetails.getHobby()%>" />
				<span class="text-danger font-weight-bold" id="hobbyerror"></span>
			</div>

			<div class="form-group">
				<label for="state">Select State</label> <select class="form-control"
					name="state" id="state">
					<option value="">---Select state---</option>
					<%
						Map<String, String> states = (Map<String, String>) request.getAttribute("sMap");

						for (Map.Entry<String, String> entry : states.entrySet()) {
					%>
					<option value="<%=entry.getKey()%>"
						<%=userDetails.getState().contains(entry.getKey()) == true ? selected : ""%>><%=entry.getValue()%></option>
					<%
						}
					%>
				</select>
			</div>

			<div class="form-group">
				<label for="city">Select City</label> <select class="form-control"
					name="city" id="city">
					<option value="">---Select city---</option>
					<option
						<%=userDetails.getCity() == null || userDetails.getCity() == "" ? "" : selected%>><%=userDetails.getCity() == null || userDetails.getCity() == "" ? "" : userDetails.getCity()%></option>
				</select>
			</div>
			<br>

			<div class="form-group">
				<label for="mobile">Mobile Number</label> <input type="text"
					class="form-control" id="mobile" name="mobile"
					value="<%=userDetails.getMobile()%>"> <span
					class="text-danger font-weight-bold" id="mobileerror"></span>
			</div>

			<div class="form-group">
				<label for="pannumber">Pan Number</label> <input type="text"
					class="form-control" id="pannumber" name="pannumber"
					value="<%=userDetails.getPannumber()%>"> <span
					class="text-danger font-weight-bold" id="pannumbererror"></span>
			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" name="id"
					value="<%=userDetails.getId()%>">
			</div>

			<div class="form-group">
				<input type="hidden" class="form-control" name="imageName"
					value="<%=userDetails.getImageName()%>">
			</div>

			<div class="container text-center">
				<a href="/SpringMVCHibernateCRUD/view"
					class="btn btn-outline-danger">Back</a>
				<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
	</div>

</body>
</html>