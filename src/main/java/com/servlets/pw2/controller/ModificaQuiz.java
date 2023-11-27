package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.interfaces.impl.DomandaIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizDomandaIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;
import com.candidatoDB.pw2.interfaces.impl.RisposteDomandaIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet("/modificaQuiz")
public class ModificaQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_quiz = Integer.parseInt(req.getParameter("id_quiz"));

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
        System.out.println(Arrays.toString(punteggi));
        System.out.println(Arrays.toString(scelte1));
        System.out.println(Arrays.toString(scelte2));
        System.out.println(Arrays.toString(scelte3));
        System.out.println(Arrays.toString(scelte4));
        System.out.println(Arrays.toString(sceltecorrette));

        QuizIMPL quizIMPL = new QuizIMPL();
        Quiz quiz = quizIMPL.getQuizById(id_quiz);
        quiz.setDescrizione(nome_quiz);


        ArrayList<Domanda> domande_quiz = new QuizDomandaIMPL().getDomandeByIdQuiz(quiz.getId_quiz());
        ArrayList<RisposteDomande> risposte_domande_quiz = new ArrayList<>();

        for(int i = 0; i<domande.length;i++){

            boolean inBounds = i+1 > domande_quiz.size();

            if(inBounds){
                Domanda nuova_domanda = new Domanda();
                nuova_domanda.setTesto(domande[i]);
                nuova_domanda.setPunteggio(Integer.parseInt(punteggi[i]));

                RisposteDomande risposteDomande_nuova = new RisposteDomande();
                risposteDomande_nuova.setScelta1(scelte1[i]);
                risposteDomande_nuova.setScelta2(scelte2[i]);
                risposteDomande_nuova.setScelta3(scelte3[i]);
                risposteDomande_nuova.setScelta4(scelte4[i]);
                risposteDomande_nuova.setScelta_corretta(sceltecorrette[i]);

                System.out.println(nuova_domanda);
                System.out.println(risposteDomande_nuova);

                quizIMPL.AddDomandeRisposte(quiz,nuova_domanda,risposteDomande_nuova);

            }

            if(!inBounds) {

                domande_quiz.get(i).setTesto(domande[i]);
                domande_quiz.get(i).setPunteggio(Integer.parseInt(punteggi[i]));

                ArrayList<RisposteDomande> risposte_domanda = new RisposteDomandaIMPL().getRisposteDomandaByIdDomanda(domande_quiz.get(i).getId_domanda());

                for (RisposteDomande risposteDomande : risposte_domanda) {
                    risposteDomande.setScelta1(scelte1[i]);
                    risposteDomande.setScelta2(scelte2[i]);
                    risposteDomande.setScelta3(scelte3[i]);
                    risposteDomande.setScelta4(scelte4[i]);
                    risposteDomande.setScelta_corretta(sceltecorrette[i]);

                    risposte_domande_quiz.add(risposteDomande);
                }

            }


        }


        System.out.println(quiz);
        System.out.println(domande_quiz);
        System.out.println(risposte_domande_quiz);



        quizIMPL.update(quiz, domande_quiz, risposte_domande_quiz);

        req.getSession().setAttribute("quiz_modificato", "true");

        req.getRequestDispatcher("admin/gestionequiz.jsp").forward(req, resp);
    }
}
