package com.servlets.pw2.controller;

import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;
import com.candidatoDB.pw2.interfaces.impl.SkillIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/eliminaSkill")
public class EliminaSkill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id_skill = Integer.parseInt(req.getParameter("idSkill"));
        SkillIMPL skillIMPL = new SkillIMPL();


        skillIMPL.delete(id_skill);

        req.getSession().setAttribute("skill_eliminata","true");
        req.getRequestDispatcher("admin/gestioneSkills.jsp").forward(req, resp);
    }
}
