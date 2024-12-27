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

<script>
        <% 
        String clock = request.getParameter("clock");
        if (clock == null) clock = "60";
        %>
        var timeout = <%= clock %>;
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
	<form name="forma" action="<%= request.getRequestURL() %>">
		<div class="container mt-3">
			<div class="alert alert-info">
				<strong>Time Left:</strong> <input size="5" name="clock"
					value="<%= clock %>" readonly
					style="background: #ffcdd2; border: none; font-weight: bold;">
			</div>
		</div>
	</form>

	<form action="Result.jsp" name="formb">
		<div class="container mt-4">
			<h3 class="text-danger text-center">Questions</h3>
			<table class="table table-bordered table-hover">
				<thead class="table-warning">
					<tr>
						<th>S No.</th>
						<th>Question</th>
						<th>Option A</th>
						<th>Option B</th>
						<th>Option C</th>
						<th>Option D</th>
					</tr>
				</thead>
				<tbody>
					<%
                    int i = 1;
                    int radioname = 0;
                    ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
                    for (Questions e : allQuestions) {
                    %>
					<tr>
						<td><%= i++ %></td>
						<td><%= e.getQuestion() %></td>
						<td><input type="radio" value="a" name="q<%= radioname %>">
							<%= e.getA() %></td>
						<td><input type="radio" value="b" name="q<%= radioname %>">
							<%= e.getB() %></td>
						<td><input type="radio" value="c" name="q<%= radioname %>">
							<%= e.getC() %></td>
						<td><input type="radio" value="d" name="q<%= radioname %>">
							<%= e.getD() %></td>
					</tr>
					<%
                        radioname++;
                    }
                    %>
				</tbody>
			</table>
			<div class="text-center mt-4">
				<button type="submit" class="btn btn-outline-success btn-lg">Submit</button>
			</div>
		</div>
	</form>

	<!-- Latest Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
