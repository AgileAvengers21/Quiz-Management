<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Question List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.text-center {
	text-align: center;
}

.heading {
	color: blue;
	font-family: "Times New Roman", Times, serif;
	font-size: 24px; /* Adjust the font size as needed */
	font-weight: bold; /* Make the heading bold */
	margin-bottom: 20px; /* Add spacing below the heading */
	background-color: #f8f9fa; /* Light gray background color */
	padding: 10px; /* Add padding for better spacing */
	border-radius: 5px; /* Rounded corners for the background */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	/* Subtle shadow for a modern look */
}
</style>
</head>
<body>
	<div class="text-center">
		<h3 class="heading">LIST OF ALL QUESTIONS</h3>
	</div>

	<table class="table table-bordered table-hover">
		<thead class="table-dark">
			<tr>
				<th>S. No.</th>
				<th>Question</th>
				<th>Option A</th>
				<th>Option B</th>
				<th>Option C</th>
				<th>Option D</th>
				<th>Correct Answer</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
			int i = 1; // Start counter from 1
			ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
			for (Questions e : allQuestions) {
				String encodedQuestion = URLEncoder.encode(e.getQuestion(), "UTF-8"); // Encode question for URLs
			%>
			<tr>
				<td><%=i++%></td>
				<td><%=e.getQuestion()%></td>
				<td><%=e.getA()%></td>
				<td><%=e.getB()%></td>
				<td><%=e.getC()%></td>
				<td><%=e.getD()%></td>
				<td><%=e.getAnswer()%></td>
				<td><a href="Updatequestion.jsp?ques=<%=encodedQuestion%>">Update</a></td>
				<td><a href="Deletequestion.jsp?ques=<%=encodedQuestion%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<div class="text-center">
						<input type="button" class="btn btn-outline-success"
							value="Add Question" onclick="location.href='AddQuestion.jsp'">
					</div>
				</td>
				<td colspan="5">
					<div class="text-center">
						<input type="button" class="btn btn-outline-danger"
							value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>
