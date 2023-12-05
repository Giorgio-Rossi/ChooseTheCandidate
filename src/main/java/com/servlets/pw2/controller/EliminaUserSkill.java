package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.SkillIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/eliminaUserSkill")
public class EliminaUserSkill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_skill = Integer.parseInt(req.getParameter("idSkill"));
        Integer id_user = Integer.parseInt(req.getParameter("idUser"));
        SkillIMPL skillIMPL = new SkillIMPL();


        skillIMPL.deleteUserSkill(id_skill, id_user);

        req.getSession().setAttribute("skill_rimossa","true");
        req.getRequestDispatcher("/home/curriculum.jsp").forward(req, resp);
    }
}
