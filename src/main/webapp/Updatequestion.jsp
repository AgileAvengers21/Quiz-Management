<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Instructions</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-4">
		<!-- Heading -->
		<h3 class="text-center text-primary">List of All Instructions</h3>

		<!-- Instructions Table -->
		<table class="table table-bordered table-hover mt-4">
			<thead class="table-dark">
				<tr>
					<th>S No.</th>
					<th>Instruction</th>
					<th>Operation</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
                    int i = 1;
                    ArrayList<Instruction> allinsts = InstructionDAO.getAllRecords();
                    for (Instruction e : allinsts) {
                        if (request.getParameter("inst") != null && request.getParameter("inst").equals(e.getInstruction())) {
                %>
				<tr class="table-primary">
					<td><%= i++ %></td>
					<td><input type="text" name="instmodified"
						value="<%= e.getInstruction() %>" class="form-control" readonly>
					</td>
					<td><a
						href="updateinstructionnow.jsp?instoriginal=<%= e.getInstruction() %>&instmodified=<%= e.getInstruction() %>"
						class="btn btn-outline-primary">Update</a></td>
					<td><a
						href="deleteinstruction.jsp?inst=<%= e.getInstruction() %>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<% 
                        } else {
                %>
				<tr>
					<td><%= i++ %></td>
					<td><%= e.getInstruction() %></td>
					<td><a
						href="updateinstruction.jsp?inst=<%= e.getInstruction() %>"
						class="btn btn-outline-warning">Update</a></td>
					<td><a
						href="deleteinstruction.jsp?inst=<%= e.getInstruction() %>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<% 
                        }
                    }
                %>
				<!-- Buttons Row -->
				<tr>
					<td colspan="2" class="text-center">
						<button type="button" class="btn btn-outline-success"
							onclick="location.href='AddInstruction.jsp'">Add
							Instruction</button>
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