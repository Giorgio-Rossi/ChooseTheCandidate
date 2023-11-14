package com.servlets.pw2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/candidatureUtente")
public class CandidatureEffettuateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (request.getParameter("id_utente") != null) {
            int userId = Integer.parseInt(request.getParameter("id_utente"));
            UtenteIMPL utenteId = new UtenteIMPL();
            utenteId.findById(userId);
            session.setAttribute("userId", userId);
            utente.setId_user(userId);
        }
        

        CandidaturaIMPL candidaturaDAO = new CandidaturaIMPL();
        List<CandidaturaUser> candidatureUtente = candidaturaDAO.findCandidatureUtenteById(utente.getId_user());
        
        request.setAttribute("candidatureUtente", candidatureUtente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/home/visualizzaCandidature.jsp");
        dispatcher.forward(request, response);
    }
}
