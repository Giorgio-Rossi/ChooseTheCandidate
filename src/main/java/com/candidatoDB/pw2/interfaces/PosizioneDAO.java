package com.candidatoDB.pw2.interfaces;

import java.util.List;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;

public interface PosizioneDAO {

	
	List<Posizione> searchByCity (Citta citta);
}
