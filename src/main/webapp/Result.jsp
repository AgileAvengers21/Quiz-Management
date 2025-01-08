<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.highlight {
	background-color: #f0f8ff; /* Light blue background */
	font-weight: bold;
}

.grade-A {
	background-color: #28a745; /* Green for A grade */
	color: white;
}

.grade-B {
	background-color: #ffc107; /* Yellow for B grade */
	color: white;
}

.grade-C {
	background-color: #ff7f50; /* Orange for C grade */
	color: white;
}

.grade-D {
	background-color: #ff6347; /* Red for D grade */
	color: white;
}

.grade-F {
	background-color: #dc3545; /* Dark Red for F grade */
	color: white;
}

.custom-header {
	background-color: #add8e6; /* Light blue background */
	font-family: 'Times New Roman', serif; /* Times New Roman font */
	padding: 15px;
	border-radius: 8px;
	font-size: 18px;
	text-align: center;
	color: #000080; /* Navy text color */
}

.result-heading {
	background-color: #4caf50; /* Green background */
	font-family: 'Georgia', serif; /* Georgia font */
	color: white; /* White text color */
	padding: 20px;
	text-align: center;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%
	// Fetch all questions and correct answers
	ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
	int size = allQuestions.size();
	String[] dbans = new String[size];
	int i = 0;

	for (Questions question : allQuestions) {
		dbans[i++] = question.getAnswer().trim(); // Trim whitespace from database answers
	}

	// Get user-submitted answers
	String[] userans = new String[size];
	for (int j = 0; j < size; j++) {
		userans[j] = request.getParameter("q" + j);
		if (userans[j] != null) {
			userans[j] = userans[j].trim(); // Trim whitespace from user input
		}
	}

	// Calculate results
	int correctAnswers = 0, unattempted = 0, wrongAnswers = 0;

	for (int k = 0; k < size; k++) {
		if (userans[k] == null || userans[k].isEmpty()) {
			unattempted++;
		} else if (userans[k].equalsIgnoreCase(dbans[k])) {
			correctAnswers++;
		} else {
			wrongAnswers++;
		}
	}

	int attempted = size - unattempted;
	double percentage = ((double) correctAnswers / size) * 100;

	// Calculate Grade
	String grade = "F"; // Default grade is F
	if (percentage >= 90) {
		grade = "A";
	} else if (percentage >= 75) {
		grade = "B";
	} else if (percentage >= 50) {
		grade = "C";
	} else if (percentage >= 35) {
		grade = "D";
	}
	%>

	<div class="result-heading">
		<h1>RESULT</h1>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th colspan="3">
					<div class="custom-header">
						Name:
						<%=session.getAttribute("name")%>
						|| UserID:
						<%=session.getAttribute("username")%>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Total No. of Questions</td>
				<td><%=size%></td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Number of Questions Attempted</td>
				<td><%=attempted%></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Number of Correct Answers</td>
				<td><span class="text-success"><strong><%=correctAnswers%></strong></span></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>Number of Wrong Answers</td>
				<td><span class="text-danger"><strong><%=wrongAnswers%></strong></span></td>
			</tr>
			<tr class="highlight">
				<th scope="row">5</th>
				<td>Grade</td>
				<td class="<%="grade-" + grade%>"><strong><%=grade%></strong></td>
			</tr>
			<tr class="highlight">
				<th scope="row">6</th>
				<td>Percentage</td>
				<td><strong><%=String.format("%.2f", percentage)%> %</strong></td>
			</tr>
		</tbody>
	</table>

	<div class="text-center">
		<button class="btn btn-outline-danger btn-lg"
			onclick="location.href='com.controller.LogoutStudent'">Exit</button>
	</div>
</body>
</html>
