package com.example.pw2.controller;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
	private String message;

    //private static final long serialVersionUID = 1L;

    public void init() {
        message = "Le lezioni di linuxxxxx sono 2 palle!!!!!!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "ciao493"+ "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}