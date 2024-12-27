<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Instructions</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
	rel="stylesheet">
</head>
<body>

	<%
    // Fetch the student's name from the database
    String name = StudentsDAO.getStudentName(session.getAttribute("username").toString());
%>

	<!-- Welcome Banner -->
	<div style="background-color: yellow; padding: 20px;"
		class="text-center">
		<h2 class="text-success">
			Welcome,
			<%= name %>!
		</h2>
	</div>

	<!-- Instructions Section -->
	<div class="container mt-4">
		<div class="text-center mb-4">
			<h4 class="text-danger">Instructions for Students</h4>
		</div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>Instruction</th>
				</tr>
			</thead>
			<tbody>
				<%
                // Fetch all instructions from the database
                int i = 1;
                ArrayList<Instruction> allinsts = InstructionDAO.getAllRecords();
                for (Instruction e : allinsts) {
            %>
				<tr>
					<td><%= i++ %></td>
					<td><%= e.getInstruction() %></td>
				</tr>
				<%
                }
            %>
			</tbody>
		</table>
	</div>

	<!-- Buttons -->
	<div class="text-center mt-4">
		<button type="button" class="btn btn-outline-primary btn-lg"
			onclick="location.href='com.controller.LogoutStudent'">
			Logout</button>
		<button type="button" class="btn btn-outline-primary btn-lg"
			onclick="location.href='Exam.jsp'">Start Test</button>
	</div>

</body>
</html>
