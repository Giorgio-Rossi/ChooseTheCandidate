package com.candidatoDB.pw2.entity;

import java.util.Objects;

public class CategoriaPosizione {
	
	private int id_categoria;
	private String descrizione;
	
	
	public CategoriaPosizione() {
		super();
	}
	
	public CategoriaPosizione(int id_categoria, String descrizione) {
		super();
		this.id_categoria = id_categoria;
		this.descrizione = descrizione;
	}
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	@Override
	public String toString() {
		return "CategoriaPosizione [id_categoria=" + id_categoria + ", descrizione=" + descrizione + "]";
	}
	
	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoriaPosizione that = (CategoriaPosizione) o;

        return id_categoria == that.id_categoria;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id_categoria);
    }
	
}
