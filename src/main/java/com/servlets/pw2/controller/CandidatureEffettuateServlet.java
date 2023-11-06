package com.servlets.pw2.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.CandidaturaDAO;
import com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL;
import com.candidatoDB.pw2.entity.CandidaturaUser;

@WebServlet("/findCandidature")
public class CandidatureEffettuateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Utente utenteInSessione = (Utente) session.getAttribute("utente");

		String dateString = request.getParameter("data_candidatura");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			Date dataCandidatura = dateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (utenteInSessione != null) {
			int userId = utenteInSessione.getId_user();

			CandidaturaIMPL candidaturaImpl = new CandidaturaIMPL();

			List<CandidaturaUser> candidature = candidaturaImpl.findCandidatureUtente(userId, dataCandidatura);

			request.setAttribute("candidature", candidature);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/visualizzaCandidature.jsp");
			dispatcher.forward(request, response);
		} else {

			response.sendRedirect("/login.jsp");
		}
	}
}
