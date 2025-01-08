package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.admin.dao.AdminDAO;
import com.admin.model.Admin;

@WebServlet("/com.controller.ValidateAdmin")
public class ValidateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateAdmin() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String username = request.getParameter("uname");
		String password = request.getParameter("pass");

		Admin ad = new Admin(); // Creating object
		ad.setUsername(username);
		ad.setPassword(password);
		boolean status = AdminDAO.doValidate(ad);

		if (status) {
			HttpSession session = request.getSession();
			session.setAttribute("username", ad.getUsername());
			response.sendRedirect("AdminPanel.jsp");
		} else {
			String msg2 = "Invalid Username or Password";
			response.sendRedirect("AdminLogin.jsp?msg2=" + msg2);
		}
	}
}