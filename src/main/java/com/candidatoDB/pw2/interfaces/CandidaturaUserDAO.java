package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Utente;

import java.util.ArrayList;

public interface CandidaturaUserDAO {

    void Save (CandidaturaUser candidaturaUser);

    CandidaturaUser getCandidaturaUserById(int id_posizione, int id_user);


}
