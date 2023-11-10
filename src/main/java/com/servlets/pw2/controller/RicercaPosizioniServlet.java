
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
		String ruolo =  request.getParameter("ruolo") == null ? "" :  request.getParameter("ruolo");
		String cittaId = request.getParameter("citta") == null ? "" :  request.getParameter("citta");
		String categoriaId = request.getParameter("categoria") == null ? "" :  request.getParameter("categoria");

		System.out.println(ruolo+ " " +cittaId+ " " +categoriaId);

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


		if (ruolo.isEmpty() && (cittaId == null || cittaId.isEmpty())
				&& (categoriaId == null || categoriaId.isEmpty())) {
			risultatiRicerca = posizioneIMPL.findPosizioniPiuRecenti();
		} else if (!categoriaId.isEmpty()) {

			risultatiRicerca = posizioneIMPL.searchByCategoria(categoria);
		} else if (!cittaId.isEmpty()) {

			risultatiRicerca = posizioneIMPL.searchByCity(citta);
		} else if (!cittaId.isEmpty() && !ruolo.isBlank()) {

			risultatiRicerca = posizioneIMPL.searchByCittaAndRuolo(citta, ruolo);
		} else if (!categoriaId.isBlank() && !ruolo.isBlank()) {

			risultatiRicerca = posizioneIMPL.searchByCategoriaAndRuolo(categoria, ruolo);
		} else if (!cittaId.isEmpty() && !categoriaId.isBlank()) {

			risultatiRicerca = posizioneIMPL.searchByCittaAndCategoria(citta, categoria);
		} else {

			risultatiRicerca = posizioneIMPL.searchByRuolo(ruolo);
		}

		System.out.println(risultatiRicerca);

		if (risultatiRicerca != null && !risultatiRicerca.isEmpty()) {
			request.setAttribute("risultatiRicerca", risultatiRicerca);
		} else {
			request.setAttribute("risultatiRicerca", new ArrayList<Posizione>());
		}

		request.getRequestDispatcher("/home/ricercaPosizioni.jsp").forward(request, response);
	}
}
