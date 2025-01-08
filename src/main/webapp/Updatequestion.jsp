<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Questions</title>

<!-- Latest Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest jQuery and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>

<!-- Latest Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container mt-4">
		<h3 class="text-center text-primary">LIS OF ALL QUESTIONS</h3>

		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>S No.</th>
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
				int i = 0;
				ArrayList<Questions> allQuestions = QuestionDAO.getAllRecords();
				for (Questions e : allQuestions) {
					if (request.getParameter("ques").equals(e.getQuestion())) {
				%>
				<tr class="table-primary">
					<td><%=i++%></td>
					<td><input type="text" name="quesmodified"
						value="<%=e.getQuestion()%>" class="form-control"></td>
					<td><input type="text" name="opta" value="<%=e.getA()%>"
						class="form-control"></td>
					<td><input type="text" name="optb" value="<%=e.getB()%>"
						class="form-control"></td>
					<td><input type="text" name="optc" value="<%=e.getC()%>"
						class="form-control"></td>
					<td><input type="text" name="optd" value="<%=e.getD()%>"
						class="form-control"></td>
					<td><input type="text" name="ans" value="<%=e.getAnswer()%>"
						class="form-control"></td>
					<td>
						<!-- Use URL parameters to pass data to updatequestionnow.jsp -->
						<a
						href="Updatequestionnow.jsp?quesoriginal=<%=e.getQuestion()%>&quesmodified=<%=e.getQuestion()%>&opta=<%=e.getA()%>&optb=<%=e.getB()%>&optc=<%=e.getC()%>&optd=<%=e.getD()%>&ans=<%=e.getAnswer()%>"
						class="btn btn-outline-primary">Update</a>
					</td>
					<td><a href="Deletequestion.jsp?ques=<%=e.getQuestion()%>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<%
				} else {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=e.getQuestion()%></td>
					<td><%=e.getA()%></td>
					<td><%=e.getB()%></td>
					<td><%=e.getC()%></td>
					<td><%=e.getD()%></td>
					<td><%=e.getAnswer()%></td>
					<td><a href="Updatequestion.jsp?ques=<%=e.getQuestion()%>"
						class="btn btn-outline-warning">Update</a></td>
					<td><a href="Deletequestion.jsp?ques=<%=e.getQuestion()%>"
						class="btn btn-outline-danger">Delete</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" class="text-center"><input type="button"
						class="btn btn-outline-success" value="Add Question"
						onclick="location.href='AddQuestion.jsp'"></td>
					<td colspan="4" class="text-center"><input type="button"
						class="btn btn-outline-danger" value="Back to Panel"
						onclick="location.href='AdminPanel.jsp'"></td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>
