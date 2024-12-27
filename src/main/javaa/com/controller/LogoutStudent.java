package com.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/com.controller.LogoutStudent")
public class LogoutStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LogoutStudent() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		 session.invalidate();
		 String msg1 = "Logged out successfully";
		 response.sendRedirect("StudentLogin.jsp?msg1="+msg1);
	}



}
