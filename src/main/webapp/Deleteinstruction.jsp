<%-- Document: deleteinstruction --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.instructions.model.*"%>
<%@ page import="com.instructions.dao.InstructionDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Instructions</title>
</head>
<body>
	<%
	// Retrieve the instruction parameter from the request
	String instruction = request.getParameter("inst");

	if (instruction != null && !instruction.isEmpty()) {
		Instruction inst = new Instruction();
		inst.setInstruction(instruction);
		int status = InstructionDAO.deleteRecord(inst);

		// Redirect based on the deletion status
		if (status > 0) {
			response.sendRedirect("InstructionList.jsp");
		} else {
			out.print("<p style='color:red;'>Error: Unable to delete the instruction. Please try again.</p>");
		}
	} else {
		out.print("<p style='color:red;'>Error: No instruction provided for deletion.</p>");
	}
	%>
</body>
</html>