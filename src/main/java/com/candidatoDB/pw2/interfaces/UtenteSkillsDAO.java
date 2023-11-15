package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.entity.Utente;

import java.util.ArrayList;

public interface UtenteSkillsDAO {

    ArrayList<Skill> getAllUserSkillVerifiedOrNot(Utente utente, boolean verificata);
}
