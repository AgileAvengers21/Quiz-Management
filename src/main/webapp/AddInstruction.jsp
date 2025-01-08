<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<meta charset="ISO-8859-1">
<title>Add Instructions</title>
</head>
<body>
	<h2>
		<font face="WildWest" color="blue">ENTER INSTRUCTIONS</font>
	</h2>
	<form action="com.controller.InstructionInsert">
		<pre>
Instruction    <input type="text" name="inst">
             
             <input type="submit" value="Add"
				class="btn btn-outline-primary">   
             <input type="button"
				onclick="location.href='AdminPanel.jsp'" value="Home"
				class="btn btn-outline-success">    
             <input type="button"
				onclick="location.href='InstructionsList.jsp'" value="Back"
				class="btn btn-outline-danger">
        </pre>
	</form>
	<div>
		<font color="red"> <%
 if (request.getParameter("msg2") != null) {
 	out.print(request.getParameter("msg2"));
 }
 %>
		</font> <font color="green"> <%
 if (request.getParameter("msg1") != null) {
 	out.print(request.getParameter("msg1"));
 }
 %>
		</font>
	</div>
</body>
</html>