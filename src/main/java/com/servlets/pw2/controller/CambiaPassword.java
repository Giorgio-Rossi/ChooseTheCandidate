package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/cambiaPassword")
public class CambiaPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nuova_password = req.getParameter("nuova_password");
        String confirm_password = req.getParameter("confirm_password");

        Utente utente = (Utente) req.getSession().getAttribute("utente");

        UtenteIMPL utenteIMPL = new UtenteIMPL();

        if(nuova_password.equals(confirm_password)){
            String token = generateToken();

            utente.setPassword(nuova_password);
            utente.setToken(token);
            utenteIMPL.updateAll(utente);
            req.getSession().removeAttribute("utente");
            req.getSession().setAttribute("password_token",token);
            ErrorManager.setSuccessMessage("Password mofificata correttamente", req);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }else {
            ErrorManager.setErrorMessage("Le passowrd non corrispondono", req);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }

    }

    public static String generateToken() {
        return UUID.randomUUID().toString();
    }
}
