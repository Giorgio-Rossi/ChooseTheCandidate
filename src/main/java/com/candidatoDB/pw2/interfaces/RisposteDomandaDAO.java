package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.RisposteDomande;

import java.util.ArrayList;

public interface RisposteDomandaDAO {

    ArrayList<RisposteDomande> getRisposteDomandaByIdDomanda(int id_domanda);
}
