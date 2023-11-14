package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Citta;

import java.util.ArrayList;

public interface CittaDAO {
    ArrayList<Citta> getAllCitta();
    Citta findByNome(String nome);
}
