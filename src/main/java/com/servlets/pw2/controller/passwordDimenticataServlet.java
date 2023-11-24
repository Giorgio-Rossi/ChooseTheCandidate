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
	 /*

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/resetPassword.jsp").forward(request, response);
    }
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String chiaveSegreta = request.getParameter("chiaveSegreta");

        if (isValidUser(email, chiaveSegreta)) {


            response.sendRedirect(request.getContextPath() + "/passwordReset.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/resetError.jsp");
        }
    }

	*/
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String chiaveSicurezza = req.getParameter("chiaveSicurezza");
        String email = req.getParameter("email");
        Utente utente = new Utente();
        
        utente = dbOperationsr.CheckChiaveSicurezza(chiaveSicurezza, email);
      
        try{
           // utente = dbOperationsr.CheckChiaveSicurezza(chiaveSicurezza, email);
            System.out.println(utente);
        
            if(utente.getId_user() == 0) {
                ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
            	resp.sendRedirect("passwordDimenticata.jsp");
            	System.out.println("errore");
            } else {
                HttpSession session = req.getSession(true);
                session.setAttribute("utente", utente);
                resp.sendRedirect("home/resetPassword.jsp");
            }
       
        } catch (IOException e) {
        	
        	
            ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
            throw new RuntimeException(e);
            
        }
        
        String verificaChiaveSicurezza= req.getParameter("chiaveSicurezza");

        if (chiaveSicurezza.equals(verificaChiaveSicurezza)){
            utente.setChiaveSicurezza(verificaChiaveSicurezza);
        }
	}
    }









































































