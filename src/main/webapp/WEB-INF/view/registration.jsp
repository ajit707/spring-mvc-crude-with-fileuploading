<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration page</title>

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

<script src="<c:url value="/resources/js/myscript.js"/>"></script>
<script type="text/javascript">
	$(function() {
		var date = new Date();
		date.setDate(date.getDate());
		$('#datepicker1').datepicker({
			endDate : date,
		});
		$('#datepicker1').datepicker("setDate", new Date());
	});
</script>

</head>
<body>
	<div class="container">
		<h2 class="text-center text-white"
			style="background-color: #F99D27; margin-top: 20px">Registration
			Form</h2>

		<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
		%>

		<h3 class="text-center"><%=msg%></h3>

		<%
			}
			String errorMsg = (String) request.getAttribute("errorMsg");
		%>
		<h4 class="text-center" style="color: red"><%=errorMsg == null ? "" : errorMsg%></h4>
		<form action="/SpringMVCHibernateCRUD/register" method="post"
			enctype="multipart/form-data" onsubmit="return validation()">
			<div class="form-group">
				<label for="fname">First Name</label> <input type="text"
					class="form-control" id="fname" name="fName"> <span
					class="text-danger font-weight-bold" id="fnameerror"></span>
			</div>

			<div class="form-group">
				<label for="lname">Last Name</label> <input type="text"
					class="form-control" id="lname" name="lName"> <span
					class="text-danger font-weight-bold" id="lnameerror"></span>
			</div>

			<!-- <div class="form-group">
				<label for="dob">Date of Birth</label> <input type="date"
					class="form-control" id="dob" name="dob"> <span
					class="text-danger font-weight-bold" id="dobnameerror"></span>
			</div> -->

			<div class="form-group">
				<label for="dob">Date of Birth</label>
				<div class='input-group date' id='datepicker1'>
					<input type='text' class="form-control" name="dob" id="dob" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				<span class="text-danger font-weight-bold" id="dobnameerror"></span>
			</div>

			<label> Gender : &nbsp;&nbsp;</label>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender" id="male"
					value="male" required> <label class="form-check-label"
					for="male"> Male </label>
			</div>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="gender"
					id="female" value="female" required> <label
					class="form-check-label" for="female"> Female</label>
			</div>
			<!-- <span class="text-danger font-weight-bold" id="genderameerror"></span> -->
			<br> <br> <label> Hobbies : &nbsp;&nbsp;</label>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="cricket">Cricket
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="dancing">Dancing
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="singing">Singing
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="reading">Reading
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					class="form-check-input chk" value="writing">Writing
				</label>
			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" id="hobby" name=hobby />
				<span class="text-danger font-weight-bold" id="hobbyerror"></span>
			</div>
			<!-- <span class="text-danger font-weight-bold" id="hobbieseerror"></span> -->


			<div class="form-group">
				<label for="state">Select State</label> <select class="form-control"
					name="state" id="state" required>
					<option value="">---Select state---</option>
					<%
						Map<String, String> states = (Map<String, String>) request.getAttribute("sMap");

						for (Map.Entry<String, String> entry : states.entrySet()) {
					%>
					<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
					<%
						}
					%>
				</select>
			</div>

			<div class="form-group">
				<label for="city">Select City</label> <select class="form-control"
					name="city" id="city" required>
					<option value="">---Select city---</option>
				</select>
			</div>
			<br>

			<div class="form-group">
				<label for="mobile">Mobile Number</label> <input type="text"
					class="form-control" id="mobile" name="mobile"> <span
					class="text-danger font-weight-bold" id="mobileerror"></span>
			</div>

			<div class="form-group">
				<label for="pannumber">Pan Number</label> <input type="text"
					class="form-control" id="pannumber" name="pannumber"> <span
					class="text-danger font-weight-bold" id="pannumbererror"></span>
			</div>

			<div class="form-group">
				<span class="text-danger font-weight-bold" id="imageerror"
					style="margin-left: 5px"></span> <label for="file">Select
					file</label> <input type="file" class="form-control-file" id="file"
					name="profile" required>
			</div>
			<dir class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
				<a href="view" class="btn btn-outline-primary">View Record</a>
			</dir>
		</form>
	</div>

</body>
</html>