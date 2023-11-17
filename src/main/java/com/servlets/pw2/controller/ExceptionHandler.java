package com.servlets.pw2.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExceptionHandler")
public class ExceptionHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        processError(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        processError(request, response);
    }

    private void processError(HttpServletRequest request,
                              HttpServletResponse response) throws IOException {

        Throwable throwable = (Throwable) request
                .getAttribute("javax.servlet.error.exception");
        Integer statusCode = (Integer) request
                .getAttribute("javax.servlet.error.status_code");
        String servletName = (String) request
                .getAttribute("javax.servlet.error.servlet_name");
        if (servletName == null) {
            servletName = "Unknown";
        }
        String requestUri = (String) request
                .getAttribute("javax.servlet.error.request_uri");
        if (requestUri == null) {
            requestUri = "Unknown";
        }

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.write("<html><head><title>Exception/Dettagli Errore</title></head><body>");
        if(statusCode != 500){
            out.write("<h3>Dettagli dell'errore</h3>");
            out.write("<strong>Codice Errore</strong>:"+statusCode+"<br>");
            out.write("<strong>URI Richiesto</strong>:"+requestUri);
        }else{
            out.write("<h3>Dettagli Exception</h3>");
            out.write("<ul><li>Nome Servlet:"+servletName+"</li>");
            out.write("<li>Nome Exception:"+throwable.getClass().getName()+"</li>");
            out.write("<li>URI Richiesto:"+requestUri+"</li>");
            out.write("<li>Messaggio dell'Exception:"+throwable.getMessage()+"</li>");
            out.write("</ul>");
        }

        out.write("<br><br>");
        out.write("</body></html>");
    }
}