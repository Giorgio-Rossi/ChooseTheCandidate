package com.servlets.pw2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;

@WebServlet("/posizioniPiuRecenti")
public class PosizioniPiuRecenti extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Utente loginUser = (Utente) request.getSession().getAttribute("loginUser");

        if (loginUser != null) {
            int userCityId = loginUser.getId_citta().getId_citta();

            Citta citta = new Citta();
            citta.setId_citta(userCityId);

            PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
            List<Posizione> posizioniPiuRecenti = posizioneIMPL.topTreAnnunci(citta);

            List<Posizione> posizioniFiltrate = new ArrayList<>();
            for (Posizione posizione : posizioniPiuRecenti) {
                if (posizione.getCitta().getId_citta() == userCityId) {
                    posizioniFiltrate.add(posizione);
                }
            }

            request.setAttribute("posizioniPiuRecenti", posizioniFiltrate);

            RequestDispatcher dispatcher = request.getRequestDispatcher("homeuser.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}

