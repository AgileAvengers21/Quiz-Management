<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS (Updated version 5.3.0) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery (Updated version) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Popper.js (Updated version) -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

<!-- Bootstrap JS (Updated version) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>

<meta charset="ISO-8859-1">
<title>Add students</title>
</head>
<body>
	<h2>
		<font face="WildWest" color="blue">Enter Student Details</font>
	</h2>
	<form action="com.controller.StudentInsert">
		<pre>
            Name:         <input type="text" name="name">
            User id:      <input type="text" name="uname">
            Password:     <input type="text" name="pass">

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
                if(request.getParameter("msg2") != null)
                    out.print(request.getParameter("msg2"));
            %>
		</font> <font color="green"> <%
                if(request.getParameter("msg1") != null)
                    out.print(request.getParameter("msg1"));
            %>
		</font>
	</div>
</body>
</html>
