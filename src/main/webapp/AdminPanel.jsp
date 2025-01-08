<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- Latest jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Latest Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

<!-- Latest Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<style>
/* General Body Styling */
body {
	font-family: 'Times New Roman', serif;
	/* Changed font to Times New Roman */
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
}

/* Header Styling */
header {
	background-color: #ffcc00;
	padding: 20px;
	text-align: center;
	color: #006400;
	font-size: 2em;
	font-weight: bold;
	text-transform: uppercase; /* Apply uppercase to header text */
}

header marquee {
	font-size: 1.5em;
}

/* Container for Buttons */
.container {
	margin-top: 40px;
}

/* Button Styling */
.btn {
	font-size: 1.2em; font-body-Georgia , sans-serif;
	padding: 15px;
	text-align: center;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	text-transform: uppercase; /* Apply uppercase to button text */
}

.btn:hover {
	transform: scale(1.05);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Specific Button Colors */
.btn-outline-primary {
	background-color: #007bff;
	color: white;
	border: none;
}

.btn-outline-primary:hover {
	background-color: #0056b3;
	color: white;
}

/* Responsiveness for Smaller Screens */
@media ( max-width : 768px) {
	.container {
		padding: 15px;
	}
	.btn {
		font-size: 1.1em;
		padding: 12px;
	}
}
</style>

</head>
<body>

	<%
	if (session.getAttribute("username") != null) {
		// User is logged in
	} else {
		String msg2 = "Please Login as Admin to Continue";
		response.sendRedirect("AdminLogin.jsp?msg2=" + msg2);
	}
	%>

	<!-- Header Section -->
	<header>
		<marquee behavior="alternate">
			<h1>
				WELCOME <font color="green"><%=session.getAttribute("username")%></font>
			</h1>
		</marquee>
	</header>

	<!-- Main Content Section -->
	<div class="container mt-5">
		<div class="row mb-4">
			<div class="col-sm-6 mb-3">
				<button onclick="location.href='StudentList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Student</button>
			</div>
			<div class="col-sm-6 mb-3">
				<button onclick="location.href='InstructionsList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Instructions</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 mb-3">
				<button onclick="location.href='QuestionList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Question</button>
			</div>
			<div class="col-sm-6 mb-3">
				<button onclick="location.href='com.controller.LogoutAdmin';"
					class="btn btn-outline-primary btn-lg btn-block">Logout</button>
			</div>
		</div>
	</div>

</body>
</html>