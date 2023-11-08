package com.servlets.pw2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;

@WebServlet("/RicercaPosizioniServlet")
public class RicercaPosizioniServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ruolo = request.getParameter("ruolo");
        String cittaId = request.getParameter("citta");
        String categoriaId = request.getParameter("categoria");

        Citta citta = null;
        CategoriaPosizione categoria = new CategoriaPosizione();

        if (cittaId != null && !cittaId.isEmpty()) {
            citta = new Citta();
            citta.setId_citta(Integer.parseInt(cittaId));
        }

        if (categoriaId != null && !categoriaId.isEmpty()) {
            categoria.setId_categoria(Integer.parseInt(categoriaId));
        }

        PosizioneIMPL posizioneIMPL = new PosizioneIMPL();

        List<Posizione> risultatiRicerca = new ArrayList<>();
        
     
        if (ruolo.isEmpty() && (cittaId == null || cittaId.isEmpty()) && (categoriaId == null || categoriaId.isEmpty())) {
            risultatiRicerca = posizioneIMPL.findPosizioniPiuRecenti();
        } else {
     
            risultatiRicerca = posizioneIMPL.searchByFilters(ruolo, citta, categoria);
        }

        if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
            request.setAttribute("risultatiRicerca", risultatiRicerca);
        } else {
            request.setAttribute("risultatiRicerca", new ArrayList<Posizione>());
        }

        request.getRequestDispatcher("/risultatiRicerca.jsp").forward(request, response);
    }
}
