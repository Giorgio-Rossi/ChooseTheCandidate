package com.servlets.pw2.controller;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.candidatoDB.pw2.entity.Utente;
import com.servlets.pw2.controller.DbOperations;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;
 

@WebServlet("/passwordDimenticata")
@MultipartConfig
public class passwordDimenticataServlet extends HttpServlet {

	String profilo = "/profilo/passwordDimenticata.jsp";
	private DbOperations dbOperationsr;
	
	@Override
	public void init() throws ServletException {
		dbOperationsr = new DbOperations();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String chiaveSicurezza = req.getParameter("chiaveSicurezza");
        String email = req.getParameter("email");
        Utente utente = new Utente();
      
        try{
            utente = dbOperationsr.CheckChiaveSicurezza(chiaveSicurezza, email);
            System.out.println(utente);
        
                HttpSession session = req.getSession(true);
                session.setAttribute("utente", utente);
                resp.sendRedirect("home/resetPassword.jsp");
    
           
            
        } catch (IOException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
            throw new RuntimeException(e);
            
        }
	}
}








































































