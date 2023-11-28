package com.servlets.pw2.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.candidatoDB.pw2.entity.Utente;
import com.servlets.pw2.controller.DbOperations;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
 

@WebServlet("/passwordDimenticata")
@MultipartConfig
public class passwordDimenticataServlet extends HttpServlet {

	private DbOperations dbOperationsr;
	
	@Override
	public void init() throws ServletException {
		dbOperationsr = new DbOperations();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String token = req.getParameter("token");
        String email = req.getParameter("email");
        Utente utente = new Utente();

        try{
            utente = dbOperationsr.CheckChiaveSicurezza(token, email);

            if(utente.getId_user() == 0) {
                ErrorManager.setErrorMessage("Il token o l'email sono sbagliati", req);
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            } else {
                req.getSession().setAttribute("token_giusto", "true");
                req.getSession().setAttribute("utente", utente);
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
       
        } catch (IOException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
            throw new RuntimeException(e);
        }

	}
}









































































