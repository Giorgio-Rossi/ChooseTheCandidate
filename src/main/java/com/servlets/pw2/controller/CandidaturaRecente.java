package com.servlets.pw2.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;


@WebServlet("/candidaturaRecente")
public class CandidaturaRecente extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	HttpSession session = request.getSession();
    	Utente utente = new Utente();
    	session.setAttribute("utente", utente);

        HttpSession ses = request.getSession();

        if (utente != null) {
            int userId = utente.getId_user();

            UtenteIMPL utenteIMPL = new UtenteIMPL();
             utente = utenteIMPL.findById(userId);

            CandidaturaIMPL candidaturaUser = new CandidaturaIMPL();
            CandidaturaUser candidatura = candidaturaUser.trovaCandidaturaPiùRecente(userId);
            request.setAttribute("candidatura", candidatura);


            request.getRequestDispatcher("/candidaturaRecente.jsp").forward(request, response);
            ;

        }
    }
    }


