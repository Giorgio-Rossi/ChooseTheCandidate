package com.Filter;

import com.candidatoDB.pw2.entity.Utente;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/admin/*")
public class AdminCheckFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        Utente utente = (Utente) session.getAttribute("admin");

        boolean isLogged = (session!=null && utente !=null);
        String loginURI = request.getContextPath()+"/login.jsp";
        System.out.println(loginURI);
        boolean isLoginRequest = request.getRequestURI().equals(loginURI);

        if ((isLogged || isLoginRequest) && utente.getRuolo_admin().equals("admin")) {
            filterChain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
    }
}
