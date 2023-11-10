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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/RisulatatoQuiz")

public class GestisciRIsultatoQuiz extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        HashMap<Domanda, ArrayList<RisposteDomande>> risposte = (HashMap<Domanda, ArrayList<RisposteDomande>>) session.getAttribute("quiz");

        HashMap<String,Integer> rispsota_punteggio = new HashMap<>();

        System.out.println(risposte);

        for(Map.Entry<Domanda,ArrayList<RisposteDomande>> entry : risposte.entrySet() ){
            //System.out.println(entry.getKey().getTesto() +" "+entry.getKey().getPunteggio());
            System.out.println(req.getParameter(entry.getKey().getTesto()));
            System.out.println(entry.getKey().getPunteggio());
            rispsota_punteggio.put(req.getParameter(entry.getKey().getTesto()),entry.getKey().getPunteggio());
        }
        //System.out.println(rispsota_punteggio);
    }
}
