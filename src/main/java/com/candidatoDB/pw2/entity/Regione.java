package com.candidatoDB.pw2.entity;


public class Regione {

    private int id_regione;
    private String nome;

    public Regione() {
        super();
    }
    public Regione(int id_regione, String nome) {
        super();
        this.id_regione = id_regione;
        this.nome = nome;
    }

    public int getId_regione() {
        return id_regione;
    }

    public void setId_regione(int id_regione) {
        this.id_regione = id_regione;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "Regione{" +
                "id_regione=" + id_regione +
                ", nome='" + nome + '\'' +
                '}';
    }
}
