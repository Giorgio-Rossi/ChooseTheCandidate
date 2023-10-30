package com.autenticazione;

import com.servlets.pw2.controller.DbOperations;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
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
        try{
            if(dbOperations.Autenticazione(email, password).equals("user")){
                HttpSession session = req.getSession(true);
                session.setAttribute("email",email);
                session.setAttribute("ruolo","user");
                resp.sendRedirect("home/homeuser.jsp");
            }else{
                System.out.println("Sono un admin");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
