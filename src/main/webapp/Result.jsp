<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="com.provider.model.*"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
    // Fetch all questions and correct answers
    ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
    int size = allQuestions.size();
    String[] dbans = new String[size];
    int i = 0;

    for (Questions question : allQuestions) {
        dbans[i++] = question.getAnswer();
    }

    // Get user-submitted answers
    String[] userans = new String[size];
    for (int j = 0; j < size; j++) {
        userans[j] = request.getParameter(String.valueOf(j));
    }

    // Calculate results
    int correctAnswers = 0, unattempted = 0, wrongAnswers = 0;

    for (int k = 0; k < size; k++) {
        if ("e".equalsIgnoreCase(userans[k])) {
            unattempted++;
        } else if (userans[k].equalsIgnoreCase(dbans[k])) {
            correctAnswers++;
        } else {
            wrongAnswers++;
        }
    }

    int attempted = size - unattempted;
%>

	<div style="background-color: yellow; padding: 20px;">
		<h1 class="text-center text-success">Results</h1>
	</div>

	<table class="table table-hover">
		<thead>
			<tr class="table-warning">
				<th colspan="3">
					<h4 class="text-center">
						Name:
						<%= session.getAttribute("name") %>
						|| UserID:
						<%= session.getAttribute("username") %>
					</h4>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Total No. of Questions</td>
				<td><%= size %></td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Number of Questions Attempted</td>
				<td><%= attempted %></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Number of Correct Answers</td>
				<td><span class="text-success"><strong><%= correctAnswers %></strong></span></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>Number of Wrong Answers</td>
				<td><span class="text-danger"><strong><%= wrongAnswers %></strong></span></td>
			</tr>
		</tbody>
	</table>

	<div class="text-center">
		<button class="btn btn-outline-danger btn-lg"
			onclick="location.href='com.controller.LogoutStudent'">Exit</button>
	</div>

</body>
</html>