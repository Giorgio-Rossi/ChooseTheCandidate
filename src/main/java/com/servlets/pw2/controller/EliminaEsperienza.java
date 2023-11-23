package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.EsperienzaIMPL;
import com.candidatoDB.pw2.interfaces.impl.IstruzioneIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/EliminaEsperienza")

public class EliminaEsperienza extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_esperienza = Integer.parseInt(req.getParameter("id_esperienza"));
        System.out.println(id_esperienza);

        EsperienzaIMPL esperienzaIMPL = new EsperienzaIMPL();

        esperienzaIMPL.deleteEsperienzaUtente(id_esperienza);

        req.getSession().setAttribute("esperienza_eliminata","true");
        req.getRequestDispatcher("home/curriculum.jsp").forward(req, resp);
    }
}
