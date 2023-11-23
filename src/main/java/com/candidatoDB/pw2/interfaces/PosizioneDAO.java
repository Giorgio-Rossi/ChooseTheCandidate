package com.candidatoDB.pw2.interfaces;

import java.util.ArrayList;
import java.util.List;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;

public interface PosizioneDAO {
	List<Posizione> searchByCity(Citta citta);

	List<Posizione> searchByRuolo(String ruolo);

	List<Posizione> searchByCategoria(CategoriaPosizione categoriaPosizione);

	List<Posizione> searchByCategoriaAndRuolo(String ruolo,CategoriaPosizione categoriaPosizione);

	List<Posizione> searchByCittaAndRuolo(Citta citta, String ruolo);

	List<Posizione> searchByCittaAndCategoria(Citta citta, CategoriaPosizione categoriaPosizione);

	List<Posizione> findPosizioniPiuRecenti();

	List<Posizione> searchByFilters(String ruolo, Citta citta, CategoriaPosizione categoria);
	
	List<Posizione> topTreAnnunci (Citta citta);

	ArrayList<Posizione> getAllPosizioni();

	ArrayList<String> getAllRuoli();
	
	Posizione getPosizioneById(int id_posizione);
	
	void nuovaPosizione(Posizione posizione);
	
	void updatePosizione(Posizione posizione);

	void deletePosizione(int id_posizione);
	
	
}

