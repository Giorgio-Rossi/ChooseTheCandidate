package com.servlets.pw2.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import com.servlets.pw2.controller.ErrorManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Regione;
import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
import com.candidatoDB.pw2.interfaces.impl.CittaIMPL;
import com.candidatoDB.pw2.interfaces.impl.CategoriaPosizioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;

@WebServlet(name = "gestionePosizioni", value = "/gestionePosizioni")
public class GestionePosizioni extends HttpServlet {
	
	private PosizioneIMPL posizioneImpl;
	
	public void init() throws ServletException {
		posizioneImpl = new PosizioneIMPL();
    }
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ruolo = req.getParameter("ruolo");
        int n_ammissioni = Integer.parseInt(req.getParameter("n_ammissioni"));
        int id_quiz = Integer.parseInt(req.getParameter("id_quiz"));
        String descrizione = req.getParameter("descrizione");
        String stato = req.getParameter("stato");
        SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
        String param = req.getParameter("data_inserimento");
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
        
        Integer id_categoria = Integer.valueOf(req.getParameter("categoria").split(" ", 3)[0]);
        String nome_categoria = req.getParameter("categoria").split(" ", 3)[2];

        CategoriaPosizione Cat = new CategoriaPosizione(id_categoria, nome_categoria);
        posizione.setCategoria(Cat);
	}
        
       /* if(!dbOperationsr.ChechUser(utente)) {
            UtenteIMPL utenteIMPL = new UtenteIMPL();
            utenteIMPL.save(utente);
            ErrorManager.setSuccessMessage("Registrazione effettuata, fai il login!",req);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }else{
            ErrorManager.setErrorMessage("Utente già esistente",req);
            req.getRequestDispatcher("/registrazione.jsp").forward(req, resp);
        }

    }
	*/
	public GestionePosizioni() {
		// TODO Auto-generated constructor stub
	}

}
