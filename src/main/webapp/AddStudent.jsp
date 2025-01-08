<%--Document : AddStudent--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Students</title>
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
	<h2>
		<font face="WildWest" color="blue">ENTER STUDENT DETAILS</font>
	</h2>
	<form action="com.controller.StudentInsert">
		<pre>
Name:         <input type="text" name="name">

User ID:      <input type="text" name="uname">

Password:     <input type="password" name="pass">

              <input type="submit" value="Register"
				class="btn btn-outline-primary">
              <input type="button"
				onclick="location.href='AdminPanel.jsp'" value="Home"
				class="btn btn-outline-success">
              <input type="button"
				onclick="location.href='StudentList.jsp'" value="Back"
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