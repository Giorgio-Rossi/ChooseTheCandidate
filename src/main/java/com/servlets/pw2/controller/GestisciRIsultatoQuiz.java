package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.RisposteDomande;

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

        String id_quiz = (String) session.getAttribute("id_quiz");

        HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) session.getAttribute("quiz");

        //HashMap<String,Integer> rispsota_punteggio = new HashMap<>();

        Integer punteggio_quiz = 0;

        System.out.println(risposte);

        int i=0;
        for(Map.Entry<Domanda,ArrayList<RisposteDomande>> entry : risposte.entrySet() ){

            String rispsota = (req.getParameter(String.valueOf(i++)));


            if(rispsota!=null){
                for (RisposteDomande r : entry.getValue()){
                    System.out.println(entry.getKey().getTesto());
                    if(r.checkSceltaCorretta(rispsota)){
                        System.out.println("coretto");
                        punteggio_quiz+= entry.getKey().getPunteggio();
                    }
                }
            }
        }


        System.out.println(punteggio_quiz);
    }
}

//todo reinderizzare alla home con un modale di successo, se la candidatura è già stata inviata allora disabilitare il bottone candidati
