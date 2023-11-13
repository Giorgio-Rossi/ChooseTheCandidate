package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;
import com.candidatoDB.pw2.interfaces.impl.UtenteQuizIMPL;

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
import java.util.Map;

@WebServlet("/RisulatatoQuiz")

public class GestisciRIsultatoQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        Integer id_quiz = (Integer) session.getAttribute("id_quiz");

        Utente utente = (Utente) session.getAttribute("utente");

        UtenteQuizIMPL utenteQuizIMPL = new UtenteQuizIMPL();

        System.out.println(utenteQuizIMPL.getUtenteQuizById(id_quiz, utente));

        if(utenteQuizIMPL.getUtenteQuizById(id_quiz, utente) == null) {

            UtenteQuiz utenteQuiz = new UtenteQuiz();

            HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) session.getAttribute("quiz");

            Integer punteggio_quiz = 0;

            int i = 0;
            for (Map.Entry<Domanda, ArrayList<RisposteDomande>> entry : risposte.entrySet()) {

                String rispsota = (req.getParameter(String.valueOf(i++)));


                if (rispsota != null) {
                    for (RisposteDomande r : entry.getValue()) {
                        if (r.checkSceltaCorretta(rispsota)) {
                            System.out.println("coretto");
                            punteggio_quiz += entry.getKey().getPunteggio();
                        }
                    }
                }
            }

            utenteQuiz.setId_quiz(id_quiz);
            utenteQuiz.setId_user(utente.getId_user());
            utenteQuiz.setPunteggio(punteggio_quiz);

            utenteQuizIMPL.Save(utenteQuiz);

            session.setAttribute("candidatura_fatta", true);

            session.removeAttribute("quiz");
            session.removeAttribute("nome_quiz");

            resp.sendRedirect(req.getContextPath()+"/home/homeuser.jsp");

        } else{
            session.setAttribute("candidatura_fatta", false);
            req.getRequestDispatcher("/home/homeuser.jsp").forward(req, resp);
        }
    }
}

//todo reinderizzare alla home con un modale di successo, se la candidatura è già stata inviata allora disabilitare il bottone candidati
