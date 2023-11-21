package com.servlets.pw2.controller;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.RisposteDomande;
import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.interfaces.impl.QuizDomandaIMPL;
import com.candidatoDB.pw2.interfaces.impl.QuizIMPL;
import com.candidatoDB.pw2.interfaces.impl.RisposteDomandaIMPL;
import com.candidatoDB.pw2.interfaces.impl.SkillIMPL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
@WebServlet("/verificaSkill")
public class VerificaQuizServlet  extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        SkillIMPL skillIMPL = new SkillIMPL();

        Skill skill = skillIMPL.findByName(req.getParameter("id"));

        QuizIMPL quizIMPL = new QuizIMPL();
        String nome_quiz = quizIMPL.getQuizById(skill.getId_quiz()).getDescrizione();


        QuizDomandaIMPL quizDomandaIMPL = new QuizDomandaIMPL();
        ArrayList<Domanda> domande = quizDomandaIMPL.getDomandeByIdQuiz(skill.getId_quiz());

        RisposteDomandaIMPL risposteDomandaIMPL = new RisposteDomandaIMPL();
        HashMap<Domanda,ArrayList<RisposteDomande>> risposte = new HashMap<>();

        for(Domanda d : domande){
            risposte.put(d,risposteDomandaIMPL.getRisposteDomandaByIdDomanda(d.getId_domanda()));
        }

        session.setAttribute("quiz",risposte);
        session.setAttribute("nome_quiz",nome_quiz);
        session.setAttribute("id_quiz",skill.getId_quiz());
        session.setAttribute("id_skill",skill.getId_skill());

        req.getRequestDispatcher("/home/quiz.jsp").forward(req, resp);

    }
}
