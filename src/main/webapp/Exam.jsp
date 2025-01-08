<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="com.questions.model.Questions"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<title>Examination</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
/* Style for the Submit button */
.btn-custom-submit {
	background-color: #28a745; /* Green background */
	color: white; /* White text */
	border: 2px solid #28a745; /* Green border */
	padding: 12px 30px; /* Size of the button */
	font-size: 18px; /* Font size */
	border-radius: 8px; /* Rounded corners */
	cursor: pointer; /* Pointer cursor */
	transition: all 0.3s ease; /* Smooth hover effect */
}

.btn-custom-submit:hover {
	background-color: white; /* White background on hover */
	color: #28a745; /* Green text on hover */
	border-color: #28a745; /* Border remains green */
	box-shadow: 0 0 10px rgba(40, 167, 69, 0.5);
	/* Add a shadow on hover */
}
</style>

<script>
	
<%String clock = request.getParameter("clock");
if (clock == null)
	clock = "60";%>
	var timeout =
<%=clock%>
	;
	function timer() {
		if (timeout > 0) {
			timeout--;
			document.forma.clock.value = timeout + " seconds left";
			setTimeout(timer, 1000);
		} else {
			document.forma.clock.value = "Time Over";
			document.formb.submit();
		}
	}
</script>
</head>
<body onload="timer()">
	<form name="forma" action="<%=request.getRequestURL()%>">
		<div class="container mt-3">
			<div class="alert alert-info">
				<strong>Time Left:</strong> <input size="5" name="clock"
					value="<%=clock%>" readonly
					style="background: #ffcdd2; border: none; font-weight: bold;">
			</div>
		</div>
	</form>

	<form action="Result.jsp" name="formb">
		<div class="container mt-4">
			<h3 class="text-danger text-center">QUESTIONS</h3>
			<table class="table table-bordered table-hover">
				<thead class="table-warning">
					<tr>
						<th>S No.</th>
						<th>Question</th>
						<th>A</th>
						<th>B</th>
						<th>C</th>
						<th>D</th>
					</tr>
				</thead>
				<tbody>
					<%
					int i = 1;
					int questionIndex = 0; // To keep track of question index for naming the radio buttons
					ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
					for (Questions e : allQuestions) {
					%>
					<tr>
						<td><%=i++%></td>
						<td><%=e.getQuestion()%></td>
						<td><input type="radio" value="a" name="q<%=questionIndex%>">
							<%=e.getA()%></td>
						<td><input type="radio" value="b" name="q<%=questionIndex%>">
							<%=e.getB()%></td>
						<td><input type="radio" value="c" name="q<%=questionIndex%>">
							<%=e.getC()%></td>
						<td><input type="radio" value="d" name="q<%=questionIndex%>">
							<%=e.getD()%></td>
					</tr>
					<%
					questionIndex++;
					}
					%>
				</tbody>
			</table>
			<div class="text-center mt-4">
				<button type="submit" class="btn btn-custom-submit">SUBMIT</button>
			</div>
		</div>
	</form>

	<!-- Latest Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>