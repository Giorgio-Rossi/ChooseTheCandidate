package com.servlets.pw2.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Regione;
import com.candidatoDB.pw2.interfaces.impl.*;
import com.servlets.pw2.controller.ErrorManager;

@WebServlet(name = "updatePosizioni", value = "/updatePosizioni")
public class AggiornaPosizioniAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PosizioneIMPL posizioneImpl;

	public void init() throws ServletException {
		posizioneImpl = new PosizioneIMPL();
	}

	public AggiornaPosizioniAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		   HttpSession session = req.getSession();
		
		
		 if (req.getParameter("id_posizione") != null) {
	            int id = Integer.parseInt(req.getParameter("id_posizione"));
	            PosizioneIMPL posizioneID = new PosizioneIMPL();
	       Posizione posizione =     posizioneID.getPosizioneById(id);
	            session.setAttribute("posizioneId", id);
	            posizione.setId_posizione(id);
		
		 }
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id_poszione = Integer.valueOf(req.getParameter("id_posizione"));
		String ruolo = req.getParameter("ruolo");
		int n_ammissioni = Integer.parseInt(req.getParameter("ammissioni"));
		String descrizione = req.getParameter("desc");
		String stato = req.getParameter("stato");
		SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
		String param = req.getParameter("data");
		Date data_inserimento;
		try {
			data_inserimento = in.parse(param);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}

		Posizione posizione = new Posizione();
		posizione.setRuolo(ruolo);
		posizione.setN_ammissioni(n_ammissioni);
		posizione.setDescrizione(descrizione);
		posizione.setStato(stato);
		posizione.setData_inserimento(new java.sql.Date(data_inserimento.getTime()));

		Integer id_citta = Integer.valueOf(req.getParameter("citta").split(" ", 3)[0]);
		Integer id_regione = Integer.valueOf(req.getParameter("citta").split(" ", 3)[1]);
		String nome_citta = req.getParameter("citta").split(" ", 3)[2];

		CittaIMPL cittaIMPL = new CittaIMPL();
		Regione regione = cittaIMPL.getRegione(id_regione);
		Citta citta = new Citta(id_citta, regione, nome_citta);
		posizione.setCitta(citta);


		Integer id_categoria = Integer.valueOf(req.getParameter("categoria"));

		CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();

		posizione.setCategoria(categoriaPosizioneIMPL.getCategoriaById(id_categoria));

		Integer id_quiz = Integer.valueOf(req.getParameter("quiz"));

		QuizIMPL quizImpl = new QuizIMPL();

		posizione.setQuiz(quizImpl.getQuizById(id_quiz));

		posizione.setId_posizione(id_poszione);

		System.out.println(posizione);

		posizioneImpl.updatePosizione(posizione);

		ErrorManager.setSuccessMessage("Posizione modificata con successo", req);
		req.getSession().setAttribute("posizione_modificata","true");
		req.getRequestDispatcher("admin/gestioneposizioni.jsp").forward(req, resp);

	}

}
