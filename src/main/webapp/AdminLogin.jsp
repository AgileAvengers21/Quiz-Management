<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>

<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- Custom Styles -->
<style>
body {
	font-family: 'Times New Roman', Times, serif;
	/* Changed to Times New Roman font */
}

.navbar {
	margin-bottom: 20px;
}

.login-container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #f9f9f9;
}

.login-header {
	text-align: center;
	color: blue;
	margin-bottom: 20px; /* Added spacing after the header */
}

.alert {
	text-align: center;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Quiz</a>
	</nav>

	<div class="container">
		<div class="login-container">
			<h1 class="login-header">ADMIN LOGIN</h1>

			<!-- Display error or success messages -->
			<div class="alert alert-danger"
				style="<%=request.getParameter("msg2") != null ? "" : "display: none;"%>">
				<%=request.getParameter("msg2") != null ? request.getParameter("msg2") : ""%>
			</div>
			<div class="alert alert-success"
				style="<%=request.getParameter("msg1") != null ? "" : "display: none;"%>">
				<%=request.getParameter("msg1") != null ? request.getParameter("msg1") : ""%>
			</div>

			<!-- Login Form -->
			<form action="com.controller.ValidateAdmin" method="post">
				<div class="form-group">
					<label for="uname">Username:</label> <input type="text" id="uname"
						name="uname" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="pass">Password:</label> <input type="password"
						id="pass" name="pass" class="form-control" required>
				</div>
				<div class="form-group text-center">
					<button type="button" onclick="location.href='index.jsp'"
						class="btn btn-outline-primary">EXIT</button>
					<button type="submit" class="btn btn-outline-success">LOGIN</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>