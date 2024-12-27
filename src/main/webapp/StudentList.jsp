<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!-- Header -->
	<div class="container mt-4">
		<div class="text-center">
			<h3 class="text-primary">List of All Students</h3>
		</div>

		<!-- Student Table -->
		<table class="table table-bordered table-hover mt-4">
			<thead class="thead-dark">
				<tr>
					<th>S. No.</th>
					<th>User ID</th>
					<th>Name</th>
					<th>Password</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
                int i = 1;
                ArrayList<Students> allstudents = StudentsDAO.getAllRecords();
                for (Students e : allstudents) {
            %>
				<tr>
					<td><%= i++ %></td>
					<td><%= e.getUsername() %></td>
					<td><%= e.getName() %></td>
					<td><%= e.getPassword() %></td>
					<td><a
						href="updatestudent.jsp?username=<%= e.getUsername() %>"
						class="btn btn-outline-primary btn-sm"> Update </a></td>
					<td><a
						href="deletestudent.jsp?username=<%= e.getUsername() %>"
						class="btn btn-outline-danger btn-sm"> Delete </a></td>
				</tr>
				<%
                }
            %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" class="text-center">
						<button type="button" class="btn btn-outline-success"
							onclick="location.href='AddStudent.jsp'">Add Student</button>
					</td>
					<td colspan="3" class="text-center">
						<button type="button" class="btn btn-outline-danger"
							onclick="location.href='AdminPanel.jsp'">Back to Panel</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>