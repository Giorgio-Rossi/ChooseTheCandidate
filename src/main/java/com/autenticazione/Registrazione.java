package com.autenticazione;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
import com.servlets.pw2.controller.DbOperations;
import com.servlets.pw2.controller.ErrorManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "registrazione", value = "/registrazione")
public class Registrazione extends HttpServlet {
    private DbOperations dbOperationsr;
    //private UtenteIMPL utente;

    @Override
    public void init() throws ServletException {
        dbOperationsr = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
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


        String conferma_password= req.getParameter("check_password");

        if (password.equals(conferma_password)){
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
    }
}
