package com.candidatoDB.pw2.interfaces;

import java.util.ArrayList;

import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.QuizDomande;
import com.candidatoDB.pw2.entity.RisposteDomande;

public interface QuizDAO {

    Quiz getQuizById(int id_quiz);

    Integer getPunteggioTotaleById(int id_quiz);

    Integer getNdomandeById (int id_quiz);
    
    ArrayList<Quiz> getAllQuiz();

    void save(Quiz quiz, ArrayList<Domanda> domande, ArrayList<RisposteDomande> risposteDomande);

    void update(Quiz quiz, ArrayList<Domanda> domande, ArrayList<RisposteDomande> risposteDomande);

    void AddDomandeRisposte(Quiz quiz, Domanda nuova_domanda, RisposteDomande nuova_risposteDomande);

    void delete(Integer id_quiz);
}
