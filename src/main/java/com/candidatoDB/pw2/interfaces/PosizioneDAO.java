package com.candidatoDB.pw2.interfaces;

import java.util.List;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;

public interface PosizioneDAO {
	List<Posizione> searchByCity (Citta citta);
<<<<<<< HEAD
	List<Posizione> searchByRuolo (String ruolo);
	List<Posizione> searchByCategoria (CategoriaPosizione categoriaPosizione);
=======
	List<Posizione> searchByRuolo(String ruolo);
>>>>>>> 5dba4e51be9ef55bcfc133d91da2c84da004ad58
}
