package com.logout;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="logout", value="/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("ruolo").equals("user")){
            req.getSession().invalidate();
            resp.sendRedirect("login.jsp");
        }else {
            req.getSession().invalidate();
            resp.sendRedirect("login.jsp");
        }
    }
}
