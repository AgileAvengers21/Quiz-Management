<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instructions List</title>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>
.centered {
	text-align: center;
}
</style>
</head>
<body>
	<div class="centered">
		<h3>
			<font color="blue">List of All Instructions</font>
		</h3>
	</div>
	<table class="table table-bordered table-hover">
		<thead class="table-dark">
			<tr>
				<th>S. No.</th>
				<th>Instruction</th>
				<th>Operation</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
                int i = 1; // Start counter from 1
                ArrayList<Instruction> allinsts = InstructionDAO.getAllRecords();
                for (Instruction e : allinsts) {
                    String encodedInstruction = URLEncoder.encode(e.getInstruction(), "UTF-8");
            %>
			<tr>
				<td><%= i++ %></td>
				<td><%= e.getInstruction() %></td>
				<td><a
					href="updateinstruction.jsp?inst=<%= encodedInstruction %>">Update</a></td>
				<td><a
					href="deleteinstruction.jsp?inst=<%= encodedInstruction %>">Delete</a></td>
			</tr>
			<%
                }
            %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" class="centered"><input type="button"
					class="btn btn-outline-success" value="Add Instruction"
					onclick="location.href='AddInstruction.jsp'"></td>
				<td colspan="2" class="centered"><input type="button"
					class="btn btn-outline-danger" value="Back to Panel"
					onclick="location.href='AdminPanel.jsp'"></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>