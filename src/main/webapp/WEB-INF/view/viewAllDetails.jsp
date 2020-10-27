<%@page import="com.model.UserDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Details</title>

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

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#dataTable').DataTable({

			"lengthMenu" : [ [ 2, 4, 8, -1 ], [ 2, 4, 8, "All" ] ],
			"pageLength" : 4
		});
	});
</script>

</head>
<body>
	<div class="container">
		<h2 class="text-center text-white"
			style="background-color: #F99D27; margin-top: 20px">View All
			Details</h2>


		<table id="dataTable" class="table table-hover table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">SNo.</th>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Gender</th>
					<th scope="col">Hobby</th>
					<th scope="col">State</th>
					<th scope="col">City</th>
					<th scope="col">Mobile Number</th>
					<th scope="col">PanCard Number</th>
					<th scope="col">Creation Date</th>
					<th scope="col">Profile Pic</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<UserDetails> allUserDetails = (List<UserDetails>) request.getAttribute("allUserDetails");
					System.out.println("allUserDetails " + allUserDetails.size());
					int i = 1;
					for (UserDetails details : allUserDetails) {
				%>
				<tr>
					<th scope="row"><%=i++%></th>
					<td><%=details.getfName()%></td>
					<td><%=details.getlName()%></td>
					<td><%=details.getGender() == null ? "-" : details.getGender()%></td>
					<td><%=details.getHobby()%></td>
					<td><%=details.getState()%></td>
					<td><%=details.getCity()%></td>
					<td><%=details.getMobile()%></td>
					<td><%=details.getPannumber()%></td>
					<td><%=details.getCreationDate()%></td>
					<td><img alt="profile pic"
						src="./images/<%=details.getImageName()%>"
						style="width: 80px; height: 80px;"></td>
					<th><a
						href="/SpringMVCHibernateCRUD/editUser?id=<%=details.getId()%>">Edit</a>
						<a
						href="/SpringMVCHibernateCRUD/deleteUser?id=<%=details.getId()%>"
						onclick="return confirm('Are you sure to delete?')">Delete</a></th>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>

		<div class="container text-center">
			<a href="/SpringMVCHibernateCRUD/home"
				class="btn btn-outline-success">Add User</a>
		</div>

	</div>
</body>
</html>