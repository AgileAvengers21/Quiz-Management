<%-- Document: deletestudent --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Student</title>
</head>
<body>
	<%
    // Retrieve the username parameter from the request
    String username = request.getParameter("username");

    if (username != null && !username.isEmpty()) {
        Students s = new Students();
        s.setUsername(username);
        int status = StudentsDAO.deleteRecord(s);

        // Redirect based on the deletion status
        if (status > 0) {
            response.sendRedirect("StudentList.jsp");
        } else {
            out.print("<p style='color:red;'>Error: Unable to delete the student. Please try again.</p>");
        }
    } else {
        out.print("<p style='color:red;'>Error: No username provided for deletion.</p>");
    }
%>
</body>
</html>