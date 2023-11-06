package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;


@WebServlet("/profiloUtente")
@MultipartConfig
public class ProfiloServlet extends HttpServlet {

    String profilo  = "/profilo/profilo.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //TODO IMPLEMENTARE LA MODIFICA DEL PROFILO
        String uploadPath = "src/main/webapp/img/fotoprofili";

        //System.out.println(fileName);
        for (Part part : req.getParts()) {
            String fileName = part.getSubmittedFileName();
            part.write(uploadPath + File.separator + fileName);
        }

    }
}
