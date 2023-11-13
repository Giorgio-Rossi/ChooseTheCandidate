package com.servlets.pw2.controller;

import java.io.IOException;
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

@WebServlet("/findCandidature")
public class CandidatureEffettuateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");

      
        if (utente != null) {
            int userId = utente.getId_user();

            CandidaturaIMPL candidaturaUserIMPL = new CandidaturaIMPL();
            List<CandidaturaUser> candidature = candidaturaUserIMPL.findCandidatureUtenteById(userId);

           
            request.setAttribute("findCandidature", candidature);

            System.out.println("Le candidature sono queste: " + candidature);
        } else {
     
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return; 
        }

    
        request.getRequestDispatcher("/visualizzaCandidature.jsp").forward(request, response);
    }
}



