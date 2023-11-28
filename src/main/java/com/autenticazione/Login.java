package com.autenticazione;

import com.candidatoDB.pw2.entity.Utente;
import com.servlets.pw2.controller.DbOperations;
import com.servlets.pw2.controller.ErrorManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.util.Objects;


@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Utente utente;

        System.out.println(req.getSession().getAttribute("password_token"));
      
        try{
            utente = dbOperations.Autenticazione(email, password);
            System.out.println(utente);
            if(Objects.equals(utente.getRuolo_admin(), "user")){
                HttpSession session = req.getSession(true);
                session.setAttribute("utente", utente);
                resp.sendRedirect("home/homeuser.jsp");
            }else if(Objects.equals(utente.getRuolo_admin(), "admin")){
                HttpSession session = req.getSession(true);
                session.setAttribute("admin", utente);
                resp.sendRedirect("admin/candidature.jsp");
            }else{
                ErrorManager.setErrorMessage("Nome utente o password errati", req);
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        } catch (IOException e) {
            ErrorManager.setErrorMessage("Qualcosa è andato storto", req);
            throw new RuntimeException(e);
        }
    }

}
