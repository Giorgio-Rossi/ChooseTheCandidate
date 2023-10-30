package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;

public class Quiz {
private int id_quiz;
private String descrizione;
private int n_domande;

private List<Domanda> id_domanda = new ArrayList<Domanda>();

// Risposte
private int id_risposta;
private String scelta1;
private String scelta2;
private String scelta3;
private String scelta4;
private int scelta_corretta;

}
