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
import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

@WebServlet(name = "gestionePosizioni", value = "/gestionePosizioni")
public class GestionePosizioni extends HttpServlet {
	
	private PosizioneIMPL posizioneImpl;
	
	public void init() throws ServletException {
		posizioneImpl = new PosizioneIMPL();
    }
	
	/*protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ruolo = req.getParameter("ruolo");
        int id_categoria = req.getp("id_categoria");
        
        double d = Double.parseDouble(aString);
        
        String password = req.getParameter("password");
        String cognome = req.getParameter("cognome");
        String telefono = req.getParameter("telefono");
        String codF = req.getParameter("codice_fiscale");

        SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
        String param = req.getParameter("data_nascita");
        Date data_nascita;

        try {
            data_nascita = in.parse(param);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);
        utente.setTelefono(telefono);
        utente.setCodice_fiscale(codF);
        utente.setData_nascita(new java.sql.Date(data_nascita.getTime()));
        utente.setPassword(password);

        if(!dbOperationsr.ChechUser(utente)) {
            UtenteIMPL utenteIMPL = new UtenteIMPL();
            utenteIMPL.save(utente);
            ErrorManager.setSuccessMessage("Registrazione effettuata, fai il login!",req);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }else{
            ErrorManager.setErrorMessage("Utente già esistente",req);
            req.getRequestDispatcher("/registrazione.jsp").forward(req, resp);
        }

    }
	
	public GestionePosizioni() {
		// TODO Auto-generated constructor stub
	}*/

}
