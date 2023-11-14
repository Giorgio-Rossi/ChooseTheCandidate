package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.CandidaturaUser;

public interface CandidaturaUserDAO {

    void Save (CandidaturaUser candidaturaUser);

    CandidaturaUser getCandidaturaUserById(int id_posizione, int id_user);
}
