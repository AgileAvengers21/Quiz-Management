package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.instructions.dao.InstructionDAO;
import com.instructions.model.Instruction;

@WebServlet("/com.controller.InstructionInsert")
public class InstructionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InstructionInsert() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String instruction = request.getParameter("inst");

		Instruction ist = new Instruction();
		ist.setInstruction(instruction);

		boolean status = InstructionDAO.insertInstruction(ist);
		if (status) {
			String msg1 = "Instruction Added";
			response.sendRedirect("AddInstruction.jsp?msg1=" + msg1);
		} else {
			String msg2 = "Instruction not Added";
			response.sendRedirect("AddInstruction.jsp?msg2=" + msg2);
		}
	}
}