<%-- Document: deletequestion --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<%@ page import="com.questions.model.*"%>
<%@ page import="com.questions.dao.QuestionDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Question</title>
</head>
<body>
	<%
    // Retrieve the question parameter from the request
    String question = request.getParameter("ques");

    if (question != null && !question.isEmpty()) {
        Questions q = new Questions();
        q.setQuestion(question);
        int status = QuestionDAO.deleteRecord(q);

        // Redirect based on the deletion status
        if (status > 0) {
            response.sendRedirect("QuestionList.jsp");
        } else {
            out.print("<p style='color:red;'>Error: Unable to delete the question. Please try again.</p>");
        }
    } else {
        out.print("<p style='color:red;'>Error: No question provided for deletion.</p>");
    }
%>
</body>
</html>