<%-- Document : updateinstructionnow --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Updating Instructions</title>
</head>
<body>
	<%
        String instoriginal = request.getParameter("instoriginal");
        String instmodified = request.getParameter("instmodified");
        
        int status = InstructionDAO.doUpdateNowRecord(instoriginal, instmodified);
        
        if (status > 0) {
            response.sendRedirect("InstructionList.jsp");
        } else if (status == -1) {
            out.print("Error from database");
        } else {
            out.print("Exception occurred");
        }
    %>
</body>
</html>