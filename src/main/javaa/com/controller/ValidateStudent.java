package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.students.dao.StudentsDAO;
import com.students.model.Students;

@WebServlet("/com.controller.ValidateStudent")
public class ValidateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateStudent() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String username = request.getParameter("uname");
		String password = request.getParameter("pass");

		Students sd = new Students();
		sd.setUsername(username);
		sd.setPassword(password);

		boolean status = StudentsDAO.doValidate(sd);

		if (status) {
			// Logged in as student, do something (pending)
			HttpSession studentsession = request.getSession();
			studentsession.setAttribute("username", sd.getUsername());
			studentsession.setAttribute("name", sd.getName());
			response.sendRedirect("StudentInstructions.jsp");
		} else {
			String msg = "Invalid Username or Password";
			response.sendRedirect("StudentLogin.jsp?msg=" + msg);
		}
	}
}