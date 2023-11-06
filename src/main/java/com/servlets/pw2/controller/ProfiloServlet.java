package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;


@WebServlet("/profiloUtente")
@MultipartConfig
public class ProfiloServlet extends HttpServlet {

    String profilo  = "/profilo/profilo.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //TODO IMPLEMENTARE LA MODIFICA DEL PROFILO
        Part part = req.getPart("foto_profilo");
        String fileName = part.getSubmittedFileName();
        String path = getServletContext().getRealPath("/" + "img/fotoprofili" + File.separator+ fileName);

        InputStream is = part.getInputStream();
        boolean success = uploadFile(is, path);
        if(success){
            System.out.println("File caricato correttamente" + path);
            req.getRequestDispatcher("/profilo.jsp").forward(req, resp);
        }
    }

    public boolean uploadFile(InputStream is, String path){
        boolean test = false;

        try {
            byte[] bytes = new byte[is.available()];
            is.read();
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();

            test=true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return test;
    }
}
