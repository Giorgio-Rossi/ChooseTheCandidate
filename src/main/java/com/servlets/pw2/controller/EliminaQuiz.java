package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/eliminaQuiz")
public class EliminaQuiz extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_quiz = Integer.parseInt(req.getParameter("idQuiz"));
        QuizIMPL quizIMPL = new QuizIMPL();

        req.getSession().setAttribute("posizioni_modificare",quizIMPL.getAllPosizioniByQuiz(id_quiz));

        quizIMPL.delete(id_quiz);


        req.getSession().setAttribute("quiz_eliminato","true");

        req.getRequestDispatcher("admin/gestionequiz.jsp").forward(req, resp);
    }
}
