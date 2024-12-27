<%-- Document: updatestudentnow --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.students.model.*"%>
<%@ page import="com.students.dao.StudentsDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Updating Students Info</title>
</head>
<body>
	<%
    String newuserid = request.getParameter("uname");
    String newpassword = request.getParameter("pass");
    String newname = request.getParameter("name");
    String originaluid = request.getParameter("usernameoriginal");
    
    int status = StudentsDAO.doUpdateNowRecord(originaluid, newuserid, newpassword, newname);
    if (status > 0) { 
        response.sendRedirect("StudentList.jsp");
    } else if (status == -1) {
        out.print("Error from database");
    } else {
        out.print("Exception occurred");
    }
%>
</body>
</html>