<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Updating Questions</title>
</head>
<body>
	<%
	// Retrieve parameters from the request
	String OriginalQuestion = request.getParameter("quesoriginal");
	String newQuestion = request.getParameter("quesmodified");
	String opta = request.getParameter("opta");
	String optb = request.getParameter("optb");
	String optc = request.getParameter("optc");
	String optd = request.getParameter("optd");
	String ans = request.getParameter("ans");

	// Validate inputs to avoid SQL injection or invalid data
	if (OriginalQuestion == null || newQuestion == null || opta == null || optb == null || optc == null || optd == null
			|| ans == null) {
		out.print("Invalid input parameters.");
	} else {
		// Perform the update operation
		int status = QuestionDAO.doUpdateNowRecord(OriginalQuestion, newQuestion, opta, optb, optc, optd, ans);

		// Check the result and redirect accordingly
		if (status > 0) {
			response.sendRedirect("QuestionList.jsp"); // Redirect to Question List if successful
		} else if (status == -1) {
			out.print("Error from database."); // Handle database error
		} else {
			out.print("Exception occurred during the update."); // Handle other exceptions
		}
	}
	%>
</body>
</html>
