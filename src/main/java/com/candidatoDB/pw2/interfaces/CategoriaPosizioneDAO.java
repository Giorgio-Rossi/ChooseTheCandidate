package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.CategoriaPosizione;

import java.util.ArrayList;

public interface CategoriaPosizioneDAO {

    public CategoriaPosizione getCategoriaPosizioneById(int id_categoria);

    public ArrayList<CategoriaPosizione> getAllCategoriePosizioni();
}
