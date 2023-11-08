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
public class RicercaPosizioniServelt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ruolo = request.getParameter("ruolo");
        String cittaId = request.getParameter("citta");
        String categoriaId = request.getParameter("categoria");

        Citta citta = new Citta();
        citta.setId_citta(Integer.parseInt(cittaId));

        CategoriaPosizione categoria = new CategoriaPosizione();
        categoria.setId_categoria(Integer.parseInt(categoriaId));

        PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
        List<Posizione> risultatiRicerca = posizioneIMPL.searchByFilters(ruolo, citta, categoria);

        if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
            request.setAttribute("risultatiRicerca", risultatiRicerca);
        } else {
            
            request.setAttribute("risultatiRicerca", new ArrayList<Posizione>());
        }

        request.getRequestDispatcher("/ricercaPosizioni.jsp").forward(request, response);
    }
}
