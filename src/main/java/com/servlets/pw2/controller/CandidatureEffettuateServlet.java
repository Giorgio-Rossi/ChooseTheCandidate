
package com.servlets.pw2.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.CandidaturaDAO;
import com.candidatoDB.pw2.interfaces.impl.CandidaturaIMPL;
import com.candidatoDB.pw2.entity.CandidaturaUser;

@WebServlet("/findCandidature")

public class CandidatureEffettuateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utenteInSessione = (Utente) session.getAttribute("utente");

        if (utenteInSessione != null) {
            int userId = utenteInSessione.getId_user();
            String dataCandidaturaParam = request.getParameter("data_candidatura");
            
            if (dataCandidaturaParam != null && !dataCandidaturaParam.isEmpty()) {

            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
            	Date dataCandidatura = null;

            	try {
            	    dataCandidatura = sdf.parse(dataCandidaturaParam);
            	} catch (ParseException e) {
            	 
            	    e.printStackTrace(); // 
            	}

            	CandidaturaIMPL candidaturaUserIMPL = new CandidaturaIMPL();
            	List<CandidaturaUser> candidature = candidaturaUserIMPL.findCandidatureUtente(userId, dataCandidatura);
            	request.setAttribute("candidature", candidature);

            } else  {
               
                CandidaturaIMPL candidaturaUserIMPL = new CandidaturaIMPL();
                List<CandidaturaUser> candidature = candidaturaUserIMPL.findCandidatureUtenteById(userId);
                request.setAttribute("candidature", candidature);
            }

            request.getRequestDispatcher("/visualizzaCandidature.jsp").forward(request, response);;
         
        } 
    }
}

