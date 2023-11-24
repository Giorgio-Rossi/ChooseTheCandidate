package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/EliminaIstruzione")

public class EliminaIstruzione extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_istruzione = Integer.parseInt(req.getParameter("id_istruzione"));
        System.out.println(id_istruzione);

        IstruzioneIMPL istruzioneIMPL = new IstruzioneIMPL();

        istruzioneIMPL.deleteIstruzioneUtente(id_istruzione);

        req.getSession().setAttribute("posizione_eliminata","true");
        req.getRequestDispatcher("home/curriculum.jsp").forward(req, resp);
    }
}
