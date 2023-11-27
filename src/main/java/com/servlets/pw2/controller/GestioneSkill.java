package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.interfaces.impl.SkillIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/gestioneSkill")
public class GestioneSkill extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_quiz = Integer.parseInt(req.getParameter("quiz"));
        String nome = req.getParameter("nome");
        String tipologia = req.getParameter("tipologia");

        SkillIMPL skillIMPL = new SkillIMPL();

        Skill nuova_skill = new Skill();

        nuova_skill.setNome(nome);
        nuova_skill.setTipo_skill(tipologia);
        nuova_skill.setId_quiz(id_quiz);

        skillIMPL.save(nuova_skill);

        req.getSession().setAttribute("skill_creata", "true");

        req.getRequestDispatcher("admin/gestioneSkills.jsp").forward(req, resp);
    }
}
