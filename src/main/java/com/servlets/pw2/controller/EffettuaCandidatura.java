package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EffettuaCandidatura")

public class EffettuaCandidatura extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_quiz = Integer.valueOf(req.getParameter("id_quiz"));

        QuizIMPL quizIMPL = new QuizIMPL();

        Quiz quiz = quizIMPL.getQuizById(id_quiz);

        System.out.println(quizIMPL.getQuizById(id_quiz));
    }
}
