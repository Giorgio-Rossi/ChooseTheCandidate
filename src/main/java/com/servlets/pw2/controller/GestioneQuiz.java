package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.QuizDomande;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Handler;

@WebServlet("/gestioneQuiz")

public class GestioneQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome_quiz = req.getParameter("nome");
        String[] domande = req.getParameterValues("domanda");
        String[] punteggi = req.getParameterValues("punteggio");
        String[] scelte1 = req.getParameterValues("scelta1");
        String[] scelte2 = req.getParameterValues("scelta2");
        String[] scelte3 = req.getParameterValues("scelta3");
        String[] scelte4 = req.getParameterValues("scelta4");
        String[] sceltecorrette = req.getParameterValues("sceltacorretta");

        System.out.println(nome_quiz);
        System.out.println(Arrays.toString(domande));
        System.out.println(Arrays.toString(scelte1));
        System.out.println(Arrays.toString(scelte2));
        System.out.println(Arrays.toString(scelte3));
        System.out.println(Arrays.toString(scelte4));
        System.out.println(Arrays.toString(sceltecorrette));

        QuizIMPL quizIMPL = new QuizIMPL();
        Quiz quiz = new Quiz();

        quiz.setDescrizione(nome_quiz);
        quiz.setN_domande(domande.length);

        ArrayList<Domanda> domande_quiz = new ArrayList<>();
        ArrayList<RisposteDomande> risposte_domande_quiz = new ArrayList<>();

        for(int i = 0; i<domande.length;i++){
            Domanda domanda = new Domanda();
            RisposteDomande risposteDomanda = new RisposteDomande();

            System.out.println(domande[i]);

            domanda.setTesto(domande[i]);
            domanda.setPunteggio(Integer.parseInt(punteggi[i]));

            risposteDomanda.setScelta1(scelte1[i]);
            risposteDomanda.setScelta2(scelte2[i]);
            risposteDomanda.setScelta3(scelte3[i]);
            risposteDomanda.setScelta4(scelte4[i]);

            risposteDomanda.setScelta_corretta(sceltecorrette[i]);

            domande_quiz.add(domanda);
            risposte_domande_quiz.add(risposteDomanda);
        }

        System.out.println(quiz);
        System.out.println(domande_quiz);
        System.out.println(risposte_domande_quiz);

        quizIMPL.save(quiz, domande_quiz, risposte_domande_quiz);

        req.getSession().setAttribute("quiz_creato", "true");

        req.getRequestDispatcher("admin/gestionequiz.jsp").forward(req, resp);


    }
}
