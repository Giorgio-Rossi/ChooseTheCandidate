package com.candidatoDB.pw2.interfaces;

import java.util.List;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;

public interface PosizioneDAO {
	List<Posizione> searchByCity (Citta citta);
	List<Posizione> searchByRuolo (String ruolo);
	List<Posizione> searchByCategoria (CategoriaPosizione categoriaPosizione);
List<Posizione> findPosizioniPiuRecenti ();
List<Posizione> searchByFilters(String ruolo, Citta citta, CategoriaPosizione categoria);

}
