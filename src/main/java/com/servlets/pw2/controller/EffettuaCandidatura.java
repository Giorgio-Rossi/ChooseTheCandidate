package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.interfaces.impl.QuizDomandaIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;
import com.candidatoDB.pw2.interfaces.impl.RisposteDomandaIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

@WebServlet("/EffettuaCandidatura")

public class EffettuaCandidatura extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        int id_quiz = Integer.parseInt((req.getParameter("id_quiz").split(" "))[0]);
        int id_posizione = Integer.parseInt((req.getParameter("id_quiz").split(" "))[1]);




        QuizIMPL quizIMPL = new QuizIMPL();
        String nome_quiz = String.valueOf(quizIMPL.getQuizById(id_quiz).getDescrizione());


        QuizDomandaIMPL quizDomandaIMPL = new QuizDomandaIMPL();
        ArrayList<Domanda> domande = quizDomandaIMPL.getDomandeByIdQuiz(id_quiz);

        RisposteDomandaIMPL risposteDomandaIMPL = new RisposteDomandaIMPL();
        HashMap<Domanda,ArrayList<RisposteDomande>> risposte = new HashMap<>();

        for(Domanda d : domande){
            risposte.put(d,risposteDomandaIMPL.getRisposteDomandaByIdDomanda(d.getId_domanda()));
        }

        session.setAttribute("quiz",risposte);
        session.setAttribute("nome_quiz",nome_quiz);
        session.setAttribute("id_quiz",id_quiz);
        session.setAttribute("id_posizione",id_posizione);

        req.getRequestDispatcher("/home/quiz.jsp").forward(req, resp);

    }

}
