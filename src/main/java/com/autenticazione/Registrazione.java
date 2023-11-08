package com.autenticazione;

import com.servlets.pw2.controller.DbOperations;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
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
        String dataNascita = req.getParameter("data_nascita");
        System.out.println(dataNascita);
        String conferma_password= req.getParameter("check_password");

        if (password.equals(conferma_password)){
            try{
                System.out.println(password.equals(conferma_password));
                dbOperationsr.Registrazione(nome, cognome, email, password, telefono, codF, dataNascita);                      
                resp.sendRedirect("home/homeuser.jsp");         
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
