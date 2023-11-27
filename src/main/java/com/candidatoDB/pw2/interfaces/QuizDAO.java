package com.candidatoDB.pw2.interfaces;

import java.util.ArrayList;

import com.candidatoDB.pw2.entity.*;

public interface QuizDAO {

    Quiz getQuizById(int id_quiz);

    Integer getPunteggioTotaleById(int id_quiz);

    Integer getNdomandeById (int id_quiz);
    
    ArrayList<Quiz> getAllQuiz();

    void save(Quiz quiz, ArrayList<Domanda> domande, ArrayList<RisposteDomande> risposteDomande);

    void update(Quiz quiz, ArrayList<Domanda> domande, ArrayList<RisposteDomande> risposteDomande);

    void AddDomandeRisposte(Quiz quiz, Domanda nuova_domanda, RisposteDomande nuova_risposteDomande);

    ArrayList<Posizione> getAllPosizioniByQuiz(int id_quiz);

    void delete(Integer id_quiz);
}
