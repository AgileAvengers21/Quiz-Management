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
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #4facfe, #00f2fe);
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
	background: #ff512f;
	background: linear-gradient(to right, #ff512f, #dd2476);
	text-decoration: none;
	border-radius: 5px;
	margin: 10px;
	transition: transform 0.3s ease, background 0.3s ease;
}

.btn:hover {
	transform: scale(1.1);
	background: linear-gradient(to right, #dd2476, #ff512f);
}
</style>
</head>
<body>
	<div class="container">
		<h1>Welcome to the Quiz!</h1>
		<p>Test your knowledge and have fun while learning.</p>
		<a href="Exam.jsp" class="btn">Start Quiz</a> <a href="AddStudent.jsp"
			class="btn">Add Student</a>
	</div>
</body>
</html>
