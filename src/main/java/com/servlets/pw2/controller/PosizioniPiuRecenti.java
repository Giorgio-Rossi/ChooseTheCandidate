package com.servlets.pw2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;

@WebServlet("/posizioniPiuRecenti")
public class PosizioniPiuRecenti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
		List<Posizione> posizioniPiuRecenti = posizioneIMPL.findPosizioniPiuRecenti();

		request.setAttribute("posizioniPiuRecenti", posizioniPiuRecenti);

		RequestDispatcher dispatcher = request.getRequestDispatcher("annunciRecenti.jsp");
		dispatcher.forward(request, response);
	}

}
