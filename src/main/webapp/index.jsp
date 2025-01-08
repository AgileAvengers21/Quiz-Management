<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Quiz</title>
<style>
/* CSS for styling */
body {
	margin: 0;
	font-family: 'Times New Roman', serif;
	background-color: #0000FF; /* Blue background */
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
}

.container {
	text-align: center;
	background: rgba(0, 0, 0, 0.6);
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
}

h1 {
	font-size: 3em;
	margin-bottom: 10px;
	font-family: 'Lobster', cursive;
}

p {
	font-size: 1.2em;
	margin-bottom: 20px;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 1em;
	color: #fff;
	background: #007BFF; /* Blue button background */
	background: linear-gradient(to right, #007BFF, #00BFFF);
	/* Blue gradient */
	text-decoration: none;
	border-radius: 5px;
	margin: 10px;
	transition: transform 0.3s ease, background 0.3s ease;
	font-family: 'Courier New', monospace;
}

.btn:hover {
	transform: scale(1.1);
	background: linear-gradient(to right, #00BFFF, #007BFF);
	/* Inverted blue gradient on hover */
}
</style>
</head>
<body>
	<div class="container">
		<h1>WELCOME TO THE QUIZ!</h1>
		<p>Test your knowledge and have fun while learning.</p>


		<a href="AdminLogin.jsp" class="btn">ADMIN LOGIN</a> <a
			href="StudentLogin.jsp" class="btn">STUDENT LOGIN</a>

	</div>
</body>
</html>
