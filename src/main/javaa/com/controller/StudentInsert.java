package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.students.dao.StudentsDAO;
import com.students.model.Students;

@WebServlet("/com.controller.StudentInsert")
public class StudentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		String name = request.getParameter("name");

		Students st = new Students();
		st.setName(name);
		st.setPassword(password);
		st.setUsername(username);

		boolean status = StudentsDAO.insertStudent(st);
		if (status) {
			String msg1 = "Student Added";
			response.sendRedirect("AddStudent.jsp?msg1=" + msg1);
		} else {
			String msg2 = "Student not Added";
			response.sendRedirect("AddStudent.jsp?msg2=" + msg2);
		}
	}
}