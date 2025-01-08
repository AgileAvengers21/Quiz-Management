<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-4">
		<h3 class="text-center text-primary">List of All Students</h3>
		<table class="table table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th>S No.</th>
					<th>User Id</th>
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
					if (request.getParameter("username") != null && request.getParameter("username").equals(e.getUsername())) {
				%>
				<tr class="table-primary">
					<td><%=i++%></td>
					<td><%=e.getUsername()%></td>
					<td><input type="text" name="name" value="<%=e.getName()%>"
						class="form-control" readonly></td>
					<td><input type="text" name="pass"
						value="<%=e.getPassword()%>" class="form-control" readonly>
					</td>
					<td><a
						href="Updatestudentnow.jsp?usernameoriginal=<%=e.getUsername()%>&uname=<%=e.getUsername()%>&name=<%=e.getName()%>&pass=<%=e.getPassword()%>"
						class="btn btn-outline-primary">Update</a></td>
					<td><a href="Deletestudent.jsp?username=<%=e.getUsername()%>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<%
				} else {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=e.getUsername()%></td>
					<td><%=e.getName()%></td>
					<td><%=e.getPassword()%></td>
					<td><a href="Updatestudent.jsp?username=<%=e.getUsername()%>"
						class="btn btn-outline-warning">Update</a></td>
					<td><a href="Deletestudent.jsp?username=<%=e.getUsername()%>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<%
				}
				}
				%>
				<tr>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-outline-success"
							onclick="location.href='AddStudent.jsp'">Add Student</button>
					</td>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-outline-danger"
							onclick="location.href='AdminPanel.jsp'">Back to Panel</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>