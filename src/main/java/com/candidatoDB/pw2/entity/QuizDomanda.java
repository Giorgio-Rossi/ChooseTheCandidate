package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;
import com.candidatoDB.pw2.entity.Domanda;

//id_quiz_domanda int identity not null primary key,
//id_domanda int not null,
//id_quiz int not null
//
//CONSTRAINT FK_Quiz_QuizDomanda FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
//CONSTRAINT FK_Domanda_QuizDomanda FOREIGN KEY (id_domanda) REFERENCES Domanda (id_domanda)

public class QuizDomanda {

	
	private int id_quiz_domanda;
	private List<Domanda> id_domanda = new ArrayList<Domanda>();
	private int id_quiz;
}
