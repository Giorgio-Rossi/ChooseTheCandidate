package com.logout;



import com.candidatoDB.pw2.entity.Utente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="logout", value="/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Utente utente = (Utente) session.getAttribute("utente");

        if(utente.getRuolo_admin().equals("user")){
            req.getSession().invalidate();
            resp.sendRedirect("login.jsp");
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            resp.setHeader("Pragma", "no-cache");
            resp.setDateHeader("Expires", 0);
        }else {
            req.getSession().invalidate();
            resp.sendRedirect("login.jsp");
        }
    }
}
