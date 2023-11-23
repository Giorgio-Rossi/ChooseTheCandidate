package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.PosizioneIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/eliminaPosizione")
public class EliminaPosizioneServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_posizione = Integer.parseInt(req.getParameter("idPosizione"));
        System.out.println(id_posizione);
        PosizioneIMPL posizioneIMPL = new PosizioneIMPL();

        posizioneIMPL.deletePosizione(id_posizione);
        req.getSession().setAttribute("posizione_eliminata","true");
        req.getRequestDispatcher("admin/gestioneposizioni.jsp").forward(req, resp);

    }
}
