package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.interfaces.impl.SkillIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modificaSkill")
public class ModificaSkill extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_skill = Integer.parseInt(req.getParameter("id_skill"));
        int id_quiz = Integer.parseInt(req.getParameter("quiz"));
        String nome = req.getParameter("nome");
        String tipologia = req.getParameter("tipologia");

        SkillIMPL skillIMPL = new SkillIMPL();
        Skill skill_modificata = skillIMPL.findById(id_skill);

        skill_modificata.setId_quiz(id_quiz);
        skill_modificata.setNome(nome);
        skill_modificata.setTipo_skill(tipologia);

        skillIMPL.update(skill_modificata);

        req.getSession().setAttribute("skill_modificata", "true");

        req.getRequestDispatcher("admin/gestioneSkills.jsp").forward(req, resp);

    }
}
