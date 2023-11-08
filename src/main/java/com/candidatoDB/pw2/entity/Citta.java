package com.candidatoDB.pw2.entity;

public class Citta {
	
	private int id_citta;
	private Regione regione;
	private String nome;
		
	
	public Citta() {
		super();
	}


	public Citta(int id_citta, Regione regione, String nome) {
		super();
		this.id_citta = id_citta;
		this.regione = regione;
		this.nome = nome;
	}
	
		
	public int getId_citta() {
		return id_citta;
	}
	public void setId_citta(int id_citta) {
		this.id_citta = id_citta;
	}
	public Regione getRegione() {
		return regione;
	}
	public void setRegione(Regione regione) {
		this.regione = regione;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String toString() {
		return "Citta [id_citta=" + id_citta + ", regione=" + regione + ", nome=" + nome + "]";
	}

	
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Citta citta = (Citta) o;

        if (nome != null ? !nome.equals(citta.nome) : citta.nome != null) return false;
        if (regione != null ? !regione.equals(citta.regione) : citta.regione != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nome != null ? nome.hashCode() : 0;
        result = 31 * result + (regione != null ? regione.hashCode() : 0);
        return result;
    }
}
	 

