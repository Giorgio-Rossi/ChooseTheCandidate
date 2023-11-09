package com.candidatoDB.pw2.entity;

import java.util.Objects;

public class CategoriaPosizione {
	
	private int id_categoria;
	private String nome_categoria;
	
	
	public CategoriaPosizione() {
		super();
	}
	
	public CategoriaPosizione(int id_categoria, String nome_categoria) {
		super();
		this.id_categoria = id_categoria;
		this.nome_categoria = nome_categoria;
	}
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getNome_categoria() {
		return nome_categoria;
	}
	public void setNome_categoria(String nome_categoria) {
		this.nome_categoria = nome_categoria;
	}

	@Override
	public String toString() {
		return "CategoriaPosizione [id_categoria=" + id_categoria + ", nome_categoria=" + nome_categoria + "]";
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
