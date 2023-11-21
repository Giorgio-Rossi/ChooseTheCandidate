package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.*;
import com.candidatoDB.pw2.interfaces.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/RisulatatoQuiz")

public class GestisciRIsultatoQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        session.setAttribute("candidatura_fatta", null);

        Integer id_quiz = (Integer) session.getAttribute("id_quiz");

        Utente utente = (Utente) session.getAttribute("utente");

        CandidaturaUser candidaturaUser = new CandidaturaUser();

        CandidaturaUserIMPL candidaturaUserIMPL = new CandidaturaUserIMPL();

        UtenteQuizIMPL utenteQuizIMPL = new UtenteQuizIMPL();

        UtenteSkillsIMPL utenteSkillsIMPL = new UtenteSkillsIMPL();

        int id_skill = session.getAttribute("id_skill") != null ? (int) session.getAttribute("id_skill") : -1;
        int id_posizione =  session.getAttribute("id_posizione") != null ? (int) session.getAttribute("id_posizione") : -1;


        if( id_posizione != -1 && candidaturaUserIMPL.getCandidaturaUserById(id_posizione,utente.getId_user())==null) {

            UtenteQuiz utenteQuiz = new UtenteQuiz();

            HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) session.getAttribute("quiz");

            Integer punteggio_quiz = 0;

            int i = 0;
            for (Map.Entry<Domanda, ArrayList<RisposteDomande>> entry : risposte.entrySet()) {

                String rispsota = (req.getParameter(String.valueOf(i++)));


                if (rispsota != null) {
                    for (RisposteDomande r : entry.getValue()) {
                        if (r.checkSceltaCorretta(rispsota)) {
                            punteggio_quiz += entry.getKey().getPunteggio();
                        }
                    }
                }
            }
            QuizIMPL quizIMPL = new QuizIMPL();
            Double punteggioOttenuto = (double) punteggio_quiz;
            Integer punteggioTotale = quizIMPL.getPunteggioTotaleById(id_quiz);
            Double percentuale = (punteggioOttenuto/punteggioTotale) * 100;


            utenteQuiz.setId_quiz(id_quiz);
            utenteQuiz.setId_user(utente.getId_user());
            utenteQuiz.setPunteggio(percentuale);
            utenteQuiz.setData_inserimento(new Date(System.currentTimeMillis()));

            //utenteQuizIMPL.Save(utenteQuiz);


            if(session.getAttribute("id_posizione") != null) {
                //int id_posizione = (int) session.getAttribute("id_posizione");
                PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
                candidaturaUser.setUtente(utente);
                candidaturaUser.setData_candidatura(new Date(System.currentTimeMillis()));
                candidaturaUser.setPosizione(posizioneIMPL.getPosizioneById(id_posizione));

                utenteQuizIMPL.Save(utenteQuiz);
                candidaturaUserIMPL.Save(candidaturaUser);

                session.setAttribute("candidatura_fatta", "true");

                req.getRequestDispatcher("/home/homeuser.jsp").forward(req, resp);

            } else {

                UsersSkills usersSkills = utenteSkillsIMPL.getById(id_skill);

                if(percentuale>=50.00){
                    utenteQuizIMPL.Save(utenteQuiz);

                    usersSkills.setVerificata(true);

                    System.out.println(usersSkills);

                    utenteSkillsIMPL.update(usersSkills);

                    session.setAttribute("skill_verificata", "true");

                    req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);
                } else {
                    session.setAttribute("skill_verificata", "false");

                    req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);
                }





                //todo gestire risultato minimo e reindirizzamento dopo completamento, non funziona l'if di controllo iniziale

            }

            session.removeAttribute("quiz");
            session.removeAttribute("nome_quiz");
            session.removeAttribute("id_posizione");
            session.removeAttribute("id_skill");

        } else{
            session.setAttribute("candidatura_fatta", "false");
            req.getRequestDispatcher("/home/homeuser.jsp").forward(req, resp);
        }
    }
}

