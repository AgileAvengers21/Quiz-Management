<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			<h3 class="text-primary">LIST OF ALL STUDENTS</h3>
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
				if (allstudents != null && !allstudents.isEmpty()) {
					for (Students student : allstudents) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=student.getUsername()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getPassword()%></td>
					<td><a
						href="Updatestudent.jsp?username=<%=student.getUsername()%>"
						class="btn btn-outline-primary btn-sm">Update</a></td>
					<td><a
						href="Deletestudent.jsp?username=<%=student.getUsername()%>"
						class="btn btn-outline-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6" class="text-center text-muted">No students
						found.</td>
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
