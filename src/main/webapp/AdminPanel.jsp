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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"> </script>
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
	<div
		style="background-color: yellow; padding: 20px; text-align: center;">
		<marquee behavior="alternate">
			<h1>
				<font color="green">Welcome <% out.println(session.getAttribute("username")); %></font>
			</h1>
		</marquee>
	</div>

	<div class="container mt-5">
		<div class="row mb-4">
			<div class="col-sm-6">
				<button onclick="location.href='StudentList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Student</button>
			</div>
			<div class="col-sm-6">
				<button onclick="location.href='InstructionList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Instructions</button>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<button onclick="location.href='QuestionList.jsp';"
					class="btn btn-outline-primary btn-lg btn-block">Add/Update
					Question</button>
			</div>
			<div class="col-sm-6">
				<button onclick="location.href='com.controller.LogoutAdmin';"
					class="btn btn-outline-primary btn-lg btn-block">Logout</button>
			</div>
		</div>
	</div>
</body>
</html>
