<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- Document: StudentLogin --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- Custom Styles -->
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: aqua;
}
</style>
</head>
<body>

	<div class="container mt-5">
		<h1 class="text-center text-primary">Student Login</h1>

		<!-- Display messages -->
		<div class="text-center mt-3">
			<font color="red"> <%
                    if (request.getParameter("msg") != null) {
                        out.print(request.getParameter("msg"));
                    }
                %>
			</font> <font color="green"> <%
                    if (request.getParameter("msg1") != null) {
                        out.print(request.getParameter("msg1"));
                    }
                %>
			</font>
		</div>

		<!-- Login Form -->
		<form action="com.controller.ValidateStudent" method="post"
			class="mt-4">
			<div class="form-group">
				<label for="uname">User ID:</label> <input type="text" name="uname"
					id="uname" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="pass">Password:</label> <input type="password"
					name="pass" id="pass" class="form-control" required>
			</div>
			<div class="text-center">
				<button type="button" onclick="location.href='index.html'"
					class="btn btn-outline-primary mr-3">Exit</button>
				<button type="submit" class="btn btn-outline-primary">Login</button>
			</div>
		</form>
	</div>

</body>
</html>