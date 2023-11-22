package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.CategoriaPosizione;

import java.util.ArrayList;

public interface CategoriaPosizioneDAO {

     CategoriaPosizione getCategoriaPosizioneById(int id_categoria);

     ArrayList<CategoriaPosizione> getAllCategoriePosizioni();

     CategoriaPosizione getCategoriaById(int id_categoria);
}
