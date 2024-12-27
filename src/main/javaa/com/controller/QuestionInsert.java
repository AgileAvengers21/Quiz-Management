package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.questions.dao.QuestionDAO;
import com.questions.model.Questions;

@WebServlet("/com.controller.QuestionInsert")
public class QuestionInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QuestionInsert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        response.setContentType("text/html");

        String question = request.getParameter("Question");
        String a = request.getParameter("option1");
        String b = request.getParameter("option2");
        String c = request.getParameter("option3");
        String d = request.getParameter("option4");
        String answer = request.getParameter("answer");

        Questions q = new Questions();
        q.setA(a);
        q.setB(b);
        q.setC(c);
        q.setD(d);
        q.setAnswer(answer);
        q.setQuestion(question);

        boolean status = QuestionDAO.insertQuestion(q);

        if (status) {
            String msg1 = "Question Added";
            response.sendRedirect("AddQuestion.jsp?msg1=" + msg1);
        } else {
            String msg2 = "Question not Added";
            response.sendRedirect("AddQuestion.jsp?msg2=" + msg2);
        }
    }
}