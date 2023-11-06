package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/profiloUtente")
public class ProfiloServlet extends HttpServlet {

    String profilo  = "/profilo/profilo.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        //Integer id_user = (Integer) session.getAttribute("id");


        //UtenteIMPL utenteIMPL = new UtenteIMPL();
        //Utente utente = utenteIMPL.findById(id_user);

        //req.setAttribute("utente", utente);
        //RequestDispatcher requestDispatcher = req.getRequestDispatcher(profilo);
       // requestDispatcher.forward(req,resp);
    }
}
